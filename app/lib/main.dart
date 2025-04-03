import 'package:flutter/material.dart';
import 'package:pheonyx/src/rust/api/mdns.dart';
import 'package:pheonyx/src/rust/frb_generated.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Pheonyx')),

        body: Center(
          child: ElevatedButton(
            onPressed: () async => await startMdnsServer(),
            child: Text("Start Mdns"),
          ),
        ),
      ),
    );
  }
}
