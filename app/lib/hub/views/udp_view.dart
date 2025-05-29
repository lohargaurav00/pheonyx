import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pheonyx/hub/cubits/cubits.dart';

class UdpView extends StatelessWidget {
  const UdpView({super.key});

  @override
  Widget build(BuildContext context) {
    final udpServer = context.read<UdpServerCubit>();
    UdpServerState state = udpServer.state;

    return SizedBox(
      child: TextField(
        decoration: InputDecoration(
          labelText: "Message...",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
