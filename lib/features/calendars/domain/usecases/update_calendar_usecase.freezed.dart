// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_calendar_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdateCalendarParams {

 String get calendarLink; String? get name; String? get description; String? get color;
/// Create a copy of UpdateCalendarParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateCalendarParamsCopyWith<UpdateCalendarParams> get copyWith => _$UpdateCalendarParamsCopyWithImpl<UpdateCalendarParams>(this as UpdateCalendarParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateCalendarParams&&(identical(other.calendarLink, calendarLink) || other.calendarLink == calendarLink)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,calendarLink,name,description,color);

@override
String toString() {
  return 'UpdateCalendarParams(calendarLink: $calendarLink, name: $name, description: $description, color: $color)';
}


}

/// @nodoc
abstract mixin class $UpdateCalendarParamsCopyWith<$Res>  {
  factory $UpdateCalendarParamsCopyWith(UpdateCalendarParams value, $Res Function(UpdateCalendarParams) _then) = _$UpdateCalendarParamsCopyWithImpl;
@useResult
$Res call({
 String calendarLink, String? name, String? description, String? color
});




}
/// @nodoc
class _$UpdateCalendarParamsCopyWithImpl<$Res>
    implements $UpdateCalendarParamsCopyWith<$Res> {
  _$UpdateCalendarParamsCopyWithImpl(this._self, this._then);

  final UpdateCalendarParams _self;
  final $Res Function(UpdateCalendarParams) _then;

/// Create a copy of UpdateCalendarParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? calendarLink = null,Object? name = freezed,Object? description = freezed,Object? color = freezed,}) {
  return _then(_self.copyWith(
calendarLink: null == calendarLink ? _self.calendarLink : calendarLink // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _UpdateCalendarParams implements UpdateCalendarParams {
  const _UpdateCalendarParams({required this.calendarLink, this.name, this.description, this.color});
  

@override final  String calendarLink;
@override final  String? name;
@override final  String? description;
@override final  String? color;

/// Create a copy of UpdateCalendarParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCalendarParamsCopyWith<_UpdateCalendarParams> get copyWith => __$UpdateCalendarParamsCopyWithImpl<_UpdateCalendarParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateCalendarParams&&(identical(other.calendarLink, calendarLink) || other.calendarLink == calendarLink)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,calendarLink,name,description,color);

@override
String toString() {
  return 'UpdateCalendarParams(calendarLink: $calendarLink, name: $name, description: $description, color: $color)';
}


}

/// @nodoc
abstract mixin class _$UpdateCalendarParamsCopyWith<$Res> implements $UpdateCalendarParamsCopyWith<$Res> {
  factory _$UpdateCalendarParamsCopyWith(_UpdateCalendarParams value, $Res Function(_UpdateCalendarParams) _then) = __$UpdateCalendarParamsCopyWithImpl;
@override @useResult
$Res call({
 String calendarLink, String? name, String? description, String? color
});




}
/// @nodoc
class __$UpdateCalendarParamsCopyWithImpl<$Res>
    implements _$UpdateCalendarParamsCopyWith<$Res> {
  __$UpdateCalendarParamsCopyWithImpl(this._self, this._then);

  final _UpdateCalendarParams _self;
  final $Res Function(_UpdateCalendarParams) _then;

/// Create a copy of UpdateCalendarParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? calendarLink = null,Object? name = freezed,Object? description = freezed,Object? color = freezed,}) {
  return _then(_UpdateCalendarParams(
calendarLink: null == calendarLink ? _self.calendarLink : calendarLink // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
