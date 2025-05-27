import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pheonyx/hub/cubits/cubits.dart';

class MdnsView extends StatelessWidget {
  const MdnsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MdnsServerCubit, MdnsServerState>(
      builder: (context, state) {
        return Center(
          child: Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                onPressed:
                    state.running
                        ? null
                        : () => context.read<MdnsServerCubit>().startServer(),
                child: Text('Start Server'),
              ),
              ElevatedButton(
                onPressed:
                    !state.running
                        ? null
                        : () => context.read<MdnsServerCubit>().stopServer(),
                child: Text('Stop Server'),
              ),
            ],
          ),
        );
      },
    );
  }
}
