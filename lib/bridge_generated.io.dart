// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.69.0.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'bridge_generated.dart';
export 'bridge_generated.dart';
import 'dart:ffi' as ffi;

class NativePlatform extends FlutterRustBridgeBase<NativeWire> {
  NativePlatform(ffi.DynamicLibrary dylib) : super(NativeWire(dylib));

// Section: api2wire

  @protected
  ffi.Pointer<wire_RawIndex> api2wire_box_autoadd_raw_index(RawIndex raw) {
    final ptr = inner.new_box_autoadd_raw_index_0();
    _api_fill_to_wire_raw_index(raw, ptr.ref);
    return ptr;
  }

  @protected
  ffi.Pointer<wire_Shape> api2wire_box_autoadd_shape(Shape raw) {
    final ptr = inner.new_box_autoadd_shape_0();
    _api_fill_to_wire_shape(raw, ptr.ref);
    return ptr;
  }

  @protected
  ffi.Pointer<wire_Shape> api2wire_box_shape(Shape raw) {
    final ptr = inner.new_box_shape_0();
    _api_fill_to_wire_shape(raw, ptr.ref);
    return ptr;
  }

  @protected
  ffi.Pointer<wire_list_box_shape> api2wire_list_box_shape(List<Shape> raw) {
    final ans = inner.new_list_box_shape_0(raw.length);
    for (var i = 0; i < raw.length; ++i) {
      _api_fill_to_wire_box_shape(
          raw[i], ans.ref.ptr[i] as ffi.Pointer<wire_Shape>);
    }
    return ans;
  }

  @protected
  ffi.Pointer<wire_list_raw_index> api2wire_list_raw_index(List<RawIndex> raw) {
    final ans = inner.new_list_raw_index_0(raw.length);
    for (var i = 0; i < raw.length; ++i) {
      _api_fill_to_wire_raw_index(raw[i], ans.ref.ptr[i]);
    }
    return ans;
  }

  @protected
  ffi.Pointer<wire_list_shape_transform> api2wire_list_shape_transform(
      List<ShapeTransform> raw) {
    final ans = inner.new_list_shape_transform_0(raw.length);
    for (var i = 0; i < raw.length; ++i) {
      _api_fill_to_wire_shape_transform(raw[i], ans.ref.ptr[i]);
    }
    return ans;
  }

  @protected
  int api2wire_u64(int raw) {
    return raw;
  }

// Section: finalizer

// Section: api_fill_to_wire

  void _api_fill_to_wire_box_autoadd_raw_index(
      RawIndex apiObj, ffi.Pointer<wire_RawIndex> wireObj) {
    _api_fill_to_wire_raw_index(apiObj, wireObj.ref);
  }

  void _api_fill_to_wire_box_autoadd_shape(
      Shape apiObj, ffi.Pointer<wire_Shape> wireObj) {
    _api_fill_to_wire_shape(apiObj, wireObj.ref);
  }

  void _api_fill_to_wire_box_shape(
      Shape apiObj, ffi.Pointer<wire_Shape> wireObj) {
    _api_fill_to_wire_shape(apiObj, wireObj.ref);
  }

  void _api_fill_to_wire_raw_index(RawIndex apiObj, wire_RawIndex wireObj) {
    wireObj.field0 = api2wire_usize(apiObj.field0);
    wireObj.field1 = api2wire_u64(apiObj.field1);
  }

  void _api_fill_to_wire_shape(Shape apiObj, wire_Shape wireObj) {
    if (apiObj is Shape_Ball) {
      var pre_radius = api2wire_f64(apiObj.radius);
      wireObj.tag = 0;
      wireObj.kind = inner.inflate_Shape_Ball();
      wireObj.kind.ref.Ball.ref.radius = pre_radius;
      return;
    }
    if (apiObj is Shape_Compound) {
      var pre_children = api2wire_list_box_shape(apiObj.children);
      var pre_transforms = api2wire_list_shape_transform(apiObj.transforms);
      wireObj.tag = 1;
      wireObj.kind = inner.inflate_Shape_Compound();
      wireObj.kind.ref.Compound.ref.children = pre_children;
      wireObj.kind.ref.Compound.ref.transforms = pre_transforms;
      return;
    }
  }

  void _api_fill_to_wire_shape_transform(
      ShapeTransform apiObj, wire_ShapeTransform wireObj) {
    wireObj.position_x = api2wire_f64(apiObj.positionX);
    wireObj.position_y = api2wire_f64(apiObj.positionY);
    wireObj.rotation = api2wire_f64(apiObj.rotation);
    wireObj.absolute_origin_x = api2wire_f64(apiObj.absoluteOriginX);
    wireObj.absolute_origin_y = api2wire_f64(apiObj.absoluteOriginY);
  }
}

// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_positional_boolean_parameters, annotate_overrides, constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.

/// generated by flutter_rust_bridge
class NativeWire implements FlutterRustBridgeWireBase {
  @internal
  late final dartApi = DartApiDl(init_frb_dart_api_dl);

  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  NativeWire(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  NativeWire.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void store_dart_post_cobject(
    DartPostCObjectFnType ptr,
  ) {
    return _store_dart_post_cobject(
      ptr,
    );
  }

  late final _store_dart_post_cobjectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(DartPostCObjectFnType)>>(
          'store_dart_post_cobject');
  late final _store_dart_post_cobject = _store_dart_post_cobjectPtr
      .asFunction<void Function(DartPostCObjectFnType)>();

  Object get_dart_object(
    int ptr,
  ) {
    return _get_dart_object(
      ptr,
    );
  }

  late final _get_dart_objectPtr =
      _lookup<ffi.NativeFunction<ffi.Handle Function(ffi.UintPtr)>>(
          'get_dart_object');
  late final _get_dart_object =
      _get_dart_objectPtr.asFunction<Object Function(int)>();

  void drop_dart_object(
    int ptr,
  ) {
    return _drop_dart_object(
      ptr,
    );
  }

  late final _drop_dart_objectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.UintPtr)>>(
          'drop_dart_object');
  late final _drop_dart_object =
      _drop_dart_objectPtr.asFunction<void Function(int)>();

  int new_dart_opaque(
    Object handle,
  ) {
    return _new_dart_opaque(
      handle,
    );
  }

  late final _new_dart_opaquePtr =
      _lookup<ffi.NativeFunction<ffi.UintPtr Function(ffi.Handle)>>(
          'new_dart_opaque');
  late final _new_dart_opaque =
      _new_dart_opaquePtr.asFunction<int Function(Object)>();

  int init_frb_dart_api_dl(
    ffi.Pointer<ffi.Void> obj,
  ) {
    return _init_frb_dart_api_dl(
      obj,
    );
  }

  late final _init_frb_dart_api_dlPtr =
      _lookup<ffi.NativeFunction<ffi.IntPtr Function(ffi.Pointer<ffi.Void>)>>(
          'init_frb_dart_api_dl');
  late final _init_frb_dart_api_dl = _init_frb_dart_api_dlPtr
      .asFunction<int Function(ffi.Pointer<ffi.Void>)>();

  void wire_say_hello(
    int port_,
  ) {
    return _wire_say_hello(
      port_,
    );
  }

  late final _wire_say_helloPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_say_hello');
  late final _wire_say_hello =
      _wire_say_helloPtr.asFunction<void Function(int)>();

  WireSyncReturn wire_create_entity() {
    return _wire_create_entity();
  }

  late final _wire_create_entityPtr =
      _lookup<ffi.NativeFunction<WireSyncReturn Function()>>(
          'wire_create_entity');
  late final _wire_create_entity =
      _wire_create_entityPtr.asFunction<WireSyncReturn Function()>();

  WireSyncReturn wire_drop_entity(
    ffi.Pointer<wire_RawIndex> index,
  ) {
    return _wire_drop_entity(
      index,
    );
  }

  late final _wire_drop_entityPtr = _lookup<
      ffi.NativeFunction<
          WireSyncReturn Function(
              ffi.Pointer<wire_RawIndex>)>>('wire_drop_entity');
  late final _wire_drop_entity = _wire_drop_entityPtr
      .asFunction<WireSyncReturn Function(ffi.Pointer<wire_RawIndex>)>();

  WireSyncReturn wire_entity_set_position(
    ffi.Pointer<wire_RawIndex> index,
    double x,
    double y,
  ) {
    return _wire_entity_set_position(
      index,
      x,
      y,
    );
  }

  late final _wire_entity_set_positionPtr = _lookup<
      ffi.NativeFunction<
          WireSyncReturn Function(ffi.Pointer<wire_RawIndex>, ffi.Double,
              ffi.Double)>>('wire_entity_set_position');
  late final _wire_entity_set_position =
      _wire_entity_set_positionPtr.asFunction<
          WireSyncReturn Function(
              ffi.Pointer<wire_RawIndex>, double, double)>();

  WireSyncReturn wire_entity_set_origin(
    ffi.Pointer<wire_RawIndex> index,
    bool relative,
    double x,
    double y,
  ) {
    return _wire_entity_set_origin(
      index,
      relative,
      x,
      y,
    );
  }

  late final _wire_entity_set_originPtr = _lookup<
      ffi.NativeFunction<
          WireSyncReturn Function(ffi.Pointer<wire_RawIndex>, ffi.Bool,
              ffi.Double, ffi.Double)>>('wire_entity_set_origin');
  late final _wire_entity_set_origin = _wire_entity_set_originPtr.asFunction<
      WireSyncReturn Function(
          ffi.Pointer<wire_RawIndex>, bool, double, double)>();

  WireSyncReturn wire_entity_set_rotation(
    ffi.Pointer<wire_RawIndex> index,
    double rotation,
  ) {
    return _wire_entity_set_rotation(
      index,
      rotation,
    );
  }

  late final _wire_entity_set_rotationPtr = _lookup<
      ffi.NativeFunction<
          WireSyncReturn Function(ffi.Pointer<wire_RawIndex>,
              ffi.Double)>>('wire_entity_set_rotation');
  late final _wire_entity_set_rotation =
      _wire_entity_set_rotationPtr.asFunction<
          WireSyncReturn Function(ffi.Pointer<wire_RawIndex>, double)>();

  WireSyncReturn wire_entity_set_shape(
    ffi.Pointer<wire_RawIndex> index,
    ffi.Pointer<wire_Shape> shape,
  ) {
    return _wire_entity_set_shape(
      index,
      shape,
    );
  }

  late final _wire_entity_set_shapePtr = _lookup<
      ffi.NativeFunction<
          WireSyncReturn Function(ffi.Pointer<wire_RawIndex>,
              ffi.Pointer<wire_Shape>)>>('wire_entity_set_shape');
  late final _wire_entity_set_shape = _wire_entity_set_shapePtr.asFunction<
      WireSyncReturn Function(
          ffi.Pointer<wire_RawIndex>, ffi.Pointer<wire_Shape>)>();

  WireSyncReturn wire_create_bvh() {
    return _wire_create_bvh();
  }

  late final _wire_create_bvhPtr =
      _lookup<ffi.NativeFunction<WireSyncReturn Function()>>('wire_create_bvh');
  late final _wire_create_bvh =
      _wire_create_bvhPtr.asFunction<WireSyncReturn Function()>();

  WireSyncReturn wire_drop_bvh(
    ffi.Pointer<wire_RawIndex> index,
  ) {
    return _wire_drop_bvh(
      index,
    );
  }

  late final _wire_drop_bvhPtr = _lookup<
      ffi.NativeFunction<
          WireSyncReturn Function(
              ffi.Pointer<wire_RawIndex>)>>('wire_drop_bvh');
  late final _wire_drop_bvh = _wire_drop_bvhPtr
      .asFunction<WireSyncReturn Function(ffi.Pointer<wire_RawIndex>)>();

  WireSyncReturn wire_bvh_clear_and_rebuild(
    ffi.Pointer<wire_RawIndex> index,
    ffi.Pointer<wire_list_raw_index> entities,
    double dilation_factor,
  ) {
    return _wire_bvh_clear_and_rebuild(
      index,
      entities,
      dilation_factor,
    );
  }

  late final _wire_bvh_clear_and_rebuildPtr = _lookup<
      ffi.NativeFunction<
          WireSyncReturn Function(
              ffi.Pointer<wire_RawIndex>,
              ffi.Pointer<wire_list_raw_index>,
              ffi.Double)>>('wire_bvh_clear_and_rebuild');
  late final _wire_bvh_clear_and_rebuild =
      _wire_bvh_clear_and_rebuildPtr.asFunction<
          WireSyncReturn Function(ffi.Pointer<wire_RawIndex>,
              ffi.Pointer<wire_list_raw_index>, double)>();

  WireSyncReturn wire_bvh_flatten(
    ffi.Pointer<wire_RawIndex> index,
  ) {
    return _wire_bvh_flatten(
      index,
    );
  }

  late final _wire_bvh_flattenPtr = _lookup<
      ffi.NativeFunction<
          WireSyncReturn Function(
              ffi.Pointer<wire_RawIndex>)>>('wire_bvh_flatten');
  late final _wire_bvh_flatten = _wire_bvh_flattenPtr
      .asFunction<WireSyncReturn Function(ffi.Pointer<wire_RawIndex>)>();

  ffi.Pointer<wire_RawIndex> new_box_autoadd_raw_index_0() {
    return _new_box_autoadd_raw_index_0();
  }

  late final _new_box_autoadd_raw_index_0Ptr =
      _lookup<ffi.NativeFunction<ffi.Pointer<wire_RawIndex> Function()>>(
          'new_box_autoadd_raw_index_0');
  late final _new_box_autoadd_raw_index_0 = _new_box_autoadd_raw_index_0Ptr
      .asFunction<ffi.Pointer<wire_RawIndex> Function()>();

  ffi.Pointer<wire_Shape> new_box_autoadd_shape_0() {
    return _new_box_autoadd_shape_0();
  }

  late final _new_box_autoadd_shape_0Ptr =
      _lookup<ffi.NativeFunction<ffi.Pointer<wire_Shape> Function()>>(
          'new_box_autoadd_shape_0');
  late final _new_box_autoadd_shape_0 = _new_box_autoadd_shape_0Ptr
      .asFunction<ffi.Pointer<wire_Shape> Function()>();

  ffi.Pointer<wire_Shape> new_box_shape_0() {
    return _new_box_shape_0();
  }

  late final _new_box_shape_0Ptr =
      _lookup<ffi.NativeFunction<ffi.Pointer<wire_Shape> Function()>>(
          'new_box_shape_0');
  late final _new_box_shape_0 =
      _new_box_shape_0Ptr.asFunction<ffi.Pointer<wire_Shape> Function()>();

  ffi.Pointer<wire_list_box_shape> new_list_box_shape_0(
    int len,
  ) {
    return _new_list_box_shape_0(
      len,
    );
  }

  late final _new_list_box_shape_0Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<wire_list_box_shape> Function(
              ffi.Int32)>>('new_list_box_shape_0');
  late final _new_list_box_shape_0 = _new_list_box_shape_0Ptr
      .asFunction<ffi.Pointer<wire_list_box_shape> Function(int)>();

  ffi.Pointer<wire_list_raw_index> new_list_raw_index_0(
    int len,
  ) {
    return _new_list_raw_index_0(
      len,
    );
  }

  late final _new_list_raw_index_0Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<wire_list_raw_index> Function(
              ffi.Int32)>>('new_list_raw_index_0');
  late final _new_list_raw_index_0 = _new_list_raw_index_0Ptr
      .asFunction<ffi.Pointer<wire_list_raw_index> Function(int)>();

  ffi.Pointer<wire_list_shape_transform> new_list_shape_transform_0(
    int len,
  ) {
    return _new_list_shape_transform_0(
      len,
    );
  }

  late final _new_list_shape_transform_0Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<wire_list_shape_transform> Function(
              ffi.Int32)>>('new_list_shape_transform_0');
  late final _new_list_shape_transform_0 = _new_list_shape_transform_0Ptr
      .asFunction<ffi.Pointer<wire_list_shape_transform> Function(int)>();

  ffi.Pointer<ShapeKind> inflate_Shape_Ball() {
    return _inflate_Shape_Ball();
  }

  late final _inflate_Shape_BallPtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<ShapeKind> Function()>>(
          'inflate_Shape_Ball');
  late final _inflate_Shape_Ball =
      _inflate_Shape_BallPtr.asFunction<ffi.Pointer<ShapeKind> Function()>();

  ffi.Pointer<ShapeKind> inflate_Shape_Compound() {
    return _inflate_Shape_Compound();
  }

  late final _inflate_Shape_CompoundPtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<ShapeKind> Function()>>(
          'inflate_Shape_Compound');
  late final _inflate_Shape_Compound = _inflate_Shape_CompoundPtr
      .asFunction<ffi.Pointer<ShapeKind> Function()>();

  void free_WireSyncReturn(
    WireSyncReturn ptr,
  ) {
    return _free_WireSyncReturn(
      ptr,
    );
  }

  late final _free_WireSyncReturnPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(WireSyncReturn)>>(
          'free_WireSyncReturn');
  late final _free_WireSyncReturn =
      _free_WireSyncReturnPtr.asFunction<void Function(WireSyncReturn)>();
}

class _Dart_Handle extends ffi.Opaque {}

class wire_RawIndex extends ffi.Struct {
  @ffi.UintPtr()
  external int field0;

  @ffi.Uint64()
  external int field1;
}

class wire_Shape_Ball extends ffi.Struct {
  @ffi.Double()
  external double radius;
}

class wire_list_box_shape extends ffi.Struct {
  external ffi.Pointer<wire_Shape> ptr;

  @ffi.Int32()
  external int len;
}

class wire_Shape extends ffi.Struct {
  @ffi.Int32()
  external int tag;

  external ffi.Pointer<ShapeKind> kind;
}

class ShapeKind extends ffi.Union {
  external ffi.Pointer<wire_Shape_Ball> Ball;

  external ffi.Pointer<wire_Shape_Compound> Compound;
}

class wire_Shape_Compound extends ffi.Struct {
  external ffi.Pointer<wire_list_box_shape> children;

  external ffi.Pointer<wire_list_shape_transform> transforms;
}

class wire_list_shape_transform extends ffi.Struct {
  external ffi.Pointer<wire_ShapeTransform> ptr;

  @ffi.Int32()
  external int len;
}

class wire_ShapeTransform extends ffi.Struct {
  @ffi.Double()
  external double position_x;

  @ffi.Double()
  external double position_y;

  @ffi.Double()
  external double rotation;

  @ffi.Double()
  external double absolute_origin_x;

  @ffi.Double()
  external double absolute_origin_y;
}

class wire_list_raw_index extends ffi.Struct {
  external ffi.Pointer<wire_RawIndex> ptr;

  @ffi.Int32()
  external int len;
}

typedef DartPostCObjectFnType = ffi.Pointer<
    ffi.NativeFunction<ffi.Bool Function(DartPort, ffi.Pointer<ffi.Void>)>>;
typedef DartPort = ffi.Int64;
