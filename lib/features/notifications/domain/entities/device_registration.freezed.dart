// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeviceRegistrationEntity {

 String get fcmToken; String get platform; String? get deviceId; String? get locale;
/// Create a copy of DeviceRegistrationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceRegistrationEntityCopyWith<DeviceRegistrationEntity> get copyWith => _$DeviceRegistrationEntityCopyWithImpl<DeviceRegistrationEntity>(this as DeviceRegistrationEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceRegistrationEntity&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,fcmToken,platform,deviceId,locale);

@override
String toString() {
  return 'DeviceRegistrationEntity(fcmToken: $fcmToken, platform: $platform, deviceId: $deviceId, locale: $locale)';
}


}

/// @nodoc
abstract mixin class $DeviceRegistrationEntityCopyWith<$Res>  {
  factory $DeviceRegistrationEntityCopyWith(DeviceRegistrationEntity value, $Res Function(DeviceRegistrationEntity) _then) = _$DeviceRegistrationEntityCopyWithImpl;
@useResult
$Res call({
 String fcmToken, String platform, String? deviceId, String? locale
});




}
/// @nodoc
class _$DeviceRegistrationEntityCopyWithImpl<$Res>
    implements $DeviceRegistrationEntityCopyWith<$Res> {
  _$DeviceRegistrationEntityCopyWithImpl(this._self, this._then);

  final DeviceRegistrationEntity _self;
  final $Res Function(DeviceRegistrationEntity) _then;

/// Create a copy of DeviceRegistrationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fcmToken = null,Object? platform = null,Object? deviceId = freezed,Object? locale = freezed,}) {
  return _then(_self.copyWith(
fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _DeviceRegistrationEntity implements DeviceRegistrationEntity {
  const _DeviceRegistrationEntity({required this.fcmToken, required this.platform, this.deviceId, this.locale});
  

@override final  String fcmToken;
@override final  String platform;
@override final  String? deviceId;
@override final  String? locale;

/// Create a copy of DeviceRegistrationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceRegistrationEntityCopyWith<_DeviceRegistrationEntity> get copyWith => __$DeviceRegistrationEntityCopyWithImpl<_DeviceRegistrationEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceRegistrationEntity&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,fcmToken,platform,deviceId,locale);

@override
String toString() {
  return 'DeviceRegistrationEntity(fcmToken: $fcmToken, platform: $platform, deviceId: $deviceId, locale: $locale)';
}


}

/// @nodoc
abstract mixin class _$DeviceRegistrationEntityCopyWith<$Res> implements $DeviceRegistrationEntityCopyWith<$Res> {
  factory _$DeviceRegistrationEntityCopyWith(_DeviceRegistrationEntity value, $Res Function(_DeviceRegistrationEntity) _then) = __$DeviceRegistrationEntityCopyWithImpl;
@override @useResult
$Res call({
 String fcmToken, String platform, String? deviceId, String? locale
});




}
/// @nodoc
class __$DeviceRegistrationEntityCopyWithImpl<$Res>
    implements _$DeviceRegistrationEntityCopyWith<$Res> {
  __$DeviceRegistrationEntityCopyWithImpl(this._self, this._then);

  final _DeviceRegistrationEntity _self;
  final $Res Function(_DeviceRegistrationEntity) _then;

/// Create a copy of DeviceRegistrationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fcmToken = null,Object? platform = null,Object? deviceId = freezed,Object? locale = freezed,}) {
  return _then(_DeviceRegistrationEntity(
fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
