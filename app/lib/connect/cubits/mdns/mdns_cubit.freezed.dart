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

 bool get isSearching; List<MdnsService> get services; String? get errorMessage; Status get status;
/// Create a copy of MdnsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MdnsStateCopyWith<MdnsState> get copyWith => _$MdnsStateCopyWithImpl<MdnsState>(this as MdnsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MdnsState&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&const DeepCollectionEquality().equals(other.services, services)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,isSearching,const DeepCollectionEquality().hash(services),errorMessage,status);

@override
String toString() {
  return 'MdnsState(isSearching: $isSearching, services: $services, errorMessage: $errorMessage, status: $status)';
}


}

/// @nodoc
abstract mixin class $MdnsStateCopyWith<$Res>  {
  factory $MdnsStateCopyWith(MdnsState value, $Res Function(MdnsState) _then) = _$MdnsStateCopyWithImpl;
@useResult
$Res call({
 bool isSearching, List<MdnsService> services, String? errorMessage, Status status
});




}
/// @nodoc
class _$MdnsStateCopyWithImpl<$Res>
    implements $MdnsStateCopyWith<$Res> {
  _$MdnsStateCopyWithImpl(this._self, this._then);

  final MdnsState _self;
  final $Res Function(MdnsState) _then;

/// Create a copy of MdnsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSearching = null,Object? services = null,Object? errorMessage = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<MdnsService>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,
  ));
}

}


/// @nodoc


class _MdnsState implements MdnsState {
  const _MdnsState({this.isSearching = false, final  List<MdnsService> services = const [], this.errorMessage, this.status = Status.initial}): _services = services;
  

@override@JsonKey() final  bool isSearching;
 final  List<MdnsService> _services;
@override@JsonKey() List<MdnsService> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}

@override final  String? errorMessage;
@override@JsonKey() final  Status status;

/// Create a copy of MdnsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MdnsStateCopyWith<_MdnsState> get copyWith => __$MdnsStateCopyWithImpl<_MdnsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MdnsState&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&const DeepCollectionEquality().equals(other._services, _services)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,isSearching,const DeepCollectionEquality().hash(_services),errorMessage,status);

@override
String toString() {
  return 'MdnsState(isSearching: $isSearching, services: $services, errorMessage: $errorMessage, status: $status)';
}


}

/// @nodoc
abstract mixin class _$MdnsStateCopyWith<$Res> implements $MdnsStateCopyWith<$Res> {
  factory _$MdnsStateCopyWith(_MdnsState value, $Res Function(_MdnsState) _then) = __$MdnsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isSearching, List<MdnsService> services, String? errorMessage, Status status
});




}
/// @nodoc
class __$MdnsStateCopyWithImpl<$Res>
    implements _$MdnsStateCopyWith<$Res> {
  __$MdnsStateCopyWithImpl(this._self, this._then);

  final _MdnsState _self;
  final $Res Function(_MdnsState) _then;

/// Create a copy of MdnsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSearching = null,Object? services = null,Object? errorMessage = freezed,Object? status = null,}) {
  return _then(_MdnsState(
isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<MdnsService>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,
  ));
}


}

// dart format on
