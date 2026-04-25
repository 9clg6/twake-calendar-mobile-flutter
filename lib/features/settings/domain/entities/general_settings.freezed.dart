// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GeneralSettingsEntity {

 String? get timezone; bool get hideDeclinedEvents; bool get displayWeekNumbers; bool get alarmEmails;
/// Create a copy of GeneralSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeneralSettingsEntityCopyWith<GeneralSettingsEntity> get copyWith => _$GeneralSettingsEntityCopyWithImpl<GeneralSettingsEntity>(this as GeneralSettingsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneralSettingsEntity&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.hideDeclinedEvents, hideDeclinedEvents) || other.hideDeclinedEvents == hideDeclinedEvents)&&(identical(other.displayWeekNumbers, displayWeekNumbers) || other.displayWeekNumbers == displayWeekNumbers)&&(identical(other.alarmEmails, alarmEmails) || other.alarmEmails == alarmEmails));
}


@override
int get hashCode => Object.hash(runtimeType,timezone,hideDeclinedEvents,displayWeekNumbers,alarmEmails);

@override
String toString() {
  return 'GeneralSettingsEntity(timezone: $timezone, hideDeclinedEvents: $hideDeclinedEvents, displayWeekNumbers: $displayWeekNumbers, alarmEmails: $alarmEmails)';
}


}

/// @nodoc
abstract mixin class $GeneralSettingsEntityCopyWith<$Res>  {
  factory $GeneralSettingsEntityCopyWith(GeneralSettingsEntity value, $Res Function(GeneralSettingsEntity) _then) = _$GeneralSettingsEntityCopyWithImpl;
@useResult
$Res call({
 String? timezone, bool hideDeclinedEvents, bool displayWeekNumbers, bool alarmEmails
});




}
/// @nodoc
class _$GeneralSettingsEntityCopyWithImpl<$Res>
    implements $GeneralSettingsEntityCopyWith<$Res> {
  _$GeneralSettingsEntityCopyWithImpl(this._self, this._then);

  final GeneralSettingsEntity _self;
  final $Res Function(GeneralSettingsEntity) _then;

/// Create a copy of GeneralSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timezone = freezed,Object? hideDeclinedEvents = null,Object? displayWeekNumbers = null,Object? alarmEmails = null,}) {
  return _then(_self.copyWith(
timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,hideDeclinedEvents: null == hideDeclinedEvents ? _self.hideDeclinedEvents : hideDeclinedEvents // ignore: cast_nullable_to_non_nullable
as bool,displayWeekNumbers: null == displayWeekNumbers ? _self.displayWeekNumbers : displayWeekNumbers // ignore: cast_nullable_to_non_nullable
as bool,alarmEmails: null == alarmEmails ? _self.alarmEmails : alarmEmails // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _GeneralSettingsEntity implements GeneralSettingsEntity {
  const _GeneralSettingsEntity({this.timezone, this.hideDeclinedEvents = false, this.displayWeekNumbers = true, this.alarmEmails = false});
  

@override final  String? timezone;
@override@JsonKey() final  bool hideDeclinedEvents;
@override@JsonKey() final  bool displayWeekNumbers;
@override@JsonKey() final  bool alarmEmails;

/// Create a copy of GeneralSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeneralSettingsEntityCopyWith<_GeneralSettingsEntity> get copyWith => __$GeneralSettingsEntityCopyWithImpl<_GeneralSettingsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeneralSettingsEntity&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.hideDeclinedEvents, hideDeclinedEvents) || other.hideDeclinedEvents == hideDeclinedEvents)&&(identical(other.displayWeekNumbers, displayWeekNumbers) || other.displayWeekNumbers == displayWeekNumbers)&&(identical(other.alarmEmails, alarmEmails) || other.alarmEmails == alarmEmails));
}


@override
int get hashCode => Object.hash(runtimeType,timezone,hideDeclinedEvents,displayWeekNumbers,alarmEmails);

@override
String toString() {
  return 'GeneralSettingsEntity(timezone: $timezone, hideDeclinedEvents: $hideDeclinedEvents, displayWeekNumbers: $displayWeekNumbers, alarmEmails: $alarmEmails)';
}


}

/// @nodoc
abstract mixin class _$GeneralSettingsEntityCopyWith<$Res> implements $GeneralSettingsEntityCopyWith<$Res> {
  factory _$GeneralSettingsEntityCopyWith(_GeneralSettingsEntity value, $Res Function(_GeneralSettingsEntity) _then) = __$GeneralSettingsEntityCopyWithImpl;
@override @useResult
$Res call({
 String? timezone, bool hideDeclinedEvents, bool displayWeekNumbers, bool alarmEmails
});




}
/// @nodoc
class __$GeneralSettingsEntityCopyWithImpl<$Res>
    implements _$GeneralSettingsEntityCopyWith<$Res> {
  __$GeneralSettingsEntityCopyWithImpl(this._self, this._then);

  final _GeneralSettingsEntity _self;
  final $Res Function(_GeneralSettingsEntity) _then;

/// Create a copy of GeneralSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timezone = freezed,Object? hideDeclinedEvents = null,Object? displayWeekNumbers = null,Object? alarmEmails = null,}) {
  return _then(_GeneralSettingsEntity(
timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,hideDeclinedEvents: null == hideDeclinedEvents ? _self.hideDeclinedEvents : hideDeclinedEvents // ignore: cast_nullable_to_non_nullable
as bool,displayWeekNumbers: null == displayWeekNumbers ? _self.displayWeekNumbers : displayWeekNumbers // ignore: cast_nullable_to_non_nullable
as bool,alarmEmails: null == alarmEmails ? _self.alarmEmails : alarmEmails // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
