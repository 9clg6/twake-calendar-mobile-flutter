// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_events_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchEventsParams {

 String get query; List<String> get calendarIds; List<String> get organizers; List<String> get attendees;
/// Create a copy of SearchEventsParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchEventsParamsCopyWith<SearchEventsParams> get copyWith => _$SearchEventsParamsCopyWithImpl<SearchEventsParams>(this as SearchEventsParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEventsParams&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other.calendarIds, calendarIds)&&const DeepCollectionEquality().equals(other.organizers, organizers)&&const DeepCollectionEquality().equals(other.attendees, attendees));
}


@override
int get hashCode => Object.hash(runtimeType,query,const DeepCollectionEquality().hash(calendarIds),const DeepCollectionEquality().hash(organizers),const DeepCollectionEquality().hash(attendees));

@override
String toString() {
  return 'SearchEventsParams(query: $query, calendarIds: $calendarIds, organizers: $organizers, attendees: $attendees)';
}


}

/// @nodoc
abstract mixin class $SearchEventsParamsCopyWith<$Res>  {
  factory $SearchEventsParamsCopyWith(SearchEventsParams value, $Res Function(SearchEventsParams) _then) = _$SearchEventsParamsCopyWithImpl;
@useResult
$Res call({
 String query, List<String> calendarIds, List<String> organizers, List<String> attendees
});




}
/// @nodoc
class _$SearchEventsParamsCopyWithImpl<$Res>
    implements $SearchEventsParamsCopyWith<$Res> {
  _$SearchEventsParamsCopyWithImpl(this._self, this._then);

  final SearchEventsParams _self;
  final $Res Function(SearchEventsParams) _then;

/// Create a copy of SearchEventsParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? calendarIds = null,Object? organizers = null,Object? attendees = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,calendarIds: null == calendarIds ? _self.calendarIds : calendarIds // ignore: cast_nullable_to_non_nullable
as List<String>,organizers: null == organizers ? _self.organizers : organizers // ignore: cast_nullable_to_non_nullable
as List<String>,attendees: null == attendees ? _self.attendees : attendees // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc


class _SearchEventsParams implements SearchEventsParams {
  const _SearchEventsParams({required this.query, final  List<String> calendarIds = const <String>[], final  List<String> organizers = const <String>[], final  List<String> attendees = const <String>[]}): _calendarIds = calendarIds,_organizers = organizers,_attendees = attendees;
  

@override final  String query;
 final  List<String> _calendarIds;
@override@JsonKey() List<String> get calendarIds {
  if (_calendarIds is EqualUnmodifiableListView) return _calendarIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_calendarIds);
}

 final  List<String> _organizers;
@override@JsonKey() List<String> get organizers {
  if (_organizers is EqualUnmodifiableListView) return _organizers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_organizers);
}

 final  List<String> _attendees;
@override@JsonKey() List<String> get attendees {
  if (_attendees is EqualUnmodifiableListView) return _attendees;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attendees);
}


/// Create a copy of SearchEventsParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchEventsParamsCopyWith<_SearchEventsParams> get copyWith => __$SearchEventsParamsCopyWithImpl<_SearchEventsParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchEventsParams&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other._calendarIds, _calendarIds)&&const DeepCollectionEquality().equals(other._organizers, _organizers)&&const DeepCollectionEquality().equals(other._attendees, _attendees));
}


@override
int get hashCode => Object.hash(runtimeType,query,const DeepCollectionEquality().hash(_calendarIds),const DeepCollectionEquality().hash(_organizers),const DeepCollectionEquality().hash(_attendees));

@override
String toString() {
  return 'SearchEventsParams(query: $query, calendarIds: $calendarIds, organizers: $organizers, attendees: $attendees)';
}


}

/// @nodoc
abstract mixin class _$SearchEventsParamsCopyWith<$Res> implements $SearchEventsParamsCopyWith<$Res> {
  factory _$SearchEventsParamsCopyWith(_SearchEventsParams value, $Res Function(_SearchEventsParams) _then) = __$SearchEventsParamsCopyWithImpl;
@override @useResult
$Res call({
 String query, List<String> calendarIds, List<String> organizers, List<String> attendees
});




}
/// @nodoc
class __$SearchEventsParamsCopyWithImpl<$Res>
    implements _$SearchEventsParamsCopyWith<$Res> {
  __$SearchEventsParamsCopyWithImpl(this._self, this._then);

  final _SearchEventsParams _self;
  final $Res Function(_SearchEventsParams) _then;

/// Create a copy of SearchEventsParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? calendarIds = null,Object? organizers = null,Object? attendees = null,}) {
  return _then(_SearchEventsParams(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,calendarIds: null == calendarIds ? _self._calendarIds : calendarIds // ignore: cast_nullable_to_non_nullable
as List<String>,organizers: null == organizers ? _self._organizers : organizers // ignore: cast_nullable_to_non_nullable
as List<String>,attendees: null == attendees ? _self._attendees : attendees // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
