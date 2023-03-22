use super::*;
// Section: wire functions

#[wasm_bindgen]
pub fn wire_say_hello(port_: MessagePort) {
    wire_say_hello_impl(port_)
}

#[wasm_bindgen]
pub fn wire_create_entity() -> support::WireSyncReturn {
    wire_create_entity_impl()
}

#[wasm_bindgen]
pub fn wire_drop_entity(index: JsValue) -> support::WireSyncReturn {
    wire_drop_entity_impl(index)
}

#[wasm_bindgen]
pub fn wire_entity_set_position(index: JsValue, x: f64, y: f64) -> support::WireSyncReturn {
    wire_entity_set_position_impl(index, x, y)
}

#[wasm_bindgen]
pub fn wire_entities_set_position_raw(
    indices: Box<[u8]>,
    positions: Box<[u8]>,
) -> support::WireSyncReturn {
    wire_entities_set_position_raw_impl(indices, positions)
}

#[wasm_bindgen]
pub fn wire_entity_set_origin(
    index: JsValue,
    relative: bool,
    x: f64,
    y: f64,
) -> support::WireSyncReturn {
    wire_entity_set_origin_impl(index, relative, x, y)
}

#[wasm_bindgen]
pub fn wire_entity_set_rotation(index: JsValue, rotation: f64) -> support::WireSyncReturn {
    wire_entity_set_rotation_impl(index, rotation)
}

#[wasm_bindgen]
pub fn wire_entities_set_rotation_raw(
    indices: Box<[u8]>,
    rotations: Box<[u8]>,
) -> support::WireSyncReturn {
    wire_entities_set_rotation_raw_impl(indices, rotations)
}

#[wasm_bindgen]
pub fn wire_entity_set_shape(index: JsValue, shape: JsValue) -> support::WireSyncReturn {
    wire_entity_set_shape_impl(index, shape)
}

#[wasm_bindgen]
pub fn wire_create_bvh() -> support::WireSyncReturn {
    wire_create_bvh_impl()
}

#[wasm_bindgen]
pub fn wire_drop_bvh(index: JsValue) -> support::WireSyncReturn {
    wire_drop_bvh_impl(index)
}

#[wasm_bindgen]
pub fn wire_bvh_clear_and_rebuild(
    index: JsValue,
    entities: JsValue,
    dilation_factor: f64,
) -> support::WireSyncReturn {
    wire_bvh_clear_and_rebuild_impl(index, entities, dilation_factor)
}

#[wasm_bindgen]
pub fn wire_bvh_clear_and_rebuild_raw(
    index: JsValue,
    data: Box<[u8]>,
    dilation_factor: f64,
) -> support::WireSyncReturn {
    wire_bvh_clear_and_rebuild_raw_impl(index, data, dilation_factor)
}

#[wasm_bindgen]
pub fn wire_bvh_flatten(index: JsValue) -> support::WireSyncReturn {
    wire_bvh_flatten_impl(index)
}

// Section: allocate functions

// Section: related functions

// Section: impl Wire2Api

impl Wire2Api<ZeroCopyBuffer<Vec<u8>>> for Box<[u8]> {
    fn wire2api(self) -> ZeroCopyBuffer<Vec<u8>> {
        ZeroCopyBuffer(self.wire2api())
    }
}

impl Wire2Api<Vec<Box<Shape>>> for JsValue {
    fn wire2api(self) -> Vec<Box<Shape>> {
        self.dyn_into::<JsArray>()
            .unwrap()
            .iter()
            .map(Wire2Api::<Shape>::wire2api)
            .collect()
    }
}
impl Wire2Api<Vec<RawIndex>> for JsValue {
    fn wire2api(self) -> Vec<RawIndex> {
        self.dyn_into::<JsArray>()
            .unwrap()
            .iter()
            .map(Wire2Api::wire2api)
            .collect()
    }
}
impl Wire2Api<Vec<ShapeTransform>> for JsValue {
    fn wire2api(self) -> Vec<ShapeTransform> {
        self.dyn_into::<JsArray>()
            .unwrap()
            .iter()
            .map(Wire2Api::wire2api)
            .collect()
    }
}
impl Wire2Api<RawIndex> for JsValue {
    fn wire2api(self) -> RawIndex {
        let self_ = self.dyn_into::<JsArray>().unwrap();
        assert_eq!(
            self_.length(),
            2,
            "Expected 2 elements, got {}",
            self_.length()
        );
        RawIndex(self_.get(0).wire2api(), self_.get(1).wire2api())
    }
}
impl Wire2Api<Shape> for JsValue {
    fn wire2api(self) -> Shape {
        let self_ = self.unchecked_into::<JsArray>();
        match self_.get(0).unchecked_into_f64() as _ {
            0 => Shape::Ball {
                radius: self_.get(1).wire2api(),
            },
            1 => Shape::Compound {
                children: self_.get(1).wire2api(),
                transforms: self_.get(2).wire2api(),
            },
            _ => unreachable!(),
        }
    }
}
impl Wire2Api<ShapeTransform> for JsValue {
    fn wire2api(self) -> ShapeTransform {
        let self_ = self.dyn_into::<JsArray>().unwrap();
        assert_eq!(
            self_.length(),
            5,
            "Expected 5 elements, got {}",
            self_.length()
        );
        ShapeTransform {
            position_x: self_.get(0).wire2api(),
            position_y: self_.get(1).wire2api(),
            rotation: self_.get(2).wire2api(),
            absolute_origin_x: self_.get(3).wire2api(),
            absolute_origin_y: self_.get(4).wire2api(),
        }
    }
}

impl Wire2Api<Vec<u8>> for Box<[u8]> {
    fn wire2api(self) -> Vec<u8> {
        self.into_vec()
    }
}

// Section: impl Wire2Api for JsValue

impl Wire2Api<ZeroCopyBuffer<Vec<u8>>> for JsValue {
    fn wire2api(self) -> ZeroCopyBuffer<Vec<u8>> {
        ZeroCopyBuffer(self.wire2api())
    }
}
impl Wire2Api<bool> for JsValue {
    fn wire2api(self) -> bool {
        self.is_truthy()
    }
}
impl Wire2Api<Box<Shape>> for JsValue {
    fn wire2api(self) -> Box<Shape> {
        Box::new(self.wire2api())
    }
}
impl Wire2Api<f64> for JsValue {
    fn wire2api(self) -> f64 {
        self.unchecked_into_f64() as _
    }
}
impl Wire2Api<u64> for JsValue {
    fn wire2api(self) -> u64 {
        ::std::convert::TryInto::try_into(self.dyn_into::<js_sys::BigInt>().unwrap()).unwrap()
    }
}
impl Wire2Api<u8> for JsValue {
    fn wire2api(self) -> u8 {
        self.unchecked_into_f64() as _
    }
}
impl Wire2Api<Vec<u8>> for JsValue {
    fn wire2api(self) -> Vec<u8> {
        self.unchecked_into::<js_sys::Uint8Array>().to_vec().into()
    }
}
impl Wire2Api<usize> for JsValue {
    fn wire2api(self) -> usize {
        self.unchecked_into_f64() as _
    }
}