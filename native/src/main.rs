use rapier2d_f64::parry::bounding_volume::Aabb as ParryAabb;
use rapier2d_f64::parry::na::Point2;
use rapier2d_f64::parry::partitioning::Qbvh as ParryQbvh;

mod api;
mod bridge_generated;
mod bvh;
mod entity;
mod state;

fn main() {
    const iterations: u32 = 1000000;

    // Make a parry_2d_f64 test
    let mut aabbs = Vec::new();

    let mut start = std::time::Instant::now();
    for _ in 0..iterations {
        let x = fastrand::f64() * 1000.0;
        let y = fastrand::f64() * 1000.0;
        let one_aabb = ParryAabb::new(Point2::new(x, y), Point2::new(x + 20.0, y + 20.0));
        aabbs.push((0 as u64, one_aabb));
    }
    println!(
        "Time to generate iterations ParryAABBs: {:?}",
        start.elapsed()
    );

    // Now generate a BVH with it
    start = std::time::Instant::now();
    let mut bvh = ParryQbvh::new();
    bvh.clear_and_rebuild(aabbs.into_iter(), 0.0);
    println!("Time to generate ParryQbvh: {:?}", start.elapsed());

    // Now do iterations / 10 intersection tests
    start = std::time::Instant::now();
    for _ in 0..iterations / 10 {
        let x = fastrand::f64() * 1000.0;
        let y = fastrand::f64() * 1000.0;
        let one_aabb = ParryAabb::new(Point2::new(x, y), Point2::new(x + 20.0, y + 20.0));
        let mut results = Vec::new();
        bvh.intersect_aabb(&one_aabb, &mut results);
    }
    let time = start.elapsed();
    println!(
        "Time to do {} ParryQbvh intersection tests: {:?}",
        iterations / 10,
        time
    );
    let time_for_per_query_per_aabb =
        time.as_millis() as f64 / iterations as f64 / iterations as f64 * 10.0;
    println!(
        "Time for per query per aabb: {:?}",
        time_for_per_query_per_aabb
    );
    let time_for_500_queries_2000_aabbs = time_for_per_query_per_aabb * 500 as f64 * 2000 as f64;
    println!(
        "Time for 500 queries 2000 aabbs: {:?}",
        time_for_500_queries_2000_aabbs
    );
}
