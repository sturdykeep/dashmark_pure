// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.72.1.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide protected;

import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';
import 'bridge_generated.io.dart'
    if (dart.library.html) 'bridge_generated.web.dart';

part 'bridge_generated.freezed.dart';

abstract class Native {
  Future<String> sayHello({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kSayHelloConstMeta;

  void update({required double dt, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kUpdateConstMeta;

  GenerationalIndex createEntity({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kCreateEntityConstMeta;

  void dropEntity({required GenerationalIndex index, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDropEntityConstMeta;

  void entitiesSetTransformRaw(
      {required Uint8List indices,
      required Uint8List positions,
      required Uint8List origins,
      required Uint8List rotations,
      required Uint8List scales,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kEntitiesSetTransformRawConstMeta;

  void entitiesSetPositionRaw(
      {required Uint8List indices, required Uint8List positions, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kEntitiesSetPositionRawConstMeta;

  void entitiesSetOriginRaw(
      {required Uint8List indices, required Uint8List origins, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kEntitiesSetOriginRawConstMeta;

  void entitiesSetRotationRaw(
      {required Uint8List indices, required Uint8List rotations, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kEntitiesSetRotationRawConstMeta;

  void entitiesSetScaleRaw(
      {required Uint8List indices, required Uint8List scales, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kEntitiesSetScaleRawConstMeta;

  List<GenerationalIndex> queryAabb(
      {required double x,
      required double y,
      required double width,
      required double height,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kQueryAabbConstMeta;

  Uint8List queryAabbRaw(
      {required double x,
      required double y,
      required double width,
      required double height,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kQueryAabbRawConstMeta;

  void entitySetVerticesRaw(
      {required GenerationalIndex index,
      required Uint8List vertices,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kEntitySetVerticesRawConstMeta;

  void entitySetTexCoordsRaw(
      {required GenerationalIndex index,
      required Uint8List texCoords,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kEntitySetTexCoordsRawConstMeta;

  void entitySetIndicesRaw(
      {required GenerationalIndex index,
      required Uint8List indices,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kEntitySetIndicesRawConstMeta;

  void entitiesSetPriorityRaw(
      {required Uint8List indices,
      required Uint8List priorities,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kEntitiesSetPriorityRawConstMeta;

  void entitySetShape(
      {required GenerationalIndex index, required Shape shape, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kEntitySetShapeConstMeta;

  void entitySetColor(
      {required GenerationalIndex index, required int color, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kEntitySetColorConstMeta;

  int batchesCount({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kBatchesCountConstMeta;

  Uint8List vertices({required int batchIndex, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kVerticesConstMeta;

  Uint8List texCoords({required int batchIndex, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kTexCoordsConstMeta;

  Uint8List indices({required int batchIndex, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kIndicesConstMeta;

  Uint8List colors({required int batchIndex, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kColorsConstMeta;
}

class GenerationalIndex {
  final int field0;
  final int field1;

  const GenerationalIndex({
    required this.field0,
    required this.field1,
  });
}

@freezed
class Shape with _$Shape {
  const factory Shape.ball({
    required double radius,
  }) = Shape_Ball;
  const factory Shape.compound({
    required List<Shape> children,
    required List<ShapeTransform> transforms,
  }) = Shape_Compound;
}

class ShapeTransform {
  final double positionX;
  final double positionY;
  final double rotation;
  final double absoluteOriginX;
  final double absoluteOriginY;

  const ShapeTransform({
    required this.positionX,
    required this.positionY,
    required this.rotation,
    required this.absoluteOriginX,
    required this.absoluteOriginY,
  });
}

class NativeImpl implements Native {
  final NativePlatform _platform;
  factory NativeImpl(ExternalLibrary dylib) =>
      NativeImpl.raw(NativePlatform(dylib));

  /// Only valid on web/WASM platforms.
  factory NativeImpl.wasm(FutureOr<WasmModule> module) =>
      NativeImpl(module as ExternalLibrary);
  NativeImpl.raw(this._platform);
  Future<String> sayHello({dynamic hint}) {
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_say_hello(port_),
      parseSuccessData: _wire2api_String,
      constMeta: kSayHelloConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kSayHelloConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "say_hello",
        argNames: [],
      );

  void update({required double dt, dynamic hint}) {
    var arg0 = api2wire_f64(dt);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_update(arg0),
      parseSuccessData: _wire2api_unit,
      constMeta: kUpdateConstMeta,
      argValues: [dt],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kUpdateConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "update",
        argNames: ["dt"],
      );

  GenerationalIndex createEntity({dynamic hint}) {
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_create_entity(),
      parseSuccessData: _wire2api_generational_index,
      constMeta: kCreateEntityConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kCreateEntityConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "create_entity",
        argNames: [],
      );

  void dropEntity({required GenerationalIndex index, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_generational_index(index);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_drop_entity(arg0),
      parseSuccessData: _wire2api_unit,
      constMeta: kDropEntityConstMeta,
      argValues: [index],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDropEntityConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "drop_entity",
        argNames: ["index"],
      );

  void entitiesSetTransformRaw(
      {required Uint8List indices,
      required Uint8List positions,
      required Uint8List origins,
      required Uint8List rotations,
      required Uint8List scales,
      dynamic hint}) {
    var arg0 = _platform.api2wire_ZeroCopyBuffer_Uint8List(indices);
    var arg1 = _platform.api2wire_ZeroCopyBuffer_Uint8List(positions);
    var arg2 = _platform.api2wire_ZeroCopyBuffer_Uint8List(origins);
    var arg3 = _platform.api2wire_ZeroCopyBuffer_Uint8List(rotations);
    var arg4 = _platform.api2wire_ZeroCopyBuffer_Uint8List(scales);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner
          .wire_entities_set_transform_raw(arg0, arg1, arg2, arg3, arg4),
      parseSuccessData: _wire2api_unit,
      constMeta: kEntitiesSetTransformRawConstMeta,
      argValues: [indices, positions, origins, rotations, scales],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kEntitiesSetTransformRawConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "entities_set_transform_raw",
        argNames: ["indices", "positions", "origins", "rotations", "scales"],
      );

  void entitiesSetPositionRaw(
      {required Uint8List indices,
      required Uint8List positions,
      dynamic hint}) {
    var arg0 = _platform.api2wire_ZeroCopyBuffer_Uint8List(indices);
    var arg1 = _platform.api2wire_ZeroCopyBuffer_Uint8List(positions);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_entities_set_position_raw(arg0, arg1),
      parseSuccessData: _wire2api_unit,
      constMeta: kEntitiesSetPositionRawConstMeta,
      argValues: [indices, positions],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kEntitiesSetPositionRawConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "entities_set_position_raw",
        argNames: ["indices", "positions"],
      );

  void entitiesSetOriginRaw(
      {required Uint8List indices, required Uint8List origins, dynamic hint}) {
    var arg0 = _platform.api2wire_ZeroCopyBuffer_Uint8List(indices);
    var arg1 = _platform.api2wire_ZeroCopyBuffer_Uint8List(origins);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_entities_set_origin_raw(arg0, arg1),
      parseSuccessData: _wire2api_unit,
      constMeta: kEntitiesSetOriginRawConstMeta,
      argValues: [indices, origins],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kEntitiesSetOriginRawConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "entities_set_origin_raw",
        argNames: ["indices", "origins"],
      );

  void entitiesSetRotationRaw(
      {required Uint8List indices,
      required Uint8List rotations,
      dynamic hint}) {
    var arg0 = _platform.api2wire_ZeroCopyBuffer_Uint8List(indices);
    var arg1 = _platform.api2wire_ZeroCopyBuffer_Uint8List(rotations);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_entities_set_rotation_raw(arg0, arg1),
      parseSuccessData: _wire2api_unit,
      constMeta: kEntitiesSetRotationRawConstMeta,
      argValues: [indices, rotations],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kEntitiesSetRotationRawConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "entities_set_rotation_raw",
        argNames: ["indices", "rotations"],
      );

  void entitiesSetScaleRaw(
      {required Uint8List indices, required Uint8List scales, dynamic hint}) {
    var arg0 = _platform.api2wire_ZeroCopyBuffer_Uint8List(indices);
    var arg1 = _platform.api2wire_ZeroCopyBuffer_Uint8List(scales);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_entities_set_scale_raw(arg0, arg1),
      parseSuccessData: _wire2api_unit,
      constMeta: kEntitiesSetScaleRawConstMeta,
      argValues: [indices, scales],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kEntitiesSetScaleRawConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "entities_set_scale_raw",
        argNames: ["indices", "scales"],
      );

  List<GenerationalIndex> queryAabb(
      {required double x,
      required double y,
      required double width,
      required double height,
      dynamic hint}) {
    var arg0 = api2wire_f32(x);
    var arg1 = api2wire_f32(y);
    var arg2 = api2wire_f32(width);
    var arg3 = api2wire_f32(height);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_query_aabb(arg0, arg1, arg2, arg3),
      parseSuccessData: _wire2api_list_generational_index,
      constMeta: kQueryAabbConstMeta,
      argValues: [x, y, width, height],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kQueryAabbConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "query_aabb",
        argNames: ["x", "y", "width", "height"],
      );

  Uint8List queryAabbRaw(
      {required double x,
      required double y,
      required double width,
      required double height,
      dynamic hint}) {
    var arg0 = api2wire_f32(x);
    var arg1 = api2wire_f32(y);
    var arg2 = api2wire_f32(width);
    var arg3 = api2wire_f32(height);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () =>
          _platform.inner.wire_query_aabb_raw(arg0, arg1, arg2, arg3),
      parseSuccessData: _wire2api_ZeroCopyBuffer_Uint8List,
      constMeta: kQueryAabbRawConstMeta,
      argValues: [x, y, width, height],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kQueryAabbRawConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "query_aabb_raw",
        argNames: ["x", "y", "width", "height"],
      );

  void entitySetVerticesRaw(
      {required GenerationalIndex index,
      required Uint8List vertices,
      dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_generational_index(index);
    var arg1 = _platform.api2wire_ZeroCopyBuffer_Uint8List(vertices);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_entity_set_vertices_raw(arg0, arg1),
      parseSuccessData: _wire2api_unit,
      constMeta: kEntitySetVerticesRawConstMeta,
      argValues: [index, vertices],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kEntitySetVerticesRawConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "entity_set_vertices_raw",
        argNames: ["index", "vertices"],
      );

  void entitySetTexCoordsRaw(
      {required GenerationalIndex index,
      required Uint8List texCoords,
      dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_generational_index(index);
    var arg1 = _platform.api2wire_ZeroCopyBuffer_Uint8List(texCoords);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_entity_set_tex_coords_raw(arg0, arg1),
      parseSuccessData: _wire2api_unit,
      constMeta: kEntitySetTexCoordsRawConstMeta,
      argValues: [index, texCoords],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kEntitySetTexCoordsRawConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "entity_set_tex_coords_raw",
        argNames: ["index", "texCoords"],
      );

  void entitySetIndicesRaw(
      {required GenerationalIndex index,
      required Uint8List indices,
      dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_generational_index(index);
    var arg1 = _platform.api2wire_ZeroCopyBuffer_Uint8List(indices);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_entity_set_indices_raw(arg0, arg1),
      parseSuccessData: _wire2api_unit,
      constMeta: kEntitySetIndicesRawConstMeta,
      argValues: [index, indices],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kEntitySetIndicesRawConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "entity_set_indices_raw",
        argNames: ["index", "indices"],
      );

  void entitiesSetPriorityRaw(
      {required Uint8List indices,
      required Uint8List priorities,
      dynamic hint}) {
    var arg0 = _platform.api2wire_ZeroCopyBuffer_Uint8List(indices);
    var arg1 = _platform.api2wire_ZeroCopyBuffer_Uint8List(priorities);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_entities_set_priority_raw(arg0, arg1),
      parseSuccessData: _wire2api_unit,
      constMeta: kEntitiesSetPriorityRawConstMeta,
      argValues: [indices, priorities],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kEntitiesSetPriorityRawConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "entities_set_priority_raw",
        argNames: ["indices", "priorities"],
      );

  void entitySetShape(
      {required GenerationalIndex index, required Shape shape, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_generational_index(index);
    var arg1 = _platform.api2wire_box_autoadd_shape(shape);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_entity_set_shape(arg0, arg1),
      parseSuccessData: _wire2api_unit,
      constMeta: kEntitySetShapeConstMeta,
      argValues: [index, shape],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kEntitySetShapeConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "entity_set_shape",
        argNames: ["index", "shape"],
      );

  void entitySetColor(
      {required GenerationalIndex index, required int color, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_generational_index(index);
    var arg1 = api2wire_i32(color);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_entity_set_color(arg0, arg1),
      parseSuccessData: _wire2api_unit,
      constMeta: kEntitySetColorConstMeta,
      argValues: [index, color],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kEntitySetColorConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "entity_set_color",
        argNames: ["index", "color"],
      );

  int batchesCount({dynamic hint}) {
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_batches_count(),
      parseSuccessData: _wire2api_u64,
      constMeta: kBatchesCountConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kBatchesCountConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "batches_count",
        argNames: [],
      );

  Uint8List vertices({required int batchIndex, dynamic hint}) {
    var arg0 = api2wire_u16(batchIndex);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_vertices(arg0),
      parseSuccessData: _wire2api_ZeroCopyBuffer_Uint8List,
      constMeta: kVerticesConstMeta,
      argValues: [batchIndex],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kVerticesConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "vertices",
        argNames: ["batchIndex"],
      );

  Uint8List texCoords({required int batchIndex, dynamic hint}) {
    var arg0 = api2wire_u16(batchIndex);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_tex_coords(arg0),
      parseSuccessData: _wire2api_ZeroCopyBuffer_Uint8List,
      constMeta: kTexCoordsConstMeta,
      argValues: [batchIndex],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTexCoordsConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "tex_coords",
        argNames: ["batchIndex"],
      );

  Uint8List indices({required int batchIndex, dynamic hint}) {
    var arg0 = api2wire_u16(batchIndex);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_indices(arg0),
      parseSuccessData: _wire2api_ZeroCopyBuffer_Uint8List,
      constMeta: kIndicesConstMeta,
      argValues: [batchIndex],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kIndicesConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "indices",
        argNames: ["batchIndex"],
      );

  Uint8List colors({required int batchIndex, dynamic hint}) {
    var arg0 = api2wire_u16(batchIndex);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_colors(arg0),
      parseSuccessData: _wire2api_ZeroCopyBuffer_Uint8List,
      constMeta: kColorsConstMeta,
      argValues: [batchIndex],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kColorsConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "colors",
        argNames: ["batchIndex"],
      );

  void dispose() {
    _platform.dispose();
  }
// Section: wire2api

  String _wire2api_String(dynamic raw) {
    return raw as String;
  }

  Uint8List _wire2api_ZeroCopyBuffer_Uint8List(dynamic raw) {
    return raw as Uint8List;
  }

  GenerationalIndex _wire2api_generational_index(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return GenerationalIndex(
      field0: _wire2api_usize(arr[0]),
      field1: _wire2api_u64(arr[1]),
    );
  }

  List<GenerationalIndex> _wire2api_list_generational_index(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_generational_index).toList();
  }

  int _wire2api_u64(dynamic raw) {
    return castInt(raw);
  }

  int _wire2api_u8(dynamic raw) {
    return raw as int;
  }

  Uint8List _wire2api_uint_8_list(dynamic raw) {
    return raw as Uint8List;
  }

  void _wire2api_unit(dynamic raw) {
    return;
  }

  int _wire2api_usize(dynamic raw) {
    return castInt(raw);
  }
}

// Section: api2wire

@protected
double api2wire_f32(double raw) {
  return raw;
}

@protected
double api2wire_f64(double raw) {
  return raw;
}

@protected
int api2wire_i32(int raw) {
  return raw;
}

@protected
int api2wire_u16(int raw) {
  return raw;
}

@protected
int api2wire_u8(int raw) {
  return raw;
}

@protected
int api2wire_usize(int raw) {
  return raw;
}
// Section: finalizer
