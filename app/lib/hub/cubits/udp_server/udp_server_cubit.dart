import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pheonyx/src/rust/api/bridge.dart';

part 'upd_server_state.dart';
part 'udp_server_cubit.freezed.dart';

const udpServerPort = 6000;

class UdpServerCubit extends Cubit<UdpServerState> {
  UdpServer? _server;
  StreamSubscription? _subscription;

  UdpServerCubit() : super(const UdpServerState(loading: true)) {
    _init();
  }

  Future<void> _init() async {
    try {
      _server = await startUdpServer(port: udpServerPort);
      emit(state.copyWith(loading: false));
      _startListening();
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  Future<void> sendMessage(String msg) async {
    if (_server == null) {
      emit(state.copyWith(error: "Server Not Running"));
      return;
    }

    try {
      await udpSendMessage(server: _server!, msg: msg);
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  void _startListening() {
    if (_server == null) {
      emit(state.copyWith(error: "Server Not Running"));
      return;
    }

    _subscription = udpReceiveStream(server: _server!).listen(
      (packet) {
        final updated = [packet, ...state.packets];

        final trimmed =
            updated.length > 5 ? updated.sublist(updated.length - 5) : updated;

        emit(state.copyWith(packets: trimmed));
      },
      onError: (e) {
        emit(state.copyWith(error: "Stream Error: $e"));
      },
      cancelOnError: false,
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
