import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pheonyx/src/rust/api/bridge.dart';

part './mdns_server_state.dart';
part 'mdns_server_cubit.freezed.dart';

class MdnsServerCubit extends Cubit<MdnsServerState> {
  MdnsServerCubit()
    : _server = createMdnsServerDaimon(),
      super(const MdnsServerState(created: true));

  MdnsServer _server;

  createServer() {
    _server = createMdnsServerDaimon();
    emit(state.copyWith(created: true));
  }

  startServer() {
    try {
      startMdnsDaimon(server: _server);
      emit(state.copyWith(running: true));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  stopServer() {
    try {
      stopMdnsDaimon(server: _server);
      emit(state.copyWith(running: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  checkServerStatus() {
    final isRunning = mdnsDaimonRunning(server: _server);
    emit(state.copyWith(running: isRunning));
  }
}
