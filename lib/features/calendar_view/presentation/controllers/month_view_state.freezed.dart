// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'month_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MonthViewState {

 DateTime get focusedMonth; DateTime get selectedDay; Map<DateTime, List<CalendarEventEntity>> get eventsByDay;
/// Create a copy of MonthViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthViewStateCopyWith<MonthViewState> get copyWith => _$MonthViewStateCopyWithImpl<MonthViewState>(this as MonthViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthViewState&&(identical(other.focusedMonth, focusedMonth) || other.focusedMonth == focusedMonth)&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&const DeepCollectionEquality().equals(other.eventsByDay, eventsByDay));
}


@override
int get hashCode => Object.hash(runtimeType,focusedMonth,selectedDay,const DeepCollectionEquality().hash(eventsByDay));

@override
String toString() {
  return 'MonthViewState(focusedMonth: $focusedMonth, selectedDay: $selectedDay, eventsByDay: $eventsByDay)';
}


}

/// @nodoc
abstract mixin class $MonthViewStateCopyWith<$Res>  {
  factory $MonthViewStateCopyWith(MonthViewState value, $Res Function(MonthViewState) _then) = _$MonthViewStateCopyWithImpl;
@useResult
$Res call({
 DateTime focusedMonth, DateTime selectedDay, Map<DateTime, List<CalendarEventEntity>> eventsByDay
});




}
/// @nodoc
class _$MonthViewStateCopyWithImpl<$Res>
    implements $MonthViewStateCopyWith<$Res> {
  _$MonthViewStateCopyWithImpl(this._self, this._then);

  final MonthViewState _self;
  final $Res Function(MonthViewState) _then;

/// Create a copy of MonthViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? focusedMonth = null,Object? selectedDay = null,Object? eventsByDay = null,}) {
  return _then(_self.copyWith(
focusedMonth: null == focusedMonth ? _self.focusedMonth : focusedMonth // ignore: cast_nullable_to_non_nullable
as DateTime,selectedDay: null == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime,eventsByDay: null == eventsByDay ? _self.eventsByDay : eventsByDay // ignore: cast_nullable_to_non_nullable
as Map<DateTime, List<CalendarEventEntity>>,
  ));
}

}


/// @nodoc


class _MonthViewState implements MonthViewState {
  const _MonthViewState({required this.focusedMonth, required this.selectedDay, required final  Map<DateTime, List<CalendarEventEntity>> eventsByDay}): _eventsByDay = eventsByDay;
  

@override final  DateTime focusedMonth;
@override final  DateTime selectedDay;
 final  Map<DateTime, List<CalendarEventEntity>> _eventsByDay;
@override Map<DateTime, List<CalendarEventEntity>> get eventsByDay {
  if (_eventsByDay is EqualUnmodifiableMapView) return _eventsByDay;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_eventsByDay);
}


/// Create a copy of MonthViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonthViewStateCopyWith<_MonthViewState> get copyWith => __$MonthViewStateCopyWithImpl<_MonthViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonthViewState&&(identical(other.focusedMonth, focusedMonth) || other.focusedMonth == focusedMonth)&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&const DeepCollectionEquality().equals(other._eventsByDay, _eventsByDay));
}


@override
int get hashCode => Object.hash(runtimeType,focusedMonth,selectedDay,const DeepCollectionEquality().hash(_eventsByDay));

@override
String toString() {
  return 'MonthViewState(focusedMonth: $focusedMonth, selectedDay: $selectedDay, eventsByDay: $eventsByDay)';
}


}

/// @nodoc
abstract mixin class _$MonthViewStateCopyWith<$Res> implements $MonthViewStateCopyWith<$Res> {
  factory _$MonthViewStateCopyWith(_MonthViewState value, $Res Function(_MonthViewState) _then) = __$MonthViewStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime focusedMonth, DateTime selectedDay, Map<DateTime, List<CalendarEventEntity>> eventsByDay
});




}
/// @nodoc
class __$MonthViewStateCopyWithImpl<$Res>
    implements _$MonthViewStateCopyWith<$Res> {
  __$MonthViewStateCopyWithImpl(this._self, this._then);

  final _MonthViewState _self;
  final $Res Function(_MonthViewState) _then;

/// Create a copy of MonthViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? focusedMonth = null,Object? selectedDay = null,Object? eventsByDay = null,}) {
  return _then(_MonthViewState(
focusedMonth: null == focusedMonth ? _self.focusedMonth : focusedMonth // ignore: cast_nullable_to_non_nullable
as DateTime,selectedDay: null == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime,eventsByDay: null == eventsByDay ? _self._eventsByDay : eventsByDay // ignore: cast_nullable_to_non_nullable
as Map<DateTime, List<CalendarEventEntity>>,
  ));
}


}

// dart format on
