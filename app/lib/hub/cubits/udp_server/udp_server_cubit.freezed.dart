// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'udp_server_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UdpServerState {

 bool get created; bool get running; String? get error; bool get loading; List<UdpPacket> get packets;
/// Create a copy of UdpServerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UdpServerStateCopyWith<UdpServerState> get copyWith => _$UdpServerStateCopyWithImpl<UdpServerState>(this as UdpServerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UdpServerState&&(identical(other.created, created) || other.created == created)&&(identical(other.running, running) || other.running == running)&&(identical(other.error, error) || other.error == error)&&(identical(other.loading, loading) || other.loading == loading)&&const DeepCollectionEquality().equals(other.packets, packets));
}


@override
int get hashCode => Object.hash(runtimeType,created,running,error,loading,const DeepCollectionEquality().hash(packets));

@override
String toString() {
  return 'UdpServerState(created: $created, running: $running, error: $error, loading: $loading, packets: $packets)';
}


}

/// @nodoc
abstract mixin class $UdpServerStateCopyWith<$Res>  {
  factory $UdpServerStateCopyWith(UdpServerState value, $Res Function(UdpServerState) _then) = _$UdpServerStateCopyWithImpl;
@useResult
$Res call({
 bool created, bool running, String? error, bool loading, List<UdpPacket> packets
});




}
/// @nodoc
class _$UdpServerStateCopyWithImpl<$Res>
    implements $UdpServerStateCopyWith<$Res> {
  _$UdpServerStateCopyWithImpl(this._self, this._then);

  final UdpServerState _self;
  final $Res Function(UdpServerState) _then;

/// Create a copy of UdpServerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? created = null,Object? running = null,Object? error = freezed,Object? loading = null,Object? packets = null,}) {
  return _then(_self.copyWith(
created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as bool,running: null == running ? _self.running : running // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,packets: null == packets ? _self.packets : packets // ignore: cast_nullable_to_non_nullable
as List<UdpPacket>,
  ));
}

}


/// @nodoc


class _UdpServerState implements UdpServerState {
  const _UdpServerState({this.created = false, this.running = false, this.error, this.loading = false, final  List<UdpPacket> packets = const []}): _packets = packets;
  

@override@JsonKey() final  bool created;
@override@JsonKey() final  bool running;
@override final  String? error;
@override@JsonKey() final  bool loading;
 final  List<UdpPacket> _packets;
@override@JsonKey() List<UdpPacket> get packets {
  if (_packets is EqualUnmodifiableListView) return _packets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_packets);
}


/// Create a copy of UdpServerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UdpServerStateCopyWith<_UdpServerState> get copyWith => __$UdpServerStateCopyWithImpl<_UdpServerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UdpServerState&&(identical(other.created, created) || other.created == created)&&(identical(other.running, running) || other.running == running)&&(identical(other.error, error) || other.error == error)&&(identical(other.loading, loading) || other.loading == loading)&&const DeepCollectionEquality().equals(other._packets, _packets));
}


@override
int get hashCode => Object.hash(runtimeType,created,running,error,loading,const DeepCollectionEquality().hash(_packets));

@override
String toString() {
  return 'UdpServerState(created: $created, running: $running, error: $error, loading: $loading, packets: $packets)';
}


}

/// @nodoc
abstract mixin class _$UdpServerStateCopyWith<$Res> implements $UdpServerStateCopyWith<$Res> {
  factory _$UdpServerStateCopyWith(_UdpServerState value, $Res Function(_UdpServerState) _then) = __$UdpServerStateCopyWithImpl;
@override @useResult
$Res call({
 bool created, bool running, String? error, bool loading, List<UdpPacket> packets
});




}
/// @nodoc
class __$UdpServerStateCopyWithImpl<$Res>
    implements _$UdpServerStateCopyWith<$Res> {
  __$UdpServerStateCopyWithImpl(this._self, this._then);

  final _UdpServerState _self;
  final $Res Function(_UdpServerState) _then;

/// Create a copy of UdpServerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? created = null,Object? running = null,Object? error = freezed,Object? loading = null,Object? packets = null,}) {
  return _then(_UdpServerState(
created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as bool,running: null == running ? _self.running : running // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,packets: null == packets ? _self._packets : packets // ignore: cast_nullable_to_non_nullable
as List<UdpPacket>,
  ));
}


}

// dart format on
