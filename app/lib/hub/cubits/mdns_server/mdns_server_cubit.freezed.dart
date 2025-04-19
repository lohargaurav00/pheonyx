// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mdns_server_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MdnsServerState {

 bool get created; bool get running; String? get error;
/// Create a copy of MdnsServerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MdnsServerStateCopyWith<MdnsServerState> get copyWith => _$MdnsServerStateCopyWithImpl<MdnsServerState>(this as MdnsServerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MdnsServerState&&(identical(other.created, created) || other.created == created)&&(identical(other.running, running) || other.running == running)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,created,running,error);

@override
String toString() {
  return 'MdnsServerState(created: $created, running: $running, error: $error)';
}


}

/// @nodoc
abstract mixin class $MdnsServerStateCopyWith<$Res>  {
  factory $MdnsServerStateCopyWith(MdnsServerState value, $Res Function(MdnsServerState) _then) = _$MdnsServerStateCopyWithImpl;
@useResult
$Res call({
 bool created, bool running, String? error
});




}
/// @nodoc
class _$MdnsServerStateCopyWithImpl<$Res>
    implements $MdnsServerStateCopyWith<$Res> {
  _$MdnsServerStateCopyWithImpl(this._self, this._then);

  final MdnsServerState _self;
  final $Res Function(MdnsServerState) _then;

/// Create a copy of MdnsServerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? created = null,Object? running = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as bool,running: null == running ? _self.running : running // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _MdnsServerState implements MdnsServerState {
  const _MdnsServerState({this.created = false, this.running = false, this.error = null});
  

@override@JsonKey() final  bool created;
@override@JsonKey() final  bool running;
@override@JsonKey() final  String? error;

/// Create a copy of MdnsServerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MdnsServerStateCopyWith<_MdnsServerState> get copyWith => __$MdnsServerStateCopyWithImpl<_MdnsServerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MdnsServerState&&(identical(other.created, created) || other.created == created)&&(identical(other.running, running) || other.running == running)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,created,running,error);

@override
String toString() {
  return 'MdnsServerState(created: $created, running: $running, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MdnsServerStateCopyWith<$Res> implements $MdnsServerStateCopyWith<$Res> {
  factory _$MdnsServerStateCopyWith(_MdnsServerState value, $Res Function(_MdnsServerState) _then) = __$MdnsServerStateCopyWithImpl;
@override @useResult
$Res call({
 bool created, bool running, String? error
});




}
/// @nodoc
class __$MdnsServerStateCopyWithImpl<$Res>
    implements _$MdnsServerStateCopyWith<$Res> {
  __$MdnsServerStateCopyWithImpl(this._self, this._then);

  final _MdnsServerState _self;
  final $Res Function(_MdnsServerState) _then;

/// Create a copy of MdnsServerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? created = null,Object? running = null,Object? error = freezed,}) {
  return _then(_MdnsServerState(
created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as bool,running: null == running ? _self.running : running // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
