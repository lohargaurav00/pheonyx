import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pheonyx/connect/cubits/mdns/mdns_cubit.dart';
import 'package:pheonyx/src/rust/api/bridge.dart';
import 'package:pheonyx/widgets/icon_config_widget.dart';

const double padding = 8;

class Connect extends StatelessWidget {
  const Connect({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MdnsCubit, MdnsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Connect', style: TextStyle(fontSize: 20)),
            toolbarHeight: 40,
          ),
          body: Padding(
            padding: EdgeInsets.all(padding),
            child: _buildBody(state),
          ),
          floatingActionButton: _buildFloatingActionButton(state, context),
        );
      },
    );
  }

  Widget _buildBody(MdnsState state) {
    if (state.status == Status.error) {
      return Center(
        child: Text(state.errorMessage ?? '', textAlign: TextAlign.center),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _topSection(state),
        Expanded(
          child: Card.outlined(
            child: Padding(
              padding: const EdgeInsets.all(padding),
              child:
                  state.services.isEmpty
                      ? const Center(child: Text("No devices"))
                      : _deviceList(state),
            ),
          ),
        ),
      ],
    );
  }

  ListView _deviceList(MdnsState state) {
    return ListView.builder(
      itemCount: state.services.length,
      itemBuilder: (context, index) {
        final colorTheme = Theme.of(context).colorScheme;
        final device = state.services[index];
        return InkWell(
          borderRadius: BorderRadius.circular(8),
          splashColor: colorTheme.onSecondary.withValues(alpha: 0.1),
          highlightColor: colorTheme.onSecondary.withValues(alpha: 0.1),
          onTap: () async {
            print('Tapped on ${device.name}');
            final client = UdpClient();
            await client.connect(ip: device.ip, port: device.port);
            await client.sendMessage(message: "hello from flutter mobile");

            client.receiveStream().listen(
              (packet) {
                print('packet : ${packet.data}');
              },
              onError: (e) {
                print('packet error : $e');
              },
              cancelOnError: false,
            );
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: colorTheme.onSecondary),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .05),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconConfig(icon: device.deviceType),
                    const SizedBox(width: 10),
                    Text(
                      device.name.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text('Host: ${device.host}'),
                Text('IP: ${device.ip}'),
                Text('Port: ${device.port}'),
                Text('Device Type: ${device.deviceType}'),
                const SizedBox(height: 6),
                if (device.txt.isNotEmpty) ...[
                  const Text(
                    'TXT Records:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  ...device.txt.entries.map(
                    (e) => Text(
                      '${e.key}: ${e.value}',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Card _topSection(MdnsState state) {
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(padding),
        child: Center(
          child:
              state.isSearching
                  ? SizedBox(
                    height: 24,
                    width: 24,
                    child: const CircularProgressIndicator(strokeWidth: 2),
                  )
                  : const Text("Search for devices"),
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton(MdnsState state, BuildContext context) {
    return FloatingActionButton.small(
      onPressed:
          () async =>
              state.isSearching
                  ? Null
                  : await context.read<MdnsCubit>().searchMdnsDevices(),
      child: const Icon(Icons.search),
    );
  }
}
