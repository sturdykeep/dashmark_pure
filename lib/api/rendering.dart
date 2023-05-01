import 'dart:typed_data';
import 'package:flutter/material.dart';

import '../ffi_export.dart';
import '../typed_buffer/mod.dart';

void setVertices(GenerationalIndex entity, Vector64Buffer vertices) {
  api.entitySetVerticesRaw(
      index: entity, vertices: vertices.buffer.toUint8List());
}

void setTexCoords(GenerationalIndex entity, Vector64Buffer texCoords) {
  api.entitySetTexCoordsRaw(
      index: entity, texCoords: texCoords.buffer.toUint8List());
}

void setIndices(GenerationalIndex entity, Uint16Buffer indices) {
  api.entitySetIndicesRaw(index: entity, indices: indices.toUint8List());
}

void setColor(GenerationalIndex entity, Color color) {
  api.entitySetColor(
    index: entity,
    color: color.value,
  );
}

/// Returns a number of generated batches for rendering.
int batchesCount() {
  return api.batchesCount();
}

/// Returns a [Float32List] view of the transformed vertices.
/// Entities are already sorted by their priority/z-index.
Float32List vertices(int batchIndex) {
  var data = api.vertices(batchIndex: batchIndex);
  return Float32List.view(data.buffer);
}

/// Returns a [Float32List] view of the normals.
/// Entities are already sorted by their priority/z-index.
Float32List texCoords(int batchIndex) {
  var data = api.texCoords(batchIndex: batchIndex);
  return Float32List.view(data.buffer);
}

/// Returns an [Int32List] view of the colors.
/// Entities are already sorted by their priority/z-index.
Int32List colors(int batchIndex) {
  var data = api.colors(batchIndex: batchIndex);
  return Int32List.view(data.buffer);
}

/// Returns a [Uint16List] view of the indices.
/// Entities are already sorted by their priority/z-index.
Uint16List indices(int batchIndex) {
  var data = api.indices(batchIndex: batchIndex);
  return Uint16List.view(data.buffer);
}
