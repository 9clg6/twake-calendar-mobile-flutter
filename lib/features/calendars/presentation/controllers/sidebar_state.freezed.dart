// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sidebar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SidebarState {

 List<CalendarEntity> get myCalendars; List<CalendarEntity> get sharedCalendars; List<CalendarEntity> get delegatedCalendars; Set<String> get selectedCalendarIds;
/// Create a copy of SidebarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SidebarStateCopyWith<SidebarState> get copyWith => _$SidebarStateCopyWithImpl<SidebarState>(this as SidebarState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SidebarState&&const DeepCollectionEquality().equals(other.myCalendars, myCalendars)&&const DeepCollectionEquality().equals(other.sharedCalendars, sharedCalendars)&&const DeepCollectionEquality().equals(other.delegatedCalendars, delegatedCalendars)&&const DeepCollectionEquality().equals(other.selectedCalendarIds, selectedCalendarIds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(myCalendars),const DeepCollectionEquality().hash(sharedCalendars),const DeepCollectionEquality().hash(delegatedCalendars),const DeepCollectionEquality().hash(selectedCalendarIds));

@override
String toString() {
  return 'SidebarState(myCalendars: $myCalendars, sharedCalendars: $sharedCalendars, delegatedCalendars: $delegatedCalendars, selectedCalendarIds: $selectedCalendarIds)';
}


}

/// @nodoc
abstract mixin class $SidebarStateCopyWith<$Res>  {
  factory $SidebarStateCopyWith(SidebarState value, $Res Function(SidebarState) _then) = _$SidebarStateCopyWithImpl;
@useResult
$Res call({
 List<CalendarEntity> myCalendars, List<CalendarEntity> sharedCalendars, List<CalendarEntity> delegatedCalendars, Set<String> selectedCalendarIds
});




}
/// @nodoc
class _$SidebarStateCopyWithImpl<$Res>
    implements $SidebarStateCopyWith<$Res> {
  _$SidebarStateCopyWithImpl(this._self, this._then);

  final SidebarState _self;
  final $Res Function(SidebarState) _then;

/// Create a copy of SidebarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? myCalendars = null,Object? sharedCalendars = null,Object? delegatedCalendars = null,Object? selectedCalendarIds = null,}) {
  return _then(_self.copyWith(
myCalendars: null == myCalendars ? _self.myCalendars : myCalendars // ignore: cast_nullable_to_non_nullable
as List<CalendarEntity>,sharedCalendars: null == sharedCalendars ? _self.sharedCalendars : sharedCalendars // ignore: cast_nullable_to_non_nullable
as List<CalendarEntity>,delegatedCalendars: null == delegatedCalendars ? _self.delegatedCalendars : delegatedCalendars // ignore: cast_nullable_to_non_nullable
as List<CalendarEntity>,selectedCalendarIds: null == selectedCalendarIds ? _self.selectedCalendarIds : selectedCalendarIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}

}


/// @nodoc


class _SidebarState implements SidebarState {
  const _SidebarState({required final  List<CalendarEntity> myCalendars, required final  List<CalendarEntity> sharedCalendars, required final  List<CalendarEntity> delegatedCalendars, required final  Set<String> selectedCalendarIds}): _myCalendars = myCalendars,_sharedCalendars = sharedCalendars,_delegatedCalendars = delegatedCalendars,_selectedCalendarIds = selectedCalendarIds;
  

 final  List<CalendarEntity> _myCalendars;
@override List<CalendarEntity> get myCalendars {
  if (_myCalendars is EqualUnmodifiableListView) return _myCalendars;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_myCalendars);
}

 final  List<CalendarEntity> _sharedCalendars;
@override List<CalendarEntity> get sharedCalendars {
  if (_sharedCalendars is EqualUnmodifiableListView) return _sharedCalendars;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sharedCalendars);
}

 final  List<CalendarEntity> _delegatedCalendars;
@override List<CalendarEntity> get delegatedCalendars {
  if (_delegatedCalendars is EqualUnmodifiableListView) return _delegatedCalendars;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_delegatedCalendars);
}

 final  Set<String> _selectedCalendarIds;
@override Set<String> get selectedCalendarIds {
  if (_selectedCalendarIds is EqualUnmodifiableSetView) return _selectedCalendarIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedCalendarIds);
}


/// Create a copy of SidebarState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SidebarStateCopyWith<_SidebarState> get copyWith => __$SidebarStateCopyWithImpl<_SidebarState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SidebarState&&const DeepCollectionEquality().equals(other._myCalendars, _myCalendars)&&const DeepCollectionEquality().equals(other._sharedCalendars, _sharedCalendars)&&const DeepCollectionEquality().equals(other._delegatedCalendars, _delegatedCalendars)&&const DeepCollectionEquality().equals(other._selectedCalendarIds, _selectedCalendarIds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_myCalendars),const DeepCollectionEquality().hash(_sharedCalendars),const DeepCollectionEquality().hash(_delegatedCalendars),const DeepCollectionEquality().hash(_selectedCalendarIds));

@override
String toString() {
  return 'SidebarState(myCalendars: $myCalendars, sharedCalendars: $sharedCalendars, delegatedCalendars: $delegatedCalendars, selectedCalendarIds: $selectedCalendarIds)';
}


}

/// @nodoc
abstract mixin class _$SidebarStateCopyWith<$Res> implements $SidebarStateCopyWith<$Res> {
  factory _$SidebarStateCopyWith(_SidebarState value, $Res Function(_SidebarState) _then) = __$SidebarStateCopyWithImpl;
@override @useResult
$Res call({
 List<CalendarEntity> myCalendars, List<CalendarEntity> sharedCalendars, List<CalendarEntity> delegatedCalendars, Set<String> selectedCalendarIds
});




}
/// @nodoc
class __$SidebarStateCopyWithImpl<$Res>
    implements _$SidebarStateCopyWith<$Res> {
  __$SidebarStateCopyWithImpl(this._self, this._then);

  final _SidebarState _self;
  final $Res Function(_SidebarState) _then;

/// Create a copy of SidebarState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? myCalendars = null,Object? sharedCalendars = null,Object? delegatedCalendars = null,Object? selectedCalendarIds = null,}) {
  return _then(_SidebarState(
myCalendars: null == myCalendars ? _self._myCalendars : myCalendars // ignore: cast_nullable_to_non_nullable
as List<CalendarEntity>,sharedCalendars: null == sharedCalendars ? _self._sharedCalendars : sharedCalendars // ignore: cast_nullable_to_non_nullable
as List<CalendarEntity>,delegatedCalendars: null == delegatedCalendars ? _self._delegatedCalendars : delegatedCalendars // ignore: cast_nullable_to_non_nullable
as List<CalendarEntity>,selectedCalendarIds: null == selectedCalendarIds ? _self._selectedCalendarIds : selectedCalendarIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}


}

// dart format on
