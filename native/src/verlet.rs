use std::{
    ops::{Add, AddAssign, Deref, Div, Index, IndexMut, Mul, Sub, SubAssign},
    simd::{LaneCount, Mask, SimdFloat, SupportedLaneCount},
};

use rapier2d::{na::Vector2, prelude::Aabb};
use smallvec::SmallVec;

use crate::fast_list::FastList;

#[derive(Clone, Copy, Debug)]
pub struct FastVector2 {
    pub x: f32,
    pub y: f32,
}

impl FastVector2 {
    #[inline]
    pub fn new(x: f32, y: f32) -> Self {
        Self { x, y }
    }

    #[inline]
    pub fn magnitude_squared(&self) -> f32 {
        self.x * self.x + self.y * self.y
    }
}

impl Deref for FastVector2 {
    type Target = Vector2<f32>;

    #[inline]
    fn deref(&self) -> &Self::Target {
        unsafe { std::mem::transmute(self) }
    }
}

impl Add for FastVector2 {
    type Output = Self;

    #[inline]
    fn add(self, rhs: Self) -> Self::Output {
        Self::new(self.x + rhs.x, self.y + rhs.y)
    }
}

impl AddAssign for FastVector2 {
    #[inline]
    fn add_assign(&mut self, rhs: Self) {
        *self = Self::new(self.x + rhs.x, self.y + rhs.y);
    }
}

impl Sub for FastVector2 {
    type Output = Self;

    #[inline]
    fn sub(self, rhs: Self) -> Self::Output {
        Self::new(self.x - rhs.x, self.y - rhs.y)
    }
}

impl SubAssign for FastVector2 {
    #[inline]
    fn sub_assign(&mut self, rhs: Self) {
        *self = Self::new(self.x - rhs.x, self.y - rhs.y);
    }
}

impl Mul<f32> for FastVector2 {
    type Output = Self;

    #[inline]
    fn mul(self, rhs: f32) -> Self::Output {
        Self::new(self.x * rhs, self.y * rhs)
    }
}

impl Div<f32> for FastVector2 {
    type Output = Self;

    #[inline]
    fn div(self, rhs: f32) -> Self::Output {
        Self::new(self.x / rhs, self.y / rhs)
    }
}

impl From<[f32; 2]> for FastVector2 {
    #[inline]
    fn from(array: [f32; 2]) -> Self {
        Self::new(array[0], array[1])
    }
}

impl Into<[f32; 2]> for FastVector2 {
    #[inline]
    fn into(self) -> [f32; 2] {
        [self.x, self.y]
    }
}
impl<const N: usize> Into<FastVector2Simd<N>> for FastVector2
where
    LaneCount<N>: SupportedLaneCount,
{
    #[inline]
    fn into(self) -> FastVector2Simd<N> {
        FastVector2Simd::splat(self.x, self.y)
    }
}

// Fast Vector SIMD
#[derive(Clone, Copy, Debug)]
pub struct FastVector2Simd<const N: usize>
where
    LaneCount<N>: SupportedLaneCount,
{
    pub x: std::simd::Simd<f32, N>,
    pub y: std::simd::Simd<f32, N>,
}

impl<const N: usize> FastVector2Simd<N>
where
    LaneCount<N>: SupportedLaneCount,
{
    #[inline]
    pub fn new(x: std::simd::Simd<f32, N>, y: std::simd::Simd<f32, N>) -> Self {
        Self { x, y }
    }
    #[inline]
    pub fn from_slice(slice: &[FastVector2]) -> Self {
        let mut x = std::simd::Simd::<f32, N>::splat(0.0);
        let mut y = std::simd::Simd::<f32, N>::splat(0.0);
        for (i, v) in slice.iter().enumerate() {
            x[i] = v.x;
            y[i] = v.y;
        }
        Self { x, y }
    }

    #[inline]
    pub fn splat(x: f32, y: f32) -> Self {
        Self {
            x: std::simd::Simd::<f32, N>::splat(x),
            y: std::simd::Simd::<f32, N>::splat(y),
        }
    }

    #[inline]
    pub fn magnitude_squared(&self) -> std::simd::Simd<f32, N> {
        self.x * self.x + self.y * self.y
    }

    #[inline]
    pub fn sum(&self) -> FastVector2 {
        let x = self.x.reduce_sum();
        let y = self.y.reduce_sum();
        FastVector2::new(x, y)
    }

    #[inline]
    pub fn get(&self, index: usize) -> FastVector2 {
        FastVector2::new(self.x[index], self.y[index])
    }
    #[inline]
    pub fn set(&mut self, index: usize, value: FastVector2) {
        self.x[index] = value.x;
        self.y[index] = value.y;
    }

    #[inline]
    pub fn mask_select(&self, mask: Mask<i32, N>, other: Self) -> Self {
        Self {
            x: mask.select(self.x, other.x),
            y: mask.select(self.y, other.y),
        }
    }
    #[inline]
    pub fn mask_select_splat(&self, mask: Mask<i32, N>, value: f32) -> Self {
        let other = std::simd::Simd::<f32, N>::splat(value);
        Self {
            x: mask.select(self.x, other),
            y: mask.select(self.y, other),
        }
    }
}

impl<const N: usize> AddAssign for FastVector2Simd<N>
where
    LaneCount<N>: SupportedLaneCount,
{
    #[inline]
    fn add_assign(&mut self, rhs: Self) {
        *self = Self::new(self.x + rhs.x, self.y + rhs.y)
    }
}
impl<const N: usize> Add for FastVector2Simd<N>
where
    LaneCount<N>: SupportedLaneCount,
{
    type Output = Self;

    #[inline]
    fn add(self, rhs: Self) -> Self::Output {
        Self::new(self.x + rhs.x, self.y + rhs.y)
    }
}

impl<const N: usize> Sub for FastVector2Simd<N>
where
    LaneCount<N>: SupportedLaneCount,
{
    type Output = Self;

    #[inline]
    fn sub(self, rhs: Self) -> Self::Output {
        Self::new(self.x - rhs.x, self.y - rhs.y)
    }
}
impl<const N: usize> Sub for &FastVector2Simd<N>
where
    LaneCount<N>: SupportedLaneCount,
{
    type Output = FastVector2Simd<N>;

    #[inline]
    fn sub(self, rhs: Self) -> Self::Output {
        FastVector2Simd::new(self.x - rhs.x, self.y - rhs.y)
    }
}
impl<const N: usize> SubAssign for FastVector2Simd<N>
where
    LaneCount<N>: SupportedLaneCount,
{
    #[inline]
    fn sub_assign(&mut self, rhs: Self) {
        *self = Self::new(self.x - rhs.x, self.y - rhs.y)
    }
}

impl<const N: usize> Mul<std::simd::Simd<f32, N>> for FastVector2Simd<N>
where
    LaneCount<N>: SupportedLaneCount,
{
    type Output = Self;

    #[inline]
    fn mul(self, rhs: std::simd::Simd<f32, N>) -> Self::Output {
        Self::new(self.x * rhs, self.y * rhs)
    }
}
impl<const N: usize> Mul<f32> for FastVector2Simd<N>
where
    LaneCount<N>: SupportedLaneCount,
{
    type Output = Self;

    #[inline]
    fn mul(self, rhs: f32) -> Self::Output {
        let rhs = std::simd::Simd::<f32, N>::splat(rhs);
        Self::new(self.x * rhs, self.y * rhs)
    }
}

// Fast Aabb
#[derive(Clone, Copy, Debug)]
pub struct FastAabb {
    pub mins: FastVector2,
    pub maxs: FastVector2,
}

impl FastAabb {
    pub fn new_invalid() -> Self {
        Self {
            mins: FastVector2::new(f32::MAX, f32::MAX),
            maxs: FastVector2::new(f32::MIN, f32::MIN),
        }
    }

    pub fn new(min: FastVector2, max: FastVector2) -> Self {
        Self {
            mins: min,
            maxs: max,
        }
    }

    pub fn merge(&mut self, other: &Self) {
        self.mins.x = self.mins.x.min(other.mins.x);
        self.mins.y = self.mins.y.min(other.mins.y);
        self.maxs.x = self.maxs.x.max(other.maxs.x);
        self.maxs.y = self.maxs.y.max(other.maxs.y);
    }

    pub fn intersects_aabb(&self, other: &Self) -> bool {
        self.mins.x <= other.maxs.x
            && self.maxs.x >= other.mins.x
            && self.mins.y <= other.maxs.y
            && self.maxs.y >= other.mins.y
    }
}

fn is_prime(n: u64) -> bool {
    if n <= 1 {
        return false;
    }
    for i in 2..(n as f64).sqrt() as u64 + 1 {
        if n % i == 0 {
            return false;
        }
    }
    true
}

fn nth_prime(n: u64) -> u64 {
    let mut count = 0;
    let mut num = 2;
    while count < n {
        if is_prime(num) {
            count += 1;
        }
        num += 1;
    }
    num - 1
}

#[derive(Debug)]
// SoA (Structure of Arrays) layout
pub struct Bodies {
    pub ids: Vec<usize>,
    pub positions: Vec<FastVector2>,
    pub old_positions: Vec<FastVector2>,
    pub accelerations: Vec<FastVector2>,
    pub frictions: Vec<f32>,
    pub ground_frictions: Vec<f32>,
    pub radii: Vec<f32>,
    pub radii_squared: Vec<f32>,
}

impl Bodies {
    pub fn new() -> Self {
        Self {
            ids: Vec::new(),
            positions: Vec::new(),
            old_positions: Vec::new(),
            accelerations: Vec::new(),
            frictions: Vec::new(),
            ground_frictions: Vec::new(),
            radii: Vec::new(),
            radii_squared: Vec::new(),
        }
    }

    pub fn add(&mut self, position: FastVector2, radius: f32, mass: f32) -> usize {
        let id = self.positions.len();
        self.ids.push(id);
        self.positions.push(position);
        self.old_positions.push(position);
        self.accelerations.push(FastVector2::new(0.0, 0.0));
        self.frictions.push(0.0);
        self.ground_frictions.push(0.0);
        self.radii.push(radius);
        self.radii_squared.push(radius * radius);
        id
    }

    pub fn remove(&mut self, id: usize) {
        let index = self.ids.iter().position(|&x| x == id).unwrap();
        self.ids.remove(index);
        self.positions.remove(index);
        self.old_positions.remove(index);
        self.accelerations.remove(index);
        self.frictions.remove(index);
        self.ground_frictions.remove(index);
        self.radii.remove(index);
        self.radii_squared.remove(index);
    }

    pub fn len(&self) -> usize {
        self.positions.len()
    }

    // Position
    pub fn positions(&self) -> &[FastVector2] {
        &self.positions
    }
    #[inline]
    pub fn get_position(&self, index: usize) -> FastVector2 {
        unsafe { *self.positions.get_unchecked(index) }
    }
    pub fn set_position(&mut self, index: usize, position: FastVector2) {
        self.positions[index] = position;
        self.old_positions[index] = position;
    }
    #[inline]
    pub fn set_position_keep_old(&mut self, index: usize, position: FastVector2) {
        unsafe {
            *self.positions.get_unchecked_mut(index) = position;
        }
    }
    pub fn set_position_keep_velocity(&mut self, index: usize, position: FastVector2) {
        let velocity = self.positions[index] - self.old_positions[index];
        self.positions[index] = position;
        self.old_positions[index] = position - velocity;
    }
    pub fn set_velocity(&mut self, index: usize, velocity: FastVector2) {
        self.old_positions[index] = self.positions[index] - velocity;
    }

    // Old position
    #[inline]
    pub fn get_old_position(&self, index: usize) -> FastVector2 {
        unsafe { *self.old_positions.get_unchecked(index) }
    }
    #[inline]
    pub fn set_old_position(&mut self, index: usize, old_position: FastVector2) {
        unsafe {
            *self.old_positions.get_unchecked_mut(index) = old_position;
        }
    }

    // Radius
    pub fn radii(&self) -> &[f32] {
        &self.radii
    }
    #[inline]
    pub fn get_radius(&self, index: usize) -> f32 {
        self.radii[index]
    }
    #[inline]
    pub fn get_radius_squared(&self, index: usize) -> f32 {
        self.radii_squared[index]
    }
    #[inline]
    pub fn set_radius(&mut self, index: usize, radius: f32) {
        self.radii[index] = radius;
        self.radii_squared[index] = radius * radius;
    }

    // Acceleration
    pub fn get_acceleration(&self, index: usize) -> FastVector2 {
        self.accelerations[index]
    }
    pub fn set_acceleration(&mut self, index: usize, acceleration: FastVector2) {
        self.accelerations[index] = acceleration;
    }

    // Bounding box
    pub fn aabbs(&self) -> Vec<FastAabb> {
        self.ids.iter().map(|&id| self.get_aabb(id)).collect()
    }
    pub fn get_aabb(&self, index: usize) -> FastAabb {
        let radius = self.radii[index];
        let radius_vec = FastVector2::new(radius, radius);
        let position = self.positions[index];
        FastAabb::new(position - radius_vec, position + radius_vec)
    }
}
