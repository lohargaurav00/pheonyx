import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pheonyx/connect/connect.dart';
import 'package:pheonyx/connect/cubits/mdns/mdns_cubit.dart';
import 'package:pheonyx/hub/hub.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/hub': (context) => const Hub(),
        '/connect':
            (context) => BlocProvider(
              create: (context) => MdnsCubit(),
              child: const Connect(),
            ),
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
