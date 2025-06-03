import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pheonyx/hub/cubits/cubits.dart';

class UdpView extends StatefulWidget {
  const UdpView({super.key});

  @override
  State<UdpView> createState() => _UdpViewState();
}

class _UdpViewState extends State<UdpView> {
  final TextEditingController _controller = TextEditingController();
  UdpServerCubit? _udpServer;

  Future<void> _sendMessage() async {
    if (_udpServer == null) {
      return;
    }
    final message = _controller.text.trim();

    print('message : $message');
    if (message.isNotEmpty) {
      await _udpServer!.sendMessage(message);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    _udpServer = context.read<UdpServerCubit>();
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            labelText: "Message...",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(onPressed: _sendMessage, child: const Text('Send')),
      ],
    );
  }
}
