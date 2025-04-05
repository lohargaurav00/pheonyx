part of 'mdns_cubit.dart';

@freezed
sealed class MdnsState with _$MdnsState {
  const factory MdnsState.initial() = Initial;
  const factory MdnsState.searching(bool searching) = Searching;
  const factory MdnsState.devices(List<String> services) = Devices;
  const factory MdnsState.error(String message) = Error;
}
