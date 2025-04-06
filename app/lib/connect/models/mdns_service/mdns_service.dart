import 'package:freezed_annotation/freezed_annotation.dart';

part 'mdns_service.freezed.dart';
part 'mdns_service.g.dart';

@freezed
abstract class MdnsService with _$MdnsService {
  const factory MdnsService({
    required String name,
    required String host,
    required String ip,
    required int port,
    required String deviceType,
    required Map<String, String> txt,
  }) = _MdnsService;

  factory MdnsService.fromJson(Map<String, dynamic> json) =>
      _$MdnsServiceFromJson(json);
}
