// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.69.0.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import 'dart:convert';
import 'dart:async';
import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';

import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'bridge_generated.io.dart'
    if (dart.library.html) 'bridge_generated.web.dart';

abstract class Native {
  Future<String> sayHelloAsync({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kSayHelloAsyncConstMeta;

  Future<Uint64List> mortonCodesAsync(
      {required Float64List xs, required Float64List ys, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kMortonCodesAsyncConstMeta;

  Uint64List mortonCodes(
      {required Float64List xs, required Float64List ys, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kMortonCodesConstMeta;

  Index aabbNew(
      {required double minX,
      required double minY,
      required double maxX,
      required double maxY,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kAabbNewConstMeta;

  Uint64List aabbNewBulk(
      {required Float64List minXs,
      required Float64List minYs,
      required Float64List maxXs,
      required Float64List maxYs,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kAabbNewBulkConstMeta;

  Uint8List aabbDropBulk({required List<Index> aabbIds, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kAabbDropBulkConstMeta;

  Float64List aabbMin({required Index aabbId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kAabbMinConstMeta;

  Float64List aabbMax({required Index aabbId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kAabbMaxConstMeta;

  F64Array2 aabbSize({required Index aabbId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kAabbSizeConstMeta;

  F64Array2 aabbCenter({required Index aabbId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kAabbCenterConstMeta;

  bool aabbIntersectsAabb(
      {required Index aabbLeftId, required Index aabbRightId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kAabbIntersectsAabbConstMeta;

  bool aabbContainsPoint(
      {required Index aabbId, required F64Array2 point, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kAabbContainsPointConstMeta;

  bool aabbContainsAabb(
      {required Index aabbLeftId, required Index aabbRightId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kAabbContainsAabbConstMeta;

  Index aabbMerge(
      {required Index aabbLeftId, required Index aabbRightId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kAabbMergeConstMeta;

  Future<void> aabbMergeWith(
      {required Index aabb, required Index other, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kAabbMergeWithConstMeta;

  Index bvhNew({required List<Index> aabbs, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kBvhNewConstMeta;

  Future<Index> bvhNewAsync({required List<Index> aabbs, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kBvhNewAsyncConstMeta;

  bool bvhDrop({required Index bvhId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kBvhDropConstMeta;

  FlatBVH bvhFlatten({required Index bvhId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kBvhFlattenConstMeta;

  Future<FlatBVH> bvhFlattenAsync({required Index bvhId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kBvhFlattenAsyncConstMeta;

  int bvhDepth({required Index bvhId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kBvhDepthConstMeta;

  Future<int> bvhDepthAsync({required Index bvhId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kBvhDepthAsyncConstMeta;

  List<Index> bvhQueryAabbCollisions(
      {required Index bvhId, required Index aabbId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kBvhQueryAabbCollisionsConstMeta;

  List<Index> bvhQueryAabbCollisionsMinMax(
      {required Index bvhId,
      required double minX,
      required double minY,
      required double maxX,
      required double maxY,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kBvhQueryAabbCollisionsMinMaxConstMeta;

  List<Index> bvhQueryPointCollisions(
      {required Index bvhId,
      required double x,
      required double y,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kBvhQueryPointCollisionsConstMeta;

  String bvhPrint({required Index bvhId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kBvhPrintConstMeta;

  Future<String> bvhPrintAsync({required Index bvhId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kBvhPrintAsyncConstMeta;

  double bvhOverlapRatio({required Index bvhId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kBvhOverlapRatioConstMeta;
}

class F64Array2 extends NonGrowableListView<double> {
  static const arraySize = 2;
  F64Array2(Float64List inner)
      : assert(inner.length == arraySize),
        super(inner);
  F64Array2.unchecked(Float64List inner) : super(inner);
  F64Array2.init() : super(Float64List(arraySize));
}

class FlatBVH {
  final Float64List minX;
  final Float64List minY;
  final Float64List maxX;
  final Float64List maxY;
  final Uint64List depth;

  const FlatBVH({
    required this.minX,
    required this.minY,
    required this.maxX,
    required this.maxY,
    required this.depth,
  });
}

class Index {
  final int index;
  final int generation;

  const Index({
    required this.index,
    required this.generation,
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
  Future<String> sayHelloAsync({dynamic hint}) {
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_say_hello_async(port_),
      parseSuccessData: _wire2api_String,
      constMeta: kSayHelloAsyncConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kSayHelloAsyncConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "say_hello_async",
        argNames: [],
      );

  Future<Uint64List> mortonCodesAsync(
      {required Float64List xs, required Float64List ys, dynamic hint}) {
    var arg0 = _platform.api2wire_float_64_list(xs);
    var arg1 = _platform.api2wire_float_64_list(ys);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_morton_codes_async(port_, arg0, arg1),
      parseSuccessData: _wire2api_uint_64_list,
      constMeta: kMortonCodesAsyncConstMeta,
      argValues: [xs, ys],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kMortonCodesAsyncConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "morton_codes_async",
        argNames: ["xs", "ys"],
      );

  Uint64List mortonCodes(
      {required Float64List xs, required Float64List ys, dynamic hint}) {
    var arg0 = _platform.api2wire_float_64_list(xs);
    var arg1 = _platform.api2wire_float_64_list(ys);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_morton_codes(arg0, arg1),
      parseSuccessData: _wire2api_uint_64_list,
      constMeta: kMortonCodesConstMeta,
      argValues: [xs, ys],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kMortonCodesConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "morton_codes",
        argNames: ["xs", "ys"],
      );

  Index aabbNew(
      {required double minX,
      required double minY,
      required double maxX,
      required double maxY,
      dynamic hint}) {
    var arg0 = api2wire_f64(minX);
    var arg1 = api2wire_f64(minY);
    var arg2 = api2wire_f64(maxX);
    var arg3 = api2wire_f64(maxY);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_aabb_new(arg0, arg1, arg2, arg3),
      parseSuccessData: _wire2api_index,
      constMeta: kAabbNewConstMeta,
      argValues: [minX, minY, maxX, maxY],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kAabbNewConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "aabb_new",
        argNames: ["minX", "minY", "maxX", "maxY"],
      );

  Uint64List aabbNewBulk(
      {required Float64List minXs,
      required Float64List minYs,
      required Float64List maxXs,
      required Float64List maxYs,
      dynamic hint}) {
    var arg0 = _platform.api2wire_float_64_list(minXs);
    var arg1 = _platform.api2wire_float_64_list(minYs);
    var arg2 = _platform.api2wire_float_64_list(maxXs);
    var arg3 = _platform.api2wire_float_64_list(maxYs);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_aabb_new_bulk(arg0, arg1, arg2, arg3),
      parseSuccessData: _wire2api_uint_64_list,
      constMeta: kAabbNewBulkConstMeta,
      argValues: [minXs, minYs, maxXs, maxYs],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kAabbNewBulkConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "aabb_new_bulk",
        argNames: ["minXs", "minYs", "maxXs", "maxYs"],
      );

  Uint8List aabbDropBulk({required List<Index> aabbIds, dynamic hint}) {
    var arg0 = _platform.api2wire_list_index(aabbIds);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_aabb_drop_bulk(arg0),
      parseSuccessData: _wire2api_uint_8_list,
      constMeta: kAabbDropBulkConstMeta,
      argValues: [aabbIds],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kAabbDropBulkConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "aabb_drop_bulk",
        argNames: ["aabbIds"],
      );

  Float64List aabbMin({required Index aabbId, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_index(aabbId);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_aabb_min(arg0),
      parseSuccessData: _wire2api_float_64_list,
      constMeta: kAabbMinConstMeta,
      argValues: [aabbId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kAabbMinConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "aabb_min",
        argNames: ["aabbId"],
      );

  Float64List aabbMax({required Index aabbId, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_index(aabbId);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_aabb_max(arg0),
      parseSuccessData: _wire2api_float_64_list,
      constMeta: kAabbMaxConstMeta,
      argValues: [aabbId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kAabbMaxConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "aabb_max",
        argNames: ["aabbId"],
      );

  F64Array2 aabbSize({required Index aabbId, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_index(aabbId);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_aabb_size(arg0),
      parseSuccessData: _wire2api_f64_array_2,
      constMeta: kAabbSizeConstMeta,
      argValues: [aabbId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kAabbSizeConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "aabb_size",
        argNames: ["aabbId"],
      );

  F64Array2 aabbCenter({required Index aabbId, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_index(aabbId);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_aabb_center(arg0),
      parseSuccessData: _wire2api_f64_array_2,
      constMeta: kAabbCenterConstMeta,
      argValues: [aabbId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kAabbCenterConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "aabb_center",
        argNames: ["aabbId"],
      );

  bool aabbIntersectsAabb(
      {required Index aabbLeftId, required Index aabbRightId, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_index(aabbLeftId);
    var arg1 = _platform.api2wire_box_autoadd_index(aabbRightId);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_aabb_intersects_aabb(arg0, arg1),
      parseSuccessData: _wire2api_bool,
      constMeta: kAabbIntersectsAabbConstMeta,
      argValues: [aabbLeftId, aabbRightId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kAabbIntersectsAabbConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "aabb_intersects_aabb",
        argNames: ["aabbLeftId", "aabbRightId"],
      );

  bool aabbContainsPoint(
      {required Index aabbId, required F64Array2 point, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_index(aabbId);
    var arg1 = _platform.api2wire_f64_array_2(point);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_aabb_contains_point(arg0, arg1),
      parseSuccessData: _wire2api_bool,
      constMeta: kAabbContainsPointConstMeta,
      argValues: [aabbId, point],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kAabbContainsPointConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "aabb_contains_point",
        argNames: ["aabbId", "point"],
      );

  bool aabbContainsAabb(
      {required Index aabbLeftId, required Index aabbRightId, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_index(aabbLeftId);
    var arg1 = _platform.api2wire_box_autoadd_index(aabbRightId);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_aabb_contains_aabb(arg0, arg1),
      parseSuccessData: _wire2api_bool,
      constMeta: kAabbContainsAabbConstMeta,
      argValues: [aabbLeftId, aabbRightId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kAabbContainsAabbConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "aabb_contains_aabb",
        argNames: ["aabbLeftId", "aabbRightId"],
      );

  Index aabbMerge(
      {required Index aabbLeftId, required Index aabbRightId, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_index(aabbLeftId);
    var arg1 = _platform.api2wire_box_autoadd_index(aabbRightId);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_aabb_merge(arg0, arg1),
      parseSuccessData: _wire2api_index,
      constMeta: kAabbMergeConstMeta,
      argValues: [aabbLeftId, aabbRightId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kAabbMergeConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "aabb_merge",
        argNames: ["aabbLeftId", "aabbRightId"],
      );

  Future<void> aabbMergeWith(
      {required Index aabb, required Index other, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_index(aabb);
    var arg1 = _platform.api2wire_box_autoadd_index(other);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_aabb_merge_with(port_, arg0, arg1),
      parseSuccessData: _wire2api_unit,
      constMeta: kAabbMergeWithConstMeta,
      argValues: [aabb, other],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kAabbMergeWithConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "aabb_merge_with",
        argNames: ["aabb", "other"],
      );

  Index bvhNew({required List<Index> aabbs, dynamic hint}) {
    var arg0 = _platform.api2wire_list_index(aabbs);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_bvh_new(arg0),
      parseSuccessData: _wire2api_index,
      constMeta: kBvhNewConstMeta,
      argValues: [aabbs],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kBvhNewConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "bvh_new",
        argNames: ["aabbs"],
      );

  Future<Index> bvhNewAsync({required List<Index> aabbs, dynamic hint}) {
    var arg0 = _platform.api2wire_list_index(aabbs);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_bvh_new_async(port_, arg0),
      parseSuccessData: _wire2api_index,
      constMeta: kBvhNewAsyncConstMeta,
      argValues: [aabbs],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kBvhNewAsyncConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "bvh_new_async",
        argNames: ["aabbs"],
      );

  bool bvhDrop({required Index bvhId, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_index(bvhId);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_bvh_drop(arg0),
      parseSuccessData: _wire2api_bool,
      constMeta: kBvhDropConstMeta,
      argValues: [bvhId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kBvhDropConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "bvh_drop",
        argNames: ["bvhId"],
      );

  FlatBVH bvhFlatten({required Index bvhId, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_index(bvhId);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_bvh_flatten(arg0),
      parseSuccessData: _wire2api_flat_bvh,
      constMeta: kBvhFlattenConstMeta,
      argValues: [bvhId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kBvhFlattenConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "bvh_flatten",
        argNames: ["bvhId"],
      );

  Future<FlatBVH> bvhFlattenAsync({required Index bvhId, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_index(bvhId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_bvh_flatten_async(port_, arg0),
      parseSuccessData: _wire2api_flat_bvh,
      constMeta: kBvhFlattenAsyncConstMeta,
      argValues: [bvhId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kBvhFlattenAsyncConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "bvh_flatten_async",
        argNames: ["bvhId"],
      );

  int bvhDepth({required Index bvhId, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_index(bvhId);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_bvh_depth(arg0),
      parseSuccessData: _wire2api_u64,
      constMeta: kBvhDepthConstMeta,
      argValues: [bvhId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kBvhDepthConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "bvh_depth",
        argNames: ["bvhId"],
      );

  Future<int> bvhDepthAsync({required Index bvhId, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_index(bvhId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_bvh_depth_async(port_, arg0),
      parseSuccessData: _wire2api_u64,
      constMeta: kBvhDepthAsyncConstMeta,
      argValues: [bvhId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kBvhDepthAsyncConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "bvh_depth_async",
        argNames: ["bvhId"],
      );

  List<Index> bvhQueryAabbCollisions(
      {required Index bvhId, required Index aabbId, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_index(bvhId);
    var arg1 = _platform.api2wire_box_autoadd_index(aabbId);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_bvh_query_aabb_collisions(arg0, arg1),
      parseSuccessData: _wire2api_list_index,
      constMeta: kBvhQueryAabbCollisionsConstMeta,
      argValues: [bvhId, aabbId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kBvhQueryAabbCollisionsConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "bvh_query_aabb_collisions",
        argNames: ["bvhId", "aabbId"],
      );

  List<Index> bvhQueryAabbCollisionsMinMax(
      {required Index bvhId,
      required double minX,
      required double minY,
      required double maxX,
      required double maxY,
      dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_index(bvhId);
    var arg1 = api2wire_f64(minX);
    var arg2 = api2wire_f64(minY);
    var arg3 = api2wire_f64(maxX);
    var arg4 = api2wire_f64(maxY);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner
          .wire_bvh_query_aabb_collisions_min_max(arg0, arg1, arg2, arg3, arg4),
      parseSuccessData: _wire2api_list_index,
      constMeta: kBvhQueryAabbCollisionsMinMaxConstMeta,
      argValues: [bvhId, minX, minY, maxX, maxY],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kBvhQueryAabbCollisionsMinMaxConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "bvh_query_aabb_collisions_min_max",
        argNames: ["bvhId", "minX", "minY", "maxX", "maxY"],
      );

  List<Index> bvhQueryPointCollisions(
      {required Index bvhId,
      required double x,
      required double y,
      dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_index(bvhId);
    var arg1 = api2wire_f64(x);
    var arg2 = api2wire_f64(y);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () =>
          _platform.inner.wire_bvh_query_point_collisions(arg0, arg1, arg2),
      parseSuccessData: _wire2api_list_index,
      constMeta: kBvhQueryPointCollisionsConstMeta,
      argValues: [bvhId, x, y],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kBvhQueryPointCollisionsConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "bvh_query_point_collisions",
        argNames: ["bvhId", "x", "y"],
      );

  String bvhPrint({required Index bvhId, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_index(bvhId);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_bvh_print(arg0),
      parseSuccessData: _wire2api_String,
      constMeta: kBvhPrintConstMeta,
      argValues: [bvhId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kBvhPrintConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "bvh_print",
        argNames: ["bvhId"],
      );

  Future<String> bvhPrintAsync({required Index bvhId, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_index(bvhId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_bvh_print_async(port_, arg0),
      parseSuccessData: _wire2api_String,
      constMeta: kBvhPrintAsyncConstMeta,
      argValues: [bvhId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kBvhPrintAsyncConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "bvh_print_async",
        argNames: ["bvhId"],
      );

  double bvhOverlapRatio({required Index bvhId, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_index(bvhId);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_bvh_overlap_ratio(arg0),
      parseSuccessData: _wire2api_f64,
      constMeta: kBvhOverlapRatioConstMeta,
      argValues: [bvhId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kBvhOverlapRatioConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "bvh_overlap_ratio",
        argNames: ["bvhId"],
      );

  void dispose() {
    _platform.dispose();
  }
// Section: wire2api

  String _wire2api_String(dynamic raw) {
    return raw as String;
  }

  bool _wire2api_bool(dynamic raw) {
    return raw as bool;
  }

  double _wire2api_f64(dynamic raw) {
    return raw as double;
  }

  F64Array2 _wire2api_f64_array_2(dynamic raw) {
    return F64Array2(_wire2api_float_64_list(raw));
  }

  FlatBVH _wire2api_flat_bvh(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 5)
      throw Exception('unexpected arr length: expect 5 but see ${arr.length}');
    return FlatBVH(
      minX: _wire2api_float_64_list(arr[0]),
      minY: _wire2api_float_64_list(arr[1]),
      maxX: _wire2api_float_64_list(arr[2]),
      maxY: _wire2api_float_64_list(arr[3]),
      depth: _wire2api_uint_64_list(arr[4]),
    );
  }

  Float64List _wire2api_float_64_list(dynamic raw) {
    return raw as Float64List;
  }

  Index _wire2api_index(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return Index(
      index: _wire2api_usize(arr[0]),
      generation: _wire2api_u64(arr[1]),
    );
  }

  List<Index> _wire2api_list_index(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_index).toList();
  }

  int _wire2api_u64(dynamic raw) {
    return castInt(raw);
  }

  int _wire2api_u8(dynamic raw) {
    return raw as int;
  }

  Uint64List _wire2api_uint_64_list(dynamic raw) {
    return Uint64List.from(raw);
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
double api2wire_f64(double raw) {
  return raw;
}

@protected
int api2wire_usize(int raw) {
  return raw;
}
// Section: finalizer
