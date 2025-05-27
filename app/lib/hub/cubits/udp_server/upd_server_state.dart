part of './udp_server_cubit.dart';

@freezed
abstract class UdpServerState with _$UdpServerState {
  const factory UdpServerState({
    @Default(false) bool created,
    @Default(false) bool running,
    String? error,
    @Default(false) bool loading,
    @Default([]) List<UdpPacket> packets,
  }) = _UdpServerState;
}
