import 'package:flutter/material.dart';
import 'package:pheonyx/hub/views/mdns_view.dart';
import 'package:pheonyx/hub/views/udp_view.dart';

class Hub extends StatelessWidget {
  const Hub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hub')),
      body: Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: Column(spacing: 8, children: [UdpView(), MdnsView()]),
      ),
    );
  }
}
