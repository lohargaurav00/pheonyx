part of 'mdns_cubit.dart';

@freezed
abstract class MdnsState with _$MdnsState {
  const factory MdnsState({
    @Default(false) bool isSearching,
    @Default([]) List<MdnsService> services,
    String? errorMessage,
    @Default(Status.initial) Status status,
  }) = _MdnsState;
}

enum Status { initial, loading, success, error }
