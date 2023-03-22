import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:vector_math/vector_math_64.dart';

import 'bridge_generated.dart';

/* Decoding */
class ByteBufferDecoder {
  final Uint8List _buffer;
  late ByteData _byteData;
  int _counter = 0;

  ByteBufferDecoder(this._buffer) {
    _byteData = ByteData.view(_buffer.buffer);
  }

  void reset() {
    _counter = 0;
  }

  // Single-value read methods
  bool readBool() {
    final value = _byteData.getUint8(_counter);
    _counter += 1;
    return value == 1;
  }

  int readU8() {
    final value = _byteData.getUint8(_counter);
    _counter += 1;
    return value;
  }

  int readI8() {
    final value = _byteData.getInt8(_counter);
    _counter += 1;
    return value;
  }

  int readU64() {
    if (kIsWeb) {
      // Can read only the most important 32 bits on web
      if (Endian.host == Endian.little) {
        // Means last 32 bits are the most important
        final low = _byteData.getUint32(_counter, Endian.host);
        _counter += 8;
        return low;
      } else {
        // Means first 32 bits are the most important
        final high = _byteData.getUint32(_counter + 4, Endian.host);
        _counter += 8;
        return high;
      }
    } else {
      final value = _byteData.getUint64(_counter, Endian.host);
      _counter += 8;
      return value;
    }
  }

  int readyU128() {
    final value = _byteData.getUint64(_counter, Endian.host);
    _counter += 8;
    return value;
  }

  double readF32() {
    final value = _byteData.getFloat32(_counter, Endian.host);
    _counter += 4;
    return value;
  }

  double readF64() {
    final value = _byteData.getFloat64(_counter, Endian.host);
    _counter += 8;
    return value;
  }

  // Typed array read methods
  Uint8List readU8Array() {
    final length = readU64();
    final array = Uint8List.view(_buffer.buffer, _counter, length);
    _counter += length;
    return array;
  }

  Float64List readF64Array() {
    final length = readU64();
    final array = Float64List.view(_buffer.buffer, _counter, length);
    _counter += length * 8;
    return array;
  }
}

/* Encoding */
class ByteBufferEncoder {
  ByteData _byteData = ByteData(0);
  int _counter = 0;

  void reset() {
    _byteData = ByteData(0);
    _counter = 0;
  }

  bool growToFitNext(int bytes) {
    if (_counter + bytes > _byteData.lengthInBytes) {
      final newLength = _byteData.lengthInBytes * 8 + bytes;
      final newByteData = ByteData(newLength);
      newByteData.buffer
          .asUint8List()
          .setAll(0, _byteData.buffer.asUint8List());
      _byteData = newByteData;
      return true;
    }
    return false;
  }

  // Single-value write methods
  void writeBool(bool value) {
    growToFitNext(1);
    _byteData.setUint8(_counter, value ? 1 : 0);
    _counter += 1;
  }

  void writeU8(int value) {
    growToFitNext(1);
    _byteData.setUint8(_counter, value);
    _counter += 1;
  }

  void writeI8(int value) {
    growToFitNext(1);
    _byteData.setInt8(_counter, value);
    _counter += 1;
  }

  void writeU64(int value) {
    if (kIsWeb) {
      // Can write only the most important 32 bits on web
      if (Endian.host == Endian.little) {
        // Means last 32 bits are the most important
        growToFitNext(8);
        _byteData.setUint32(_counter, value, Endian.host);
        _counter += 8;
      } else {
        // Means first 32 bits are the most important
        growToFitNext(8);
        _byteData.setUint32(_counter + 4, value, Endian.host);
        _counter += 8;
      }
    } else {
      growToFitNext(8);
      _byteData.setUint64(_counter, value, Endian.host);
      _counter += 8;
    }
  }

  void writeU128(int value) {
    growToFitNext(8);
    _byteData.setUint64(_counter, value, Endian.host);
    _counter += 8;
  }

  void writeF32(double value) {
    growToFitNext(4);
    _byteData.setFloat32(_counter, value, Endian.host);
    _counter += 4;
  }

  void writeF64(double value) {
    growToFitNext(8);
    _byteData.setFloat64(_counter, value, Endian.host);
    _counter += 8;
  }

  // Typed array write methods
  void writeU8Array(Uint8List array) {
    writeU64(array.length);
    growToFitNext(array.length);
    _byteData.buffer.asUint8List().setAll(_counter, array);
    _counter += array.length;
  }

  void writeF64Array(Float64List array) {
    writeU64(array.length);
    growToFitNext(array.length * 8);
    _byteData.buffer.asFloat64List().setAll(_counter, array);
    _counter += array.length * 8;
  }

  // Builder
  Uint8List build() {
    return Uint8List.view(_byteData.buffer, 0, _counter);
  }
}

/* Extensions */
extension Vector2ByteBufferExtensions on Vector2 {
  void encode(ByteBufferEncoder encoder) {
    encoder.writeF64(x);
    encoder.writeF64(y);
  }

  static void encodeArray(ByteBufferEncoder encoder, List<Vector2> array) {
    encoder.writeU64(array.length);
    for (final element in array) {
      element.encode(encoder);
    }
  }

  static Vector2 decode(ByteBufferDecoder decoder) {
    final x = decoder.readF64();
    final y = decoder.readF64();
    return Vector2(x, y);
  }

  static void decodeInto(ByteBufferDecoder decoder, Vector2 vector) {
    vector.x = decoder.readF64();
    vector.y = decoder.readF64();
  }

  static List<Vector2> decodeArray(ByteBufferDecoder decoder) {
    final length = decoder.readU64();
    final array = List.filled(length, Vector2.zero());
    for (var i = 0; i < length; i++) {
      array[i] = decode(decoder);
    }
    return array;
  }

  static List<Vector2> decodeArrayInto(
      ByteBufferDecoder decoder, List<Vector2> array) {
    final length = decoder.readU64();
    for (var i = 0; i < length; i++) {
      array[i].x = decoder.readF64();
      array[i].y = decoder.readF64();
    }
    return array;
  }
}

extension RawIndexByteBufferExtensions on RawIndex {
  void encode(ByteBufferEncoder encoder) {
    encoder.writeU64(field0);
    encoder.writeU64(field1);
  }

  static void encodeArray(ByteBufferEncoder encoder, List<RawIndex> array) {
    encoder.writeU64(array.length);
    for (final element in array) {
      element.encode(encoder);
    }
  }

  static RawIndex decode(ByteBufferDecoder decoder) {
    final index = decoder.readU64();
    final generation = decoder.readU64();
    return RawIndex(field0: index, field1: generation);
  }

  static void decodeArray(ByteBufferDecoder decoder, List<RawIndex> array) {
    final length = decoder.readU64();
    for (var i = 0; i < length; i++) {
      array[i] = decode(decoder);
    }
  }

  static void decodeArrayInto(ByteBufferDecoder decoder, List<RawIndex> array) {
    final length = decoder.readU64();
    for (var i = 0; i < length; i++) {
      array[i] = decode(decoder);
    }
  }
}