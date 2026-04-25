// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EventFormState {

 String get calendarId; String get title; String get location; String get description; DateTime get start; DateTime get end; bool get allday; String get timezone; bool get isSubmitting; String? get error; bool get didSubmit;
/// Create a copy of EventFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventFormStateCopyWith<EventFormState> get copyWith => _$EventFormStateCopyWithImpl<EventFormState>(this as EventFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventFormState&&(identical(other.calendarId, calendarId) || other.calendarId == calendarId)&&(identical(other.title, title) || other.title == title)&&(identical(other.location, location) || other.location == location)&&(identical(other.description, description) || other.description == description)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.allday, allday) || other.allday == allday)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.error, error) || other.error == error)&&(identical(other.didSubmit, didSubmit) || other.didSubmit == didSubmit));
}


@override
int get hashCode => Object.hash(runtimeType,calendarId,title,location,description,start,end,allday,timezone,isSubmitting,error,didSubmit);

@override
String toString() {
  return 'EventFormState(calendarId: $calendarId, title: $title, location: $location, description: $description, start: $start, end: $end, allday: $allday, timezone: $timezone, isSubmitting: $isSubmitting, error: $error, didSubmit: $didSubmit)';
}


}

/// @nodoc
abstract mixin class $EventFormStateCopyWith<$Res>  {
  factory $EventFormStateCopyWith(EventFormState value, $Res Function(EventFormState) _then) = _$EventFormStateCopyWithImpl;
@useResult
$Res call({
 String calendarId, String title, String location, String description, DateTime start, DateTime end, bool allday, String timezone, bool isSubmitting, String? error, bool didSubmit
});




}
/// @nodoc
class _$EventFormStateCopyWithImpl<$Res>
    implements $EventFormStateCopyWith<$Res> {
  _$EventFormStateCopyWithImpl(this._self, this._then);

  final EventFormState _self;
  final $Res Function(EventFormState) _then;

/// Create a copy of EventFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? calendarId = null,Object? title = null,Object? location = null,Object? description = null,Object? start = null,Object? end = null,Object? allday = null,Object? timezone = null,Object? isSubmitting = null,Object? error = freezed,Object? didSubmit = null,}) {
  return _then(_self.copyWith(
calendarId: null == calendarId ? _self.calendarId : calendarId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,allday: null == allday ? _self.allday : allday // ignore: cast_nullable_to_non_nullable
as bool,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,didSubmit: null == didSubmit ? _self.didSubmit : didSubmit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _EventFormState implements EventFormState {
  const _EventFormState({required this.calendarId, this.title = '', this.location = '', this.description = '', required this.start, required this.end, this.allday = false, this.timezone = 'Europe/Paris', this.isSubmitting = false, this.error, this.didSubmit = false});
  

@override final  String calendarId;
@override@JsonKey() final  String title;
@override@JsonKey() final  String location;
@override@JsonKey() final  String description;
@override final  DateTime start;
@override final  DateTime end;
@override@JsonKey() final  bool allday;
@override@JsonKey() final  String timezone;
@override@JsonKey() final  bool isSubmitting;
@override final  String? error;
@override@JsonKey() final  bool didSubmit;

/// Create a copy of EventFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventFormStateCopyWith<_EventFormState> get copyWith => __$EventFormStateCopyWithImpl<_EventFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventFormState&&(identical(other.calendarId, calendarId) || other.calendarId == calendarId)&&(identical(other.title, title) || other.title == title)&&(identical(other.location, location) || other.location == location)&&(identical(other.description, description) || other.description == description)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.allday, allday) || other.allday == allday)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.error, error) || other.error == error)&&(identical(other.didSubmit, didSubmit) || other.didSubmit == didSubmit));
}


@override
int get hashCode => Object.hash(runtimeType,calendarId,title,location,description,start,end,allday,timezone,isSubmitting,error,didSubmit);

@override
String toString() {
  return 'EventFormState(calendarId: $calendarId, title: $title, location: $location, description: $description, start: $start, end: $end, allday: $allday, timezone: $timezone, isSubmitting: $isSubmitting, error: $error, didSubmit: $didSubmit)';
}


}

/// @nodoc
abstract mixin class _$EventFormStateCopyWith<$Res> implements $EventFormStateCopyWith<$Res> {
  factory _$EventFormStateCopyWith(_EventFormState value, $Res Function(_EventFormState) _then) = __$EventFormStateCopyWithImpl;
@override @useResult
$Res call({
 String calendarId, String title, String location, String description, DateTime start, DateTime end, bool allday, String timezone, bool isSubmitting, String? error, bool didSubmit
});




}
/// @nodoc
class __$EventFormStateCopyWithImpl<$Res>
    implements _$EventFormStateCopyWith<$Res> {
  __$EventFormStateCopyWithImpl(this._self, this._then);

  final _EventFormState _self;
  final $Res Function(_EventFormState) _then;

/// Create a copy of EventFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? calendarId = null,Object? title = null,Object? location = null,Object? description = null,Object? start = null,Object? end = null,Object? allday = null,Object? timezone = null,Object? isSubmitting = null,Object? error = freezed,Object? didSubmit = null,}) {
  return _then(_EventFormState(
calendarId: null == calendarId ? _self.calendarId : calendarId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,allday: null == allday ? _self.allday : allday // ignore: cast_nullable_to_non_nullable
as bool,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,didSubmit: null == didSubmit ? _self.didSubmit : didSubmit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
