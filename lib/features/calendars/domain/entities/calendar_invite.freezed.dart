// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_invite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CalendarInviteEntity {

 String get href; String get principal; AccessRight get access; int get inviteStatus;
/// Create a copy of CalendarInviteEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarInviteEntityCopyWith<CalendarInviteEntity> get copyWith => _$CalendarInviteEntityCopyWithImpl<CalendarInviteEntity>(this as CalendarInviteEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarInviteEntity&&(identical(other.href, href) || other.href == href)&&(identical(other.principal, principal) || other.principal == principal)&&(identical(other.access, access) || other.access == access)&&(identical(other.inviteStatus, inviteStatus) || other.inviteStatus == inviteStatus));
}


@override
int get hashCode => Object.hash(runtimeType,href,principal,access,inviteStatus);

@override
String toString() {
  return 'CalendarInviteEntity(href: $href, principal: $principal, access: $access, inviteStatus: $inviteStatus)';
}


}

/// @nodoc
abstract mixin class $CalendarInviteEntityCopyWith<$Res>  {
  factory $CalendarInviteEntityCopyWith(CalendarInviteEntity value, $Res Function(CalendarInviteEntity) _then) = _$CalendarInviteEntityCopyWithImpl;
@useResult
$Res call({
 String href, String principal, AccessRight access, int inviteStatus
});




}
/// @nodoc
class _$CalendarInviteEntityCopyWithImpl<$Res>
    implements $CalendarInviteEntityCopyWith<$Res> {
  _$CalendarInviteEntityCopyWithImpl(this._self, this._then);

  final CalendarInviteEntity _self;
  final $Res Function(CalendarInviteEntity) _then;

/// Create a copy of CalendarInviteEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? href = null,Object? principal = null,Object? access = null,Object? inviteStatus = null,}) {
  return _then(_self.copyWith(
href: null == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String,principal: null == principal ? _self.principal : principal // ignore: cast_nullable_to_non_nullable
as String,access: null == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as AccessRight,inviteStatus: null == inviteStatus ? _self.inviteStatus : inviteStatus // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _CalendarInviteEntity implements CalendarInviteEntity {
  const _CalendarInviteEntity({required this.href, required this.principal, required this.access, required this.inviteStatus});
  

@override final  String href;
@override final  String principal;
@override final  AccessRight access;
@override final  int inviteStatus;

/// Create a copy of CalendarInviteEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarInviteEntityCopyWith<_CalendarInviteEntity> get copyWith => __$CalendarInviteEntityCopyWithImpl<_CalendarInviteEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarInviteEntity&&(identical(other.href, href) || other.href == href)&&(identical(other.principal, principal) || other.principal == principal)&&(identical(other.access, access) || other.access == access)&&(identical(other.inviteStatus, inviteStatus) || other.inviteStatus == inviteStatus));
}


@override
int get hashCode => Object.hash(runtimeType,href,principal,access,inviteStatus);

@override
String toString() {
  return 'CalendarInviteEntity(href: $href, principal: $principal, access: $access, inviteStatus: $inviteStatus)';
}


}

/// @nodoc
abstract mixin class _$CalendarInviteEntityCopyWith<$Res> implements $CalendarInviteEntityCopyWith<$Res> {
  factory _$CalendarInviteEntityCopyWith(_CalendarInviteEntity value, $Res Function(_CalendarInviteEntity) _then) = __$CalendarInviteEntityCopyWithImpl;
@override @useResult
$Res call({
 String href, String principal, AccessRight access, int inviteStatus
});




}
/// @nodoc
class __$CalendarInviteEntityCopyWithImpl<$Res>
    implements _$CalendarInviteEntityCopyWith<$Res> {
  __$CalendarInviteEntityCopyWithImpl(this._self, this._then);

  final _CalendarInviteEntity _self;
  final $Res Function(_CalendarInviteEntity) _then;

/// Create a copy of CalendarInviteEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? href = null,Object? principal = null,Object? access = null,Object? inviteStatus = null,}) {
  return _then(_CalendarInviteEntity(
href: null == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String,principal: null == principal ? _self.principal : principal // ignore: cast_nullable_to_non_nullable
as String,access: null == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as AccessRight,inviteStatus: null == inviteStatus ? _self.inviteStatus : inviteStatus // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
