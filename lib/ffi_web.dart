// This file initializes the dynamic library and connects it with the stub
// generated by flutter_rust_bridge_codegen.

import 'dart:html';

import 'package:flutter/rendering.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'bridge_generated.web.dart';

const root = 'pkg/native';

Future<WasmModule> _initModule() {
  if (crossOriginIsolated != true) {
    return Future.error(const MissingHeaderException());
  }

  final script = ScriptElement()..src = '$root.js';
  document.head!.append(script);
  return script.onLoad.first.then((_) {
    eval("window.wasm_bindgen = wasm_bindgen");
    debugPrint('Loaded $root.js and set wasm_bindgen');
    return wasmModule.bind(wasmModule, '${root}_bg.wasm');
  });
}

final api = NativeImpl.wasm(
  _initModule(),
);