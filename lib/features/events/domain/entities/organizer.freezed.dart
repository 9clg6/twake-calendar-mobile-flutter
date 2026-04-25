// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organizer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrganizerEntity {

 String get calAddress; String get cn;
/// Create a copy of OrganizerEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganizerEntityCopyWith<OrganizerEntity> get copyWith => _$OrganizerEntityCopyWithImpl<OrganizerEntity>(this as OrganizerEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrganizerEntity&&(identical(other.calAddress, calAddress) || other.calAddress == calAddress)&&(identical(other.cn, cn) || other.cn == cn));
}


@override
int get hashCode => Object.hash(runtimeType,calAddress,cn);

@override
String toString() {
  return 'OrganizerEntity(calAddress: $calAddress, cn: $cn)';
}


}

/// @nodoc
abstract mixin class $OrganizerEntityCopyWith<$Res>  {
  factory $OrganizerEntityCopyWith(OrganizerEntity value, $Res Function(OrganizerEntity) _then) = _$OrganizerEntityCopyWithImpl;
@useResult
$Res call({
 String calAddress, String cn
});




}
/// @nodoc
class _$OrganizerEntityCopyWithImpl<$Res>
    implements $OrganizerEntityCopyWith<$Res> {
  _$OrganizerEntityCopyWithImpl(this._self, this._then);

  final OrganizerEntity _self;
  final $Res Function(OrganizerEntity) _then;

/// Create a copy of OrganizerEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? calAddress = null,Object? cn = null,}) {
  return _then(_self.copyWith(
calAddress: null == calAddress ? _self.calAddress : calAddress // ignore: cast_nullable_to_non_nullable
as String,cn: null == cn ? _self.cn : cn // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _OrganizerEntity implements OrganizerEntity {
  const _OrganizerEntity({required this.calAddress, this.cn = ''});
  

@override final  String calAddress;
@override@JsonKey() final  String cn;

/// Create a copy of OrganizerEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrganizerEntityCopyWith<_OrganizerEntity> get copyWith => __$OrganizerEntityCopyWithImpl<_OrganizerEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrganizerEntity&&(identical(other.calAddress, calAddress) || other.calAddress == calAddress)&&(identical(other.cn, cn) || other.cn == cn));
}


@override
int get hashCode => Object.hash(runtimeType,calAddress,cn);

@override
String toString() {
  return 'OrganizerEntity(calAddress: $calAddress, cn: $cn)';
}


}

/// @nodoc
abstract mixin class _$OrganizerEntityCopyWith<$Res> implements $OrganizerEntityCopyWith<$Res> {
  factory _$OrganizerEntityCopyWith(_OrganizerEntity value, $Res Function(_OrganizerEntity) _then) = __$OrganizerEntityCopyWithImpl;
@override @useResult
$Res call({
 String calAddress, String cn
});




}
/// @nodoc
class __$OrganizerEntityCopyWithImpl<$Res>
    implements _$OrganizerEntityCopyWith<$Res> {
  __$OrganizerEntityCopyWithImpl(this._self, this._then);

  final _OrganizerEntity _self;
  final $Res Function(_OrganizerEntity) _then;

/// Create a copy of OrganizerEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? calAddress = null,Object? cn = null,}) {
  return _then(_OrganizerEntity(
calAddress: null == calAddress ? _self.calAddress : calAddress // ignore: cast_nullable_to_non_nullable
as String,cn: null == cn ? _self.cn : cn // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
