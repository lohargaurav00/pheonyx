import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pheonyx/connect/cubits/mdns/mdns_cubit.dart';

class Connect extends StatelessWidget {
  const Connect({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MdnsCubit, MdnsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Connect')),
          // body: Text('$state'),
          body: _buildBody(state),
          floatingActionButton: _buildFloatingActionButton(state, context),
        );
      },
    );
  }

  Widget _buildBody(MdnsState state) {
    return Center(
      child: switch (state) {
        Initial() => const Text('Press search to find devices.'),
        Searching(:final searching) =>
          searching
              ? const CircularProgressIndicator()
              : const Text('Press search to find devices.'),
        Devices(:final services) =>
          services.isEmpty
              ? const Text("No devices found.")
              : ListView.builder(
                itemCount: services.length,
                itemBuilder:
                    (_, index) => ListTile(title: Text(services[index])),
              ),
        Error(:final message) => Text('Error: $message'),
      },
    );
  }

  Widget _buildFloatingActionButton(MdnsState state, BuildContext context) {
    return FloatingActionButton.small(
      onPressed: switch (state) {
        Initial() => () => context.read<MdnsCubit>().searchMdnsDevices(),
        Searching(searching: false) =>
          () => context.read<MdnsCubit>().searchMdnsDevices(),
        _ => null,
      },
      child: const Icon(Icons.search),
    );
  }
}
