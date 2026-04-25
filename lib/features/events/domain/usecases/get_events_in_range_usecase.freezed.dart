// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_events_in_range_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetEventsInRangeParams {

 String get calendarId; DateTime get start; DateTime get end;
/// Create a copy of GetEventsInRangeParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetEventsInRangeParamsCopyWith<GetEventsInRangeParams> get copyWith => _$GetEventsInRangeParamsCopyWithImpl<GetEventsInRangeParams>(this as GetEventsInRangeParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetEventsInRangeParams&&(identical(other.calendarId, calendarId) || other.calendarId == calendarId)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}


@override
int get hashCode => Object.hash(runtimeType,calendarId,start,end);

@override
String toString() {
  return 'GetEventsInRangeParams(calendarId: $calendarId, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $GetEventsInRangeParamsCopyWith<$Res>  {
  factory $GetEventsInRangeParamsCopyWith(GetEventsInRangeParams value, $Res Function(GetEventsInRangeParams) _then) = _$GetEventsInRangeParamsCopyWithImpl;
@useResult
$Res call({
 String calendarId, DateTime start, DateTime end
});




}
/// @nodoc
class _$GetEventsInRangeParamsCopyWithImpl<$Res>
    implements $GetEventsInRangeParamsCopyWith<$Res> {
  _$GetEventsInRangeParamsCopyWithImpl(this._self, this._then);

  final GetEventsInRangeParams _self;
  final $Res Function(GetEventsInRangeParams) _then;

/// Create a copy of GetEventsInRangeParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? calendarId = null,Object? start = null,Object? end = null,}) {
  return _then(_self.copyWith(
calendarId: null == calendarId ? _self.calendarId : calendarId // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc


class _GetEventsInRangeParams implements GetEventsInRangeParams {
  const _GetEventsInRangeParams({required this.calendarId, required this.start, required this.end});
  

@override final  String calendarId;
@override final  DateTime start;
@override final  DateTime end;

/// Create a copy of GetEventsInRangeParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetEventsInRangeParamsCopyWith<_GetEventsInRangeParams> get copyWith => __$GetEventsInRangeParamsCopyWithImpl<_GetEventsInRangeParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetEventsInRangeParams&&(identical(other.calendarId, calendarId) || other.calendarId == calendarId)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}


@override
int get hashCode => Object.hash(runtimeType,calendarId,start,end);

@override
String toString() {
  return 'GetEventsInRangeParams(calendarId: $calendarId, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$GetEventsInRangeParamsCopyWith<$Res> implements $GetEventsInRangeParamsCopyWith<$Res> {
  factory _$GetEventsInRangeParamsCopyWith(_GetEventsInRangeParams value, $Res Function(_GetEventsInRangeParams) _then) = __$GetEventsInRangeParamsCopyWithImpl;
@override @useResult
$Res call({
 String calendarId, DateTime start, DateTime end
});




}
/// @nodoc
class __$GetEventsInRangeParamsCopyWithImpl<$Res>
    implements _$GetEventsInRangeParamsCopyWith<$Res> {
  __$GetEventsInRangeParamsCopyWithImpl(this._self, this._then);

  final _GetEventsInRangeParams _self;
  final $Res Function(_GetEventsInRangeParams) _then;

/// Create a copy of GetEventsInRangeParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? calendarId = null,Object? start = null,Object? end = null,}) {
  return _then(_GetEventsInRangeParams(
calendarId: null == calendarId ? _self.calendarId : calendarId // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
