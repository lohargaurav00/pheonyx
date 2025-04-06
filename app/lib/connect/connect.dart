import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pheonyx/connect/cubits/mdns/mdns_cubit.dart';
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
          // Use Expanded here instead of SizedBox with double.infinity
          child: Card.outlined(
            child: Padding(
              padding: const EdgeInsets.all(padding),
              child:
                  state.services.isEmpty
                      ? const Center(child: Text("No devices"))
                      : ListView.builder(
                        itemCount: state.services.length,
                        itemBuilder: (_, index) {
                          final device = state.services[index];
                          return ListTile(
                            leading: IconConfig(icon: device.deviceType),
                            title: Text(device.name.toUpperCase()),
                          );
                        },
                      ),
            ),
          ),
        ),
      ],
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
