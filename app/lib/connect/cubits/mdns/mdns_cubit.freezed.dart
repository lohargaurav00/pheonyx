// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mdns_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MdnsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MdnsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MdnsState()';
}


}

/// @nodoc
class $MdnsStateCopyWith<$Res>  {
$MdnsStateCopyWith(MdnsState _, $Res Function(MdnsState) __);
}


/// @nodoc


class Initial implements MdnsState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MdnsState.initial()';
}


}




/// @nodoc


class Searching implements MdnsState {
  const Searching(this.searching);
  

 final  bool searching;

/// Create a copy of MdnsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchingCopyWith<Searching> get copyWith => _$SearchingCopyWithImpl<Searching>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Searching&&(identical(other.searching, searching) || other.searching == searching));
}


@override
int get hashCode => Object.hash(runtimeType,searching);

@override
String toString() {
  return 'MdnsState.searching(searching: $searching)';
}


}

/// @nodoc
abstract mixin class $SearchingCopyWith<$Res> implements $MdnsStateCopyWith<$Res> {
  factory $SearchingCopyWith(Searching value, $Res Function(Searching) _then) = _$SearchingCopyWithImpl;
@useResult
$Res call({
 bool searching
});




}
/// @nodoc
class _$SearchingCopyWithImpl<$Res>
    implements $SearchingCopyWith<$Res> {
  _$SearchingCopyWithImpl(this._self, this._then);

  final Searching _self;
  final $Res Function(Searching) _then;

/// Create a copy of MdnsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? searching = null,}) {
  return _then(Searching(
null == searching ? _self.searching : searching // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class Devices implements MdnsState {
  const Devices(final  List<String> services): _services = services;
  

 final  List<String> _services;
 List<String> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}


/// Create a copy of MdnsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DevicesCopyWith<Devices> get copyWith => _$DevicesCopyWithImpl<Devices>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Devices&&const DeepCollectionEquality().equals(other._services, _services));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_services));

@override
String toString() {
  return 'MdnsState.devices(services: $services)';
}


}

/// @nodoc
abstract mixin class $DevicesCopyWith<$Res> implements $MdnsStateCopyWith<$Res> {
  factory $DevicesCopyWith(Devices value, $Res Function(Devices) _then) = _$DevicesCopyWithImpl;
@useResult
$Res call({
 List<String> services
});




}
/// @nodoc
class _$DevicesCopyWithImpl<$Res>
    implements $DevicesCopyWith<$Res> {
  _$DevicesCopyWithImpl(this._self, this._then);

  final Devices _self;
  final $Res Function(Devices) _then;

/// Create a copy of MdnsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? services = null,}) {
  return _then(Devices(
null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class Error implements MdnsState {
  const Error(this.message);
  

 final  String message;

/// Create a copy of MdnsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MdnsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $MdnsStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of MdnsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
