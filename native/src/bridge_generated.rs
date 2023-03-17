#![allow(
    non_camel_case_types,
    unused,
    clippy::redundant_closure,
    clippy::useless_conversion,
    clippy::unit_arg,
    clippy::double_parens,
    non_snake_case,
    clippy::too_many_arguments
)]
// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.69.0.

use crate::api::*;
use core::panic::UnwindSafe;
use flutter_rust_bridge::*;
use std::ffi::c_void;
use std::sync::Arc;

// Section: imports

use crate::flat_bvh::FlatBVH;

// Section: wire functions

fn wire_say_hello_async_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "say_hello_async",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| Ok(say_hello_async()),
    )
}
fn wire_morton_codes_async_impl(
    port_: MessagePort,
    xs: impl Wire2Api<Vec<f64>> + UnwindSafe,
    ys: impl Wire2Api<Vec<f64>> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "morton_codes_async",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_xs = xs.wire2api();
            let api_ys = ys.wire2api();
            move |task_callback| Ok(morton_codes_async(api_xs, api_ys))
        },
    )
}
fn wire_morton_codes_impl(
    xs: impl Wire2Api<Vec<f64>> + UnwindSafe,
    ys: impl Wire2Api<Vec<f64>> + UnwindSafe,
) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "morton_codes",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_xs = xs.wire2api();
            let api_ys = ys.wire2api();
            Ok(morton_codes(api_xs, api_ys))
        },
    )
}
fn wire_aabb_new_impl(
    min_x: impl Wire2Api<f64> + UnwindSafe,
    min_y: impl Wire2Api<f64> + UnwindSafe,
    max_x: impl Wire2Api<f64> + UnwindSafe,
    max_y: impl Wire2Api<f64> + UnwindSafe,
) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "aabb_new",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_min_x = min_x.wire2api();
            let api_min_y = min_y.wire2api();
            let api_max_x = max_x.wire2api();
            let api_max_y = max_y.wire2api();
            Ok(aabb_new(api_min_x, api_min_y, api_max_x, api_max_y))
        },
    )
}
fn wire_aabb_new_bulk_impl(
    points: impl Wire2Api<Vec<f64>> + UnwindSafe,
) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "aabb_new_bulk",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_points = points.wire2api();
            Ok(aabb_new_bulk(api_points))
        },
    )
}
fn wire_aabb_drop_bulk_impl(
    aabb_ids: impl Wire2Api<Vec<Index>> + UnwindSafe,
) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "aabb_drop_bulk",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_aabb_ids = aabb_ids.wire2api();
            Ok(aabb_drop_bulk(api_aabb_ids))
        },
    )
}
fn wire_aabb_min_impl(aabb_id: impl Wire2Api<Index> + UnwindSafe) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "aabb_min",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_aabb_id = aabb_id.wire2api();
            Ok(aabb_min(api_aabb_id))
        },
    )
}
fn wire_aabb_max_impl(aabb_id: impl Wire2Api<Index> + UnwindSafe) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "aabb_max",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_aabb_id = aabb_id.wire2api();
            Ok(aabb_max(api_aabb_id))
        },
    )
}
fn wire_aabb_size_impl(aabb_id: impl Wire2Api<Index> + UnwindSafe) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "aabb_size",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_aabb_id = aabb_id.wire2api();
            Ok(aabb_size(api_aabb_id))
        },
    )
}
fn wire_aabb_center_impl(aabb_id: impl Wire2Api<Index> + UnwindSafe) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "aabb_center",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_aabb_id = aabb_id.wire2api();
            Ok(aabb_center(api_aabb_id))
        },
    )
}
fn wire_aabb_intersects_aabb_impl(
    aabb_left_id: impl Wire2Api<Index> + UnwindSafe,
    aabb_right_id: impl Wire2Api<Index> + UnwindSafe,
) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "aabb_intersects_aabb",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_aabb_left_id = aabb_left_id.wire2api();
            let api_aabb_right_id = aabb_right_id.wire2api();
            Ok(aabb_intersects_aabb(api_aabb_left_id, api_aabb_right_id))
        },
    )
}
fn wire_aabb_contains_point_impl(
    aabb_id: impl Wire2Api<Index> + UnwindSafe,
    point: impl Wire2Api<[f64; 2]> + UnwindSafe,
) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "aabb_contains_point",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_aabb_id = aabb_id.wire2api();
            let api_point = point.wire2api();
            Ok(aabb_contains_point(api_aabb_id, api_point))
        },
    )
}
fn wire_aabb_contains_aabb_impl(
    aabb_left_id: impl Wire2Api<Index> + UnwindSafe,
    aabb_right_id: impl Wire2Api<Index> + UnwindSafe,
) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "aabb_contains_aabb",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_aabb_left_id = aabb_left_id.wire2api();
            let api_aabb_right_id = aabb_right_id.wire2api();
            Ok(aabb_contains_aabb(api_aabb_left_id, api_aabb_right_id))
        },
    )
}
fn wire_aabb_merge_impl(
    aabb_left_id: impl Wire2Api<Index> + UnwindSafe,
    aabb_right_id: impl Wire2Api<Index> + UnwindSafe,
) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "aabb_merge",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_aabb_left_id = aabb_left_id.wire2api();
            let api_aabb_right_id = aabb_right_id.wire2api();
            Ok(aabb_merge(api_aabb_left_id, api_aabb_right_id))
        },
    )
}
fn wire_aabb_merge_with_impl(
    port_: MessagePort,
    aabb: impl Wire2Api<Index> + UnwindSafe,
    other: impl Wire2Api<Index> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "aabb_merge_with",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_aabb = aabb.wire2api();
            let api_other = other.wire2api();
            move |task_callback| Ok(aabb_merge_with(api_aabb, api_other))
        },
    )
}
fn wire_bvh_new_impl(aabbs: impl Wire2Api<Vec<Index>> + UnwindSafe) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "bvh_new",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_aabbs = aabbs.wire2api();
            Ok(bvh_new(api_aabbs))
        },
    )
}
fn wire_bvh_new_async_impl(port_: MessagePort, aabbs: impl Wire2Api<Vec<Index>> + UnwindSafe) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "bvh_new_async",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_aabbs = aabbs.wire2api();
            move |task_callback| Ok(bvh_new_async(api_aabbs))
        },
    )
}
fn wire_bvh_drop_impl(bvh_id: impl Wire2Api<Index> + UnwindSafe) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "bvh_drop",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_bvh_id = bvh_id.wire2api();
            Ok(bvh_drop(api_bvh_id))
        },
    )
}
fn wire_bvh_flatten_impl(bvh_id: impl Wire2Api<Index> + UnwindSafe) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "bvh_flatten",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_bvh_id = bvh_id.wire2api();
            Ok(bvh_flatten(api_bvh_id))
        },
    )
}
fn wire_bvh_flatten_async_impl(port_: MessagePort, bvh_id: impl Wire2Api<Index> + UnwindSafe) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "bvh_flatten_async",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_bvh_id = bvh_id.wire2api();
            move |task_callback| Ok(bvh_flatten_async(api_bvh_id))
        },
    )
}
fn wire_bvh_depth_impl(bvh_id: impl Wire2Api<Index> + UnwindSafe) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "bvh_depth",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_bvh_id = bvh_id.wire2api();
            Ok(bvh_depth(api_bvh_id))
        },
    )
}
fn wire_bvh_depth_async_impl(port_: MessagePort, bvh_id: impl Wire2Api<Index> + UnwindSafe) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "bvh_depth_async",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_bvh_id = bvh_id.wire2api();
            move |task_callback| Ok(bvh_depth_async(api_bvh_id))
        },
    )
}
fn wire_bvh_query_aabb_collisions_impl(
    bvh_id: impl Wire2Api<Index> + UnwindSafe,
    aabb_id: impl Wire2Api<Index> + UnwindSafe,
) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "bvh_query_aabb_collisions",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_bvh_id = bvh_id.wire2api();
            let api_aabb_id = aabb_id.wire2api();
            Ok(bvh_query_aabb_collisions(api_bvh_id, api_aabb_id))
        },
    )
}
fn wire_bvh_query_aabb_collisions_min_max_impl(
    bvh_id: impl Wire2Api<Index> + UnwindSafe,
    min_x: impl Wire2Api<f64> + UnwindSafe,
    min_y: impl Wire2Api<f64> + UnwindSafe,
    max_x: impl Wire2Api<f64> + UnwindSafe,
    max_y: impl Wire2Api<f64> + UnwindSafe,
) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "bvh_query_aabb_collisions_min_max",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_bvh_id = bvh_id.wire2api();
            let api_min_x = min_x.wire2api();
            let api_min_y = min_y.wire2api();
            let api_max_x = max_x.wire2api();
            let api_max_y = max_y.wire2api();
            Ok(bvh_query_aabb_collisions_min_max(
                api_bvh_id, api_min_x, api_min_y, api_max_x, api_max_y,
            ))
        },
    )
}
fn wire_bvh_query_point_collisions_impl(
    bvh_id: impl Wire2Api<Index> + UnwindSafe,
    x: impl Wire2Api<f64> + UnwindSafe,
    y: impl Wire2Api<f64> + UnwindSafe,
) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "bvh_query_point_collisions",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_bvh_id = bvh_id.wire2api();
            let api_x = x.wire2api();
            let api_y = y.wire2api();
            Ok(bvh_query_point_collisions(api_bvh_id, api_x, api_y))
        },
    )
}
fn wire_bvh_print_impl(bvh_id: impl Wire2Api<Index> + UnwindSafe) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "bvh_print",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_bvh_id = bvh_id.wire2api();
            Ok(bvh_print(api_bvh_id))
        },
    )
}
fn wire_bvh_print_async_impl(port_: MessagePort, bvh_id: impl Wire2Api<Index> + UnwindSafe) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "bvh_print_async",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_bvh_id = bvh_id.wire2api();
            move |task_callback| Ok(bvh_print_async(api_bvh_id))
        },
    )
}
fn wire_bvh_overlap_ratio_impl(
    bvh_id: impl Wire2Api<Index> + UnwindSafe,
) -> support::WireSyncReturn {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync(
        WrapInfo {
            debug_name: "bvh_overlap_ratio",
            port: None,
            mode: FfiCallMode::Sync,
        },
        move || {
            let api_bvh_id = bvh_id.wire2api();
            Ok(bvh_overlap_ratio(api_bvh_id))
        },
    )
}
// Section: wrapper structs

// Section: static checks

// Section: allocate functions

// Section: related functions

// Section: impl Wire2Api

pub trait Wire2Api<T> {
    fn wire2api(self) -> T;
}

impl<T, S> Wire2Api<Option<T>> for *mut S
where
    *mut S: Wire2Api<T>,
{
    fn wire2api(self) -> Option<T> {
        (!self.is_null()).then(|| self.wire2api())
    }
}

impl Wire2Api<f64> for f64 {
    fn wire2api(self) -> f64 {
        self
    }
}

impl Wire2Api<u64> for u64 {
    fn wire2api(self) -> u64 {
        self
    }
}
impl Wire2Api<usize> for usize {
    fn wire2api(self) -> usize {
        self
    }
}
// Section: impl IntoDart

impl support::IntoDart for FlatBVH {
    fn into_dart(self) -> support::DartAbi {
        vec![
            self.min_x.into_dart(),
            self.min_y.into_dart(),
            self.max_x.into_dart(),
            self.max_y.into_dart(),
            self.depth.into_dart(),
        ]
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for FlatBVH {}

impl support::IntoDart for Index {
    fn into_dart(self) -> support::DartAbi {
        vec![self.index.into_dart(), self.generation.into_dart()].into_dart()
    }
}
impl support::IntoDartExceptPrimitive for Index {}

// Section: executor

support::lazy_static! {
    pub static ref FLUTTER_RUST_BRIDGE_HANDLER: support::DefaultHandler = Default::default();
}

/// cbindgen:ignore
#[cfg(target_family = "wasm")]
#[path = "bridge_generated.web.rs"]
mod web;
#[cfg(target_family = "wasm")]
pub use web::*;

#[cfg(not(target_family = "wasm"))]
#[path = "bridge_generated.io.rs"]
mod io;
#[cfg(not(target_family = "wasm"))]
pub use io::*;
