// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mdns_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MdnsService {

 String get name; String get host; String get ip; int get port; String get deviceType; Map<String, String> get txt;
/// Create a copy of MdnsService
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MdnsServiceCopyWith<MdnsService> get copyWith => _$MdnsServiceCopyWithImpl<MdnsService>(this as MdnsService, _$identity);

  /// Serializes this MdnsService to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MdnsService&&(identical(other.name, name) || other.name == name)&&(identical(other.host, host) || other.host == host)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.port, port) || other.port == port)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&const DeepCollectionEquality().equals(other.txt, txt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,host,ip,port,deviceType,const DeepCollectionEquality().hash(txt));

@override
String toString() {
  return 'MdnsService(name: $name, host: $host, ip: $ip, port: $port, deviceType: $deviceType, txt: $txt)';
}


}

/// @nodoc
abstract mixin class $MdnsServiceCopyWith<$Res>  {
  factory $MdnsServiceCopyWith(MdnsService value, $Res Function(MdnsService) _then) = _$MdnsServiceCopyWithImpl;
@useResult
$Res call({
 String name, String host, String ip, int port, String deviceType, Map<String, String> txt
});




}
/// @nodoc
class _$MdnsServiceCopyWithImpl<$Res>
    implements $MdnsServiceCopyWith<$Res> {
  _$MdnsServiceCopyWithImpl(this._self, this._then);

  final MdnsService _self;
  final $Res Function(MdnsService) _then;

/// Create a copy of MdnsService
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? host = null,Object? ip = null,Object? port = null,Object? deviceType = null,Object? txt = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,deviceType: null == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String,txt: null == txt ? _self.txt : txt // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MdnsService implements MdnsService {
  const _MdnsService({required this.name, required this.host, required this.ip, required this.port, required this.deviceType, required final  Map<String, String> txt}): _txt = txt;
  factory _MdnsService.fromJson(Map<String, dynamic> json) => _$MdnsServiceFromJson(json);

@override final  String name;
@override final  String host;
@override final  String ip;
@override final  int port;
@override final  String deviceType;
 final  Map<String, String> _txt;
@override Map<String, String> get txt {
  if (_txt is EqualUnmodifiableMapView) return _txt;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_txt);
}


/// Create a copy of MdnsService
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MdnsServiceCopyWith<_MdnsService> get copyWith => __$MdnsServiceCopyWithImpl<_MdnsService>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MdnsServiceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MdnsService&&(identical(other.name, name) || other.name == name)&&(identical(other.host, host) || other.host == host)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.port, port) || other.port == port)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&const DeepCollectionEquality().equals(other._txt, _txt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,host,ip,port,deviceType,const DeepCollectionEquality().hash(_txt));

@override
String toString() {
  return 'MdnsService(name: $name, host: $host, ip: $ip, port: $port, deviceType: $deviceType, txt: $txt)';
}


}

/// @nodoc
abstract mixin class _$MdnsServiceCopyWith<$Res> implements $MdnsServiceCopyWith<$Res> {
  factory _$MdnsServiceCopyWith(_MdnsService value, $Res Function(_MdnsService) _then) = __$MdnsServiceCopyWithImpl;
@override @useResult
$Res call({
 String name, String host, String ip, int port, String deviceType, Map<String, String> txt
});




}
/// @nodoc
class __$MdnsServiceCopyWithImpl<$Res>
    implements _$MdnsServiceCopyWith<$Res> {
  __$MdnsServiceCopyWithImpl(this._self, this._then);

  final _MdnsService _self;
  final $Res Function(_MdnsService) _then;

/// Create a copy of MdnsService
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? host = null,Object? ip = null,Object? port = null,Object? deviceType = null,Object? txt = null,}) {
  return _then(_MdnsService(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,deviceType: null == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String,txt: null == txt ? _self._txt : txt // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

// dart format on
