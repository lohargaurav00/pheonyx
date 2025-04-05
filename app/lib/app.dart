import 'package:flutter/material.dart';
import 'package:pheonyx/connect/connect.dart';
import 'package:pheonyx/hub/hub.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/hub': (context) => const Hub(),
        '/connect': (context) => const Connect(),
      },
      home: Scaffold(
        body: Builder(
          builder:
              (context) => Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/connect'),
                      child: Text("Connect"),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/hub'),
                      child: Text("Hub"),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
