import 'package:flutter/material.dart';
import 'package:pheonyx/src/rust/api/mdns.dart';

class Hub extends StatelessWidget {
  const Hub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hub')),
      body: Center(
        child: FilledButton(
          onPressed: () async => await startMdnsServer(),
          child: Text('Start Server'),
        ),
      ),
    );
  }
}
