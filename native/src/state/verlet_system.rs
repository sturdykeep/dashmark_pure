use rapier2d::{na::Vector2, prelude::Aabb};

use crate::{
    grid::SpatialGrid,
    thread::{get_logical_core_count, ThreadPool},
    verlet::Body,
};

use super::transform_manager::TransformManager;

pub struct VerletSystem {
    pub sub_steps: u8,
    pub prev_delta_time: f64,
    pub screen_size: Vector2<f32>,
    pub collision_damping: f32, // how much of the velocity is lost on collision

    bodies: Vec<Body>,

    gravity: Vector2<f32>,

    biggest_radius: f32,
    grid: SpatialGrid,
    // threadpool: ThreadPool,
}

impl VerletSystem {
    pub fn new() -> Self {
        Self {
            sub_steps: 4,
            prev_delta_time: 0.0,
            screen_size: Vector2::new(0.0, 0.0),
            collision_damping: 0.5,
            bodies: Vec::new(),
            gravity: Vector2::new(0.0, 32.0 * 20.0),
            biggest_radius: 0.0,
            grid: SpatialGrid::new(0.0),
            // threadpool: ThreadPool::new(get_logical_core_count()),
        }
    }

    pub fn screen_size(&mut self, width: f32, height: f32) {
        if width == self.screen_size.x && height == self.screen_size.y {
            return;
        }

        self.screen_size = Vector2::new(width, height);
        let biggest_radius = if self.biggest_radius == 0.0 {
            100.0
        } else {
            self.biggest_radius
        };
        self.grid = SpatialGrid::new(biggest_radius * 2.0);
    }

    pub fn new_body(&mut self, position: Vector2<f32>, radius: f32) {
        let id = self.bodies.len();
        let mut body = Body::new(id);
        body.position = position;
        body.old_position = position;
        body.radius = radius;
        if radius > self.biggest_radius {
            self.biggest_radius = radius;
            self.grid = SpatialGrid::new(self.biggest_radius * 2.0);
        }
        self.bodies.push(body);
    }

    pub fn add_body(&mut self, body: Body) {
        self.bodies.push(body);
    }

    pub fn get_bodies(&self) -> &[Body] {
        &self.bodies
    }

    pub fn get_aabbs(&self) -> Vec<Aabb> {
        self.bodies.iter().map(|b| b.aabb()).collect()
    }

    pub fn body(&self, index: usize) -> Option<&Body> {
        self.bodies.get(index)
    }

    pub fn body_mut(&mut self, index: usize) -> Option<&mut Body> {
        self.bodies.get_mut(index)
    }

    pub fn simulate(&mut self, dt: f64) {
        // Skip until the threadpool is ready
        // if self.threadpool.initialized() == false {
        //     return;
        // }

        let target_fps = 60.0;
        let target_frame_time = 1.0 / target_fps;
        let min_sub_steps = 1;
        let max_sub_steps = 32;

        let sub_steps = (((dt / target_frame_time) * self.sub_steps as f64).round() as u8)
            .clamp(min_sub_steps, max_sub_steps);

        let sub_dt = dt / sub_steps as f64;
        for _ in 0..sub_steps {
            self.grid.clear();
            for body in &mut self.bodies {
                self.grid
                    .add_atom_aabb(body.id, body.position.x, body.position.y, body.radius);
            }
            self.solve_collisions();
            self.update_bodies(sub_dt);
        }
    }

    pub fn solve_collisions(&mut self) {
        let grid = &self.grid;
        for body_index in 0..self.bodies.len() {
            let body = &self.bodies[body_index];
            let potentials = grid.query(body.position.x, body.position.y, body.radius);
            for other_bodies in potentials {
                for other_body_index in other_bodies.data() {
                    Self::solve_contact(body_index, *other_body_index, &mut self.bodies);
                }
            }
        }
    }

    fn fast_inv_sqrt(x: f32) -> f32 {
        let xhalf = 0.5f32 * x;
        let mut i = x.to_bits();
        i = 0x5f3759df - (i >> 1);
        let y = f32::from_bits(i);
        y * (1.5f32 - xhalf * y * y)
    }

    pub fn solve_contact(a: usize, b: usize, bodies: &mut [Body]) {
        if a == b {
            return;
        }

        let (body_a, body_b) = Self::bodies_get_a_and_b_mut(bodies, a, b);
        let distance_vec = body_a.position - body_b.position;
        let distance_squared = distance_vec.magnitude_squared();
        let radius_sum = body_a.radius + body_b.radius;
        let radius_sum_squared = radius_sum * radius_sum;

        if distance_squared == 0.0 {
            body_a.position.y += 0.1;
        } else if distance_squared > f32::EPSILON && distance_squared < radius_sum_squared {
            let inv_distance = if distance_squared > 1.0 {
                Self::fast_inv_sqrt(distance_squared)
            } else {
                1.0 / distance_squared.sqrt()
            };
            let delta = 0.5 * (radius_sum - distance_squared * inv_distance);
            let collision_vector = distance_vec * (delta * inv_distance);
            body_a.position += collision_vector;
            body_b.position -= collision_vector;
        }
    }

    pub fn bodies_get_a_and_b_mut(
        bodies: &mut [Body],
        a: usize,
        b: usize,
    ) -> (&mut Body, &mut Body) {
        assert!(a != b, "Indices must be different");
        let (min_idx, max_idx) = if a < b { (a, b) } else { (b, a) };
        let (first, second) = bodies.split_at_mut(max_idx);
        (&mut first[min_idx], &mut second[0])
    }

    pub fn update_bodies(&mut self, delta_time: f64) {
        let gravity = self.gravity;
        let current_to_prev_delta = delta_time / self.prev_delta_time;
        let current_plus_prev_by_two_mul_by_current =
            (delta_time + self.prev_delta_time) / 2.0 * delta_time;

        for body in &mut self.bodies {
            // Apply gravity
            body.acceleration += gravity;

            let velocity = body.position - body.old_position;
            let new_position = body.position
                + velocity * current_to_prev_delta as f32
                + body.acceleration * current_plus_prev_by_two_mul_by_current as f32;
            body.old_position = body.position;
            body.position = new_position;
            body.acceleration = Vector2::new(0.0, 0.0);

            // Apply map constraints
            let radius = body.radius;
            if body.position.x < radius {
                body.position.x = radius;
            }
            if body.position.x > self.screen_size.x - radius {
                body.position.x = self.screen_size.x - radius;
            }
            if body.position.y < radius {
                body.position.y = radius;
            }
            if body.position.y > self.screen_size.y - radius {
                body.position.y = self.screen_size.y - radius;
            }
        }

        self.prev_delta_time = delta_time;
    }

    pub fn apply_to_transforms(&self, transforms: &mut TransformManager) {
        for (body, transform) in self.bodies.iter().zip(transforms.iter_mut()) {
            transform.set_position(body.position.into());
        }
    }
}
