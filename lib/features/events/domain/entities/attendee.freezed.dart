// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AttendeeEntity {

 String get calAddress; Partstat get partstat; AttendeeRole get role; CuType get cutype; bool get rsvp; String get cn;
/// Create a copy of AttendeeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendeeEntityCopyWith<AttendeeEntity> get copyWith => _$AttendeeEntityCopyWithImpl<AttendeeEntity>(this as AttendeeEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendeeEntity&&(identical(other.calAddress, calAddress) || other.calAddress == calAddress)&&(identical(other.partstat, partstat) || other.partstat == partstat)&&(identical(other.role, role) || other.role == role)&&(identical(other.cutype, cutype) || other.cutype == cutype)&&(identical(other.rsvp, rsvp) || other.rsvp == rsvp)&&(identical(other.cn, cn) || other.cn == cn));
}


@override
int get hashCode => Object.hash(runtimeType,calAddress,partstat,role,cutype,rsvp,cn);

@override
String toString() {
  return 'AttendeeEntity(calAddress: $calAddress, partstat: $partstat, role: $role, cutype: $cutype, rsvp: $rsvp, cn: $cn)';
}


}

/// @nodoc
abstract mixin class $AttendeeEntityCopyWith<$Res>  {
  factory $AttendeeEntityCopyWith(AttendeeEntity value, $Res Function(AttendeeEntity) _then) = _$AttendeeEntityCopyWithImpl;
@useResult
$Res call({
 String calAddress, Partstat partstat, AttendeeRole role, CuType cutype, bool rsvp, String cn
});




}
/// @nodoc
class _$AttendeeEntityCopyWithImpl<$Res>
    implements $AttendeeEntityCopyWith<$Res> {
  _$AttendeeEntityCopyWithImpl(this._self, this._then);

  final AttendeeEntity _self;
  final $Res Function(AttendeeEntity) _then;

/// Create a copy of AttendeeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? calAddress = null,Object? partstat = null,Object? role = null,Object? cutype = null,Object? rsvp = null,Object? cn = null,}) {
  return _then(_self.copyWith(
calAddress: null == calAddress ? _self.calAddress : calAddress // ignore: cast_nullable_to_non_nullable
as String,partstat: null == partstat ? _self.partstat : partstat // ignore: cast_nullable_to_non_nullable
as Partstat,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AttendeeRole,cutype: null == cutype ? _self.cutype : cutype // ignore: cast_nullable_to_non_nullable
as CuType,rsvp: null == rsvp ? _self.rsvp : rsvp // ignore: cast_nullable_to_non_nullable
as bool,cn: null == cn ? _self.cn : cn // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _AttendeeEntity implements AttendeeEntity {
  const _AttendeeEntity({required this.calAddress, this.partstat = Partstat.needsAction, this.role = AttendeeRole.reqParticipant, this.cutype = CuType.individual, this.rsvp = false, this.cn = ''});
  

@override final  String calAddress;
@override@JsonKey() final  Partstat partstat;
@override@JsonKey() final  AttendeeRole role;
@override@JsonKey() final  CuType cutype;
@override@JsonKey() final  bool rsvp;
@override@JsonKey() final  String cn;

/// Create a copy of AttendeeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendeeEntityCopyWith<_AttendeeEntity> get copyWith => __$AttendeeEntityCopyWithImpl<_AttendeeEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendeeEntity&&(identical(other.calAddress, calAddress) || other.calAddress == calAddress)&&(identical(other.partstat, partstat) || other.partstat == partstat)&&(identical(other.role, role) || other.role == role)&&(identical(other.cutype, cutype) || other.cutype == cutype)&&(identical(other.rsvp, rsvp) || other.rsvp == rsvp)&&(identical(other.cn, cn) || other.cn == cn));
}


@override
int get hashCode => Object.hash(runtimeType,calAddress,partstat,role,cutype,rsvp,cn);

@override
String toString() {
  return 'AttendeeEntity(calAddress: $calAddress, partstat: $partstat, role: $role, cutype: $cutype, rsvp: $rsvp, cn: $cn)';
}


}

/// @nodoc
abstract mixin class _$AttendeeEntityCopyWith<$Res> implements $AttendeeEntityCopyWith<$Res> {
  factory _$AttendeeEntityCopyWith(_AttendeeEntity value, $Res Function(_AttendeeEntity) _then) = __$AttendeeEntityCopyWithImpl;
@override @useResult
$Res call({
 String calAddress, Partstat partstat, AttendeeRole role, CuType cutype, bool rsvp, String cn
});




}
/// @nodoc
class __$AttendeeEntityCopyWithImpl<$Res>
    implements _$AttendeeEntityCopyWith<$Res> {
  __$AttendeeEntityCopyWithImpl(this._self, this._then);

  final _AttendeeEntity _self;
  final $Res Function(_AttendeeEntity) _then;

/// Create a copy of AttendeeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? calAddress = null,Object? partstat = null,Object? role = null,Object? cutype = null,Object? rsvp = null,Object? cn = null,}) {
  return _then(_AttendeeEntity(
calAddress: null == calAddress ? _self.calAddress : calAddress // ignore: cast_nullable_to_non_nullable
as String,partstat: null == partstat ? _self.partstat : partstat // ignore: cast_nullable_to_non_nullable
as Partstat,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AttendeeRole,cutype: null == cutype ? _self.cutype : cutype // ignore: cast_nullable_to_non_nullable
as CuType,rsvp: null == rsvp ? _self.rsvp : rsvp // ignore: cast_nullable_to_non_nullable
as bool,cn: null == cn ? _self.cn : cn // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
