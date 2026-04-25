// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_request.remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchCalendarRefRemoteModel {

 String get calendarId; String get userId;
/// Create a copy of SearchCalendarRefRemoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchCalendarRefRemoteModelCopyWith<SearchCalendarRefRemoteModel> get copyWith => _$SearchCalendarRefRemoteModelCopyWithImpl<SearchCalendarRefRemoteModel>(this as SearchCalendarRefRemoteModel, _$identity);

  /// Serializes this SearchCalendarRefRemoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchCalendarRefRemoteModel&&(identical(other.calendarId, calendarId) || other.calendarId == calendarId)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,calendarId,userId);

@override
String toString() {
  return 'SearchCalendarRefRemoteModel(calendarId: $calendarId, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $SearchCalendarRefRemoteModelCopyWith<$Res>  {
  factory $SearchCalendarRefRemoteModelCopyWith(SearchCalendarRefRemoteModel value, $Res Function(SearchCalendarRefRemoteModel) _then) = _$SearchCalendarRefRemoteModelCopyWithImpl;
@useResult
$Res call({
 String calendarId, String userId
});




}
/// @nodoc
class _$SearchCalendarRefRemoteModelCopyWithImpl<$Res>
    implements $SearchCalendarRefRemoteModelCopyWith<$Res> {
  _$SearchCalendarRefRemoteModelCopyWithImpl(this._self, this._then);

  final SearchCalendarRefRemoteModel _self;
  final $Res Function(SearchCalendarRefRemoteModel) _then;

/// Create a copy of SearchCalendarRefRemoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? calendarId = null,Object? userId = null,}) {
  return _then(_self.copyWith(
calendarId: null == calendarId ? _self.calendarId : calendarId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SearchCalendarRefRemoteModel implements SearchCalendarRefRemoteModel {
  const _SearchCalendarRefRemoteModel({required this.calendarId, required this.userId});
  factory _SearchCalendarRefRemoteModel.fromJson(Map<String, dynamic> json) => _$SearchCalendarRefRemoteModelFromJson(json);

@override final  String calendarId;
@override final  String userId;

/// Create a copy of SearchCalendarRefRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchCalendarRefRemoteModelCopyWith<_SearchCalendarRefRemoteModel> get copyWith => __$SearchCalendarRefRemoteModelCopyWithImpl<_SearchCalendarRefRemoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchCalendarRefRemoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchCalendarRefRemoteModel&&(identical(other.calendarId, calendarId) || other.calendarId == calendarId)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,calendarId,userId);

@override
String toString() {
  return 'SearchCalendarRefRemoteModel(calendarId: $calendarId, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$SearchCalendarRefRemoteModelCopyWith<$Res> implements $SearchCalendarRefRemoteModelCopyWith<$Res> {
  factory _$SearchCalendarRefRemoteModelCopyWith(_SearchCalendarRefRemoteModel value, $Res Function(_SearchCalendarRefRemoteModel) _then) = __$SearchCalendarRefRemoteModelCopyWithImpl;
@override @useResult
$Res call({
 String calendarId, String userId
});




}
/// @nodoc
class __$SearchCalendarRefRemoteModelCopyWithImpl<$Res>
    implements _$SearchCalendarRefRemoteModelCopyWith<$Res> {
  __$SearchCalendarRefRemoteModelCopyWithImpl(this._self, this._then);

  final _SearchCalendarRefRemoteModel _self;
  final $Res Function(_SearchCalendarRefRemoteModel) _then;

/// Create a copy of SearchCalendarRefRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? calendarId = null,Object? userId = null,}) {
  return _then(_SearchCalendarRefRemoteModel(
calendarId: null == calendarId ? _self.calendarId : calendarId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$EventSearchRequestRemoteModel {

 String get query; List<SearchCalendarRefRemoteModel> get calendars; List<String> get organizers; List<String> get attendees;
/// Create a copy of EventSearchRequestRemoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventSearchRequestRemoteModelCopyWith<EventSearchRequestRemoteModel> get copyWith => _$EventSearchRequestRemoteModelCopyWithImpl<EventSearchRequestRemoteModel>(this as EventSearchRequestRemoteModel, _$identity);

  /// Serializes this EventSearchRequestRemoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventSearchRequestRemoteModel&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other.calendars, calendars)&&const DeepCollectionEquality().equals(other.organizers, organizers)&&const DeepCollectionEquality().equals(other.attendees, attendees));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,const DeepCollectionEquality().hash(calendars),const DeepCollectionEquality().hash(organizers),const DeepCollectionEquality().hash(attendees));

@override
String toString() {
  return 'EventSearchRequestRemoteModel(query: $query, calendars: $calendars, organizers: $organizers, attendees: $attendees)';
}


}

/// @nodoc
abstract mixin class $EventSearchRequestRemoteModelCopyWith<$Res>  {
  factory $EventSearchRequestRemoteModelCopyWith(EventSearchRequestRemoteModel value, $Res Function(EventSearchRequestRemoteModel) _then) = _$EventSearchRequestRemoteModelCopyWithImpl;
@useResult
$Res call({
 String query, List<SearchCalendarRefRemoteModel> calendars, List<String> organizers, List<String> attendees
});




}
/// @nodoc
class _$EventSearchRequestRemoteModelCopyWithImpl<$Res>
    implements $EventSearchRequestRemoteModelCopyWith<$Res> {
  _$EventSearchRequestRemoteModelCopyWithImpl(this._self, this._then);

  final EventSearchRequestRemoteModel _self;
  final $Res Function(EventSearchRequestRemoteModel) _then;

/// Create a copy of EventSearchRequestRemoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? calendars = null,Object? organizers = null,Object? attendees = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,calendars: null == calendars ? _self.calendars : calendars // ignore: cast_nullable_to_non_nullable
as List<SearchCalendarRefRemoteModel>,organizers: null == organizers ? _self.organizers : organizers // ignore: cast_nullable_to_non_nullable
as List<String>,attendees: null == attendees ? _self.attendees : attendees // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _EventSearchRequestRemoteModel implements EventSearchRequestRemoteModel {
  const _EventSearchRequestRemoteModel({required this.query, final  List<SearchCalendarRefRemoteModel> calendars = const <SearchCalendarRefRemoteModel>[], final  List<String> organizers = const <String>[], final  List<String> attendees = const <String>[]}): _calendars = calendars,_organizers = organizers,_attendees = attendees;
  factory _EventSearchRequestRemoteModel.fromJson(Map<String, dynamic> json) => _$EventSearchRequestRemoteModelFromJson(json);

@override final  String query;
 final  List<SearchCalendarRefRemoteModel> _calendars;
@override@JsonKey() List<SearchCalendarRefRemoteModel> get calendars {
  if (_calendars is EqualUnmodifiableListView) return _calendars;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_calendars);
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


/// Create a copy of EventSearchRequestRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventSearchRequestRemoteModelCopyWith<_EventSearchRequestRemoteModel> get copyWith => __$EventSearchRequestRemoteModelCopyWithImpl<_EventSearchRequestRemoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventSearchRequestRemoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventSearchRequestRemoteModel&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other._calendars, _calendars)&&const DeepCollectionEquality().equals(other._organizers, _organizers)&&const DeepCollectionEquality().equals(other._attendees, _attendees));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,const DeepCollectionEquality().hash(_calendars),const DeepCollectionEquality().hash(_organizers),const DeepCollectionEquality().hash(_attendees));

@override
String toString() {
  return 'EventSearchRequestRemoteModel(query: $query, calendars: $calendars, organizers: $organizers, attendees: $attendees)';
}


}

/// @nodoc
abstract mixin class _$EventSearchRequestRemoteModelCopyWith<$Res> implements $EventSearchRequestRemoteModelCopyWith<$Res> {
  factory _$EventSearchRequestRemoteModelCopyWith(_EventSearchRequestRemoteModel value, $Res Function(_EventSearchRequestRemoteModel) _then) = __$EventSearchRequestRemoteModelCopyWithImpl;
@override @useResult
$Res call({
 String query, List<SearchCalendarRefRemoteModel> calendars, List<String> organizers, List<String> attendees
});




}
/// @nodoc
class __$EventSearchRequestRemoteModelCopyWithImpl<$Res>
    implements _$EventSearchRequestRemoteModelCopyWith<$Res> {
  __$EventSearchRequestRemoteModelCopyWithImpl(this._self, this._then);

  final _EventSearchRequestRemoteModel _self;
  final $Res Function(_EventSearchRequestRemoteModel) _then;

/// Create a copy of EventSearchRequestRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? calendars = null,Object? organizers = null,Object? attendees = null,}) {
  return _then(_EventSearchRequestRemoteModel(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,calendars: null == calendars ? _self._calendars : calendars // ignore: cast_nullable_to_non_nullable
as List<SearchCalendarRefRemoteModel>,organizers: null == organizers ? _self._organizers : organizers // ignore: cast_nullable_to_non_nullable
as List<String>,attendees: null == attendees ? _self._attendees : attendees // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
