import 'package:flutter/material.dart';
import 'package:pheonyx/app.dart';
import 'package:pheonyx/src/rust/frb_generated.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}
