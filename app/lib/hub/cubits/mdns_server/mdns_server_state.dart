part of './mdns_server_cubit.dart';

@freezed
abstract class MdnsServerState with _$MdnsServerState {
  const factory MdnsServerState({
    @Default(false) bool created,
    @Default(false) bool running,
    @Default(null) String? error,
  }) = _MdnsServerState;
}
