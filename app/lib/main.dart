import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pheonyx/app.dart';
import 'package:pheonyx/app_bloc_observer.dart';
import 'package:pheonyx/src/rust/frb_generated.dart';

Future<void> main() async {
  await RustLib.init();
  Bloc.observer = const AppBlocObserver();
  runApp(const MyApp());
}
