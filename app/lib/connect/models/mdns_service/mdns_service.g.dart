// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mdns_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MdnsService _$MdnsServiceFromJson(Map<String, dynamic> json) => _MdnsService(
  name: json['name'] as String,
  host: json['host'] as String,
  ip: json['ip'] as String,
  port: (json['port'] as num).toInt(),
  deviceType: json['deviceType'] as String,
  txt: Map<String, String>.from(json['txt'] as Map),
);

Map<String, dynamic> _$MdnsServiceToJson(_MdnsService instance) =>
    <String, dynamic>{
      'name': instance.name,
      'host': instance.host,
      'ip': instance.ip,
      'port': instance.port,
      'deviceType': instance.deviceType,
      'txt': instance.txt,
    };
