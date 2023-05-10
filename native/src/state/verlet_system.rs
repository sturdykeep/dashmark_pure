use std::{cell::RefCell, rc::Rc};

use rapier2d::{na::Vector2, prelude::Aabb};

use crate::{
    grid::SpatialGrid,
    thread::{get_logical_core_count, ThreadPool},
    verlet::{Bodies, FastVector2},
};

use super::transform_manager::TransformManager;

pub struct VerletSystem {
    pub sub_steps: u8,
    pub prev_delta_time: f64,
    pub screen_size: Vector2<f32>,
    pub collision_damping: f32, // how much of the velocity is lost on collision

    bodies: Bodies,

    gravity: FastVector2,

    biggest_radius: f32,
    grid: Rc<RefCell<SpatialGrid<8>>>,
    // threadpool: ThreadPool,
}

impl VerletSystem {
    pub fn new() -> Self {
        Self {
            sub_steps: 5,
            prev_delta_time: 0.0,
            screen_size: Vector2::new(0.0, 0.0),
            collision_damping: 0.5,
            bodies: Bodies::new(),
            gravity: FastVector2::new(0.0, 32.0 * 20.0),
            biggest_radius: 0.0,
            grid: Rc::new(RefCell::new(SpatialGrid::new(0.0))),
            // threadpool: ThreadPool::new(get_logical_core_count()),
        }
    }

    pub fn screen_size(&mut self, width: f32, height: f32) {
        if width == self.screen_size.x && height == self.screen_size.y {
            return;
        }

        self.screen_size = Vector2::new(width, height);
    }

    pub fn new_body(&mut self, position: FastVector2, radius: f32) {
        if radius > self.biggest_radius {
            self.biggest_radius = radius;
            self.grid.borrow_mut().set_cell_size(radius * 2.1);
        }
        self.bodies.add(position, radius, 0.0);
    }

    pub fn bodies(&self) -> &Bodies {
        &self.bodies
    }

    pub fn bodies_mut(&mut self) -> &mut Bodies {
        &mut self.bodies
    }

    pub fn simulate(&mut self, dt: f64) {
        // Skip until the threadpool is ready
        // if self.threadpool.initialized() == false {
        //     return;
        // }

        let target_fps = 60.0;
        let target_frame_time = 1.0 / target_fps;
        let min_sub_steps = 1;
        let max_sub_steps = 48;

        let sub_steps = (((dt / target_frame_time) * self.sub_steps as f64).round() as u8)
            .clamp(min_sub_steps, max_sub_steps);

        let sub_dt = dt / sub_steps as f64;

        let mut checked_potentials = 0;
        let mut checked_cells = 0;
        for _ in 0..sub_steps {
            {
                let mut grid = self.grid.borrow_mut();
                let aabbs = self.bodies.aabbs();
                grid.clear_and_rebuild(aabbs.as_ref());
            }
            self.solve_collisions(&mut checked_potentials, &mut checked_cells);
            self.update_bodies(sub_dt);
        }

        let potentials_per_body_per_step =
            checked_potentials as f64 / self.bodies.len() as f64 / sub_steps as f64;
        let cells_per_body_per_step =
            checked_cells as f64 / self.bodies.len() as f64 / sub_steps as f64;
        log::debug!(
            "Checked {} potentials and {} cells per body per step",
            potentials_per_body_per_step,
            cells_per_body_per_step
        );

        // Calculate average atoms per cell
        let grid = self.grid.borrow();
        let cells = grid.cells();
        let mut total_atoms = 0;
        let mut total_cells = 0;
        for cell in cells {
            let atoms = cell.len();
            if atoms > 0 {
                total_atoms += atoms;
                total_cells += 1;
            }
        }
        let average_atoms_per_cell = total_atoms as f64 / total_cells as f64;
        log::debug!("Average atoms per cell: {}", average_atoms_per_cell);
    }

    pub fn solve_collisions(&mut self, checked_potentials: &mut u32, checked_cells: &mut u32) {
        let grid = self.grid.clone();
        let grid = grid.borrow();
        for (a, b) in grid.iter_collisions() {
            let a = a as usize;
            let b = b as usize;
            self.solve_contact(a, b);
            *checked_potentials += 1;
        }
    }

    #[inline]
    fn fast_inv_sqrt(x: f32) -> f32 {
        #[cfg(not(target_arch = "x86_64"))]
        {
            x.sqrt().recip()
        }
        #[cfg(target_arch = "x86_64")]
        {
            use core::arch::x86_64::{_mm_cvtss_f32, _mm_rsqrt_ss, _mm_set_ss};

            unsafe {
                let x = _mm_rsqrt_ss(_mm_set_ss(x));
                _mm_cvtss_f32(x)
            }
        }
    }

    pub fn solve_contact(&mut self, a: usize, b: usize) {
        // Get values
        let mut a_pos = self.bodies.get_position(a);
        let mut b_pos = self.bodies.get_position(b);
        let a_radius = self.bodies.get_radius(a);
        let b_radius = self.bodies.get_radius(b);

        let distance_vec = a_pos - b_pos;
        let distance_squared = distance_vec.magnitude_squared();
        let radius_sum = a_radius + b_radius;
        let radius_sum_squared = radius_sum * radius_sum;

        if distance_squared > f32::EPSILON && distance_squared < radius_sum_squared {
            let inv_distance = Self::fast_inv_sqrt(distance_squared);
            let delta = 0.5 * (radius_sum - distance_squared * inv_distance);

            let collision_vector = distance_vec * (delta * inv_distance) * self.collision_damping;
            a_pos += collision_vector;
            b_pos -= collision_vector;
        };

        // Write values
        self.bodies.set_position_keep_old(a, a_pos);
        self.bodies.set_position_keep_old(b, b_pos);
    }

    pub fn update_bodies(&mut self, delta_time: f64) {
        let gravity = self.gravity;
        let current_to_prev_delta = delta_time / self.prev_delta_time;
        let current_plus_prev_by_two_mul_by_current =
            (delta_time + self.prev_delta_time) / 2.0 * delta_time;

        for body in 0..self.bodies.len() {
            let mut body_position = self.bodies.get_position(body);
            let mut body_old_position = self.bodies.get_old_position(body);
            let mut body_acceleration = self.bodies.get_acceleration(body);
            let radius = self.bodies.get_radius(body);

            // Apply gravity
            body_acceleration = body_acceleration + gravity;

            let velocity = body_position - body_old_position;
            let new_position = body_position
                + velocity * current_to_prev_delta as f32
                + body_acceleration * current_plus_prev_by_two_mul_by_current as f32;
            body_old_position = body_position;
            body_position = new_position;
            body_acceleration = FastVector2::new(0.0, 0.0);

            // Apply map constraints
            let radius = radius;
            if body_position.x < radius {
                body_position.x = radius;
            }
            if body_position.x > self.screen_size.x - radius {
                body_position.x = self.screen_size.x - radius;
            }
            if body_position.y < radius {
                body_position.y = radius;
            }
            if body_position.y > self.screen_size.y - radius {
                body_position.y = self.screen_size.y - radius;
            }

            // Write changes
            self.bodies.set_position_keep_old(body, body_position);
            self.bodies.set_old_position(body, body_old_position);
            self.bodies.set_acceleration(body, body_acceleration);
        }

        self.prev_delta_time = delta_time;
    }

    pub fn apply_to_transforms(&self, transforms: &mut TransformManager) {
        for (body_index, transform) in (0..self.bodies.len())
            .into_iter()
            .zip(transforms.iter_mut())
        {
            let position = self.bodies.get_position(body_index);
            transform.set_position(position.into());
        }
    }
}
