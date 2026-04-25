// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_response.remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchHitRemoteModel {

 String get uid; String? get summary; String? get start; String? get end; String? get organizer; String? get location;
/// Create a copy of SearchHitRemoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchHitRemoteModelCopyWith<SearchHitRemoteModel> get copyWith => _$SearchHitRemoteModelCopyWithImpl<SearchHitRemoteModel>(this as SearchHitRemoteModel, _$identity);

  /// Serializes this SearchHitRemoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchHitRemoteModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.organizer, organizer) || other.organizer == organizer)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,summary,start,end,organizer,location);

@override
String toString() {
  return 'SearchHitRemoteModel(uid: $uid, summary: $summary, start: $start, end: $end, organizer: $organizer, location: $location)';
}


}

/// @nodoc
abstract mixin class $SearchHitRemoteModelCopyWith<$Res>  {
  factory $SearchHitRemoteModelCopyWith(SearchHitRemoteModel value, $Res Function(SearchHitRemoteModel) _then) = _$SearchHitRemoteModelCopyWithImpl;
@useResult
$Res call({
 String uid, String? summary, String? start, String? end, String? organizer, String? location
});




}
/// @nodoc
class _$SearchHitRemoteModelCopyWithImpl<$Res>
    implements $SearchHitRemoteModelCopyWith<$Res> {
  _$SearchHitRemoteModelCopyWithImpl(this._self, this._then);

  final SearchHitRemoteModel _self;
  final $Res Function(SearchHitRemoteModel) _then;

/// Create a copy of SearchHitRemoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? summary = freezed,Object? start = freezed,Object? end = freezed,Object? organizer = freezed,Object? location = freezed,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String?,organizer: freezed == organizer ? _self.organizer : organizer // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SearchHitRemoteModel implements SearchHitRemoteModel {
  const _SearchHitRemoteModel({required this.uid, this.summary, this.start, this.end, this.organizer, this.location});
  factory _SearchHitRemoteModel.fromJson(Map<String, dynamic> json) => _$SearchHitRemoteModelFromJson(json);

@override final  String uid;
@override final  String? summary;
@override final  String? start;
@override final  String? end;
@override final  String? organizer;
@override final  String? location;

/// Create a copy of SearchHitRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchHitRemoteModelCopyWith<_SearchHitRemoteModel> get copyWith => __$SearchHitRemoteModelCopyWithImpl<_SearchHitRemoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchHitRemoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchHitRemoteModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.organizer, organizer) || other.organizer == organizer)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,summary,start,end,organizer,location);

@override
String toString() {
  return 'SearchHitRemoteModel(uid: $uid, summary: $summary, start: $start, end: $end, organizer: $organizer, location: $location)';
}


}

/// @nodoc
abstract mixin class _$SearchHitRemoteModelCopyWith<$Res> implements $SearchHitRemoteModelCopyWith<$Res> {
  factory _$SearchHitRemoteModelCopyWith(_SearchHitRemoteModel value, $Res Function(_SearchHitRemoteModel) _then) = __$SearchHitRemoteModelCopyWithImpl;
@override @useResult
$Res call({
 String uid, String? summary, String? start, String? end, String? organizer, String? location
});




}
/// @nodoc
class __$SearchHitRemoteModelCopyWithImpl<$Res>
    implements _$SearchHitRemoteModelCopyWith<$Res> {
  __$SearchHitRemoteModelCopyWithImpl(this._self, this._then);

  final _SearchHitRemoteModel _self;
  final $Res Function(_SearchHitRemoteModel) _then;

/// Create a copy of SearchHitRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? summary = freezed,Object? start = freezed,Object? end = freezed,Object? organizer = freezed,Object? location = freezed,}) {
  return _then(_SearchHitRemoteModel(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String?,organizer: freezed == organizer ? _self.organizer : organizer // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$EventSearchResponseRemoteModel {

 int get total; List<SearchHitRemoteModel> get results;
/// Create a copy of EventSearchResponseRemoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventSearchResponseRemoteModelCopyWith<EventSearchResponseRemoteModel> get copyWith => _$EventSearchResponseRemoteModelCopyWithImpl<EventSearchResponseRemoteModel>(this as EventSearchResponseRemoteModel, _$identity);

  /// Serializes this EventSearchResponseRemoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventSearchResponseRemoteModel&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'EventSearchResponseRemoteModel(total: $total, results: $results)';
}


}

/// @nodoc
abstract mixin class $EventSearchResponseRemoteModelCopyWith<$Res>  {
  factory $EventSearchResponseRemoteModelCopyWith(EventSearchResponseRemoteModel value, $Res Function(EventSearchResponseRemoteModel) _then) = _$EventSearchResponseRemoteModelCopyWithImpl;
@useResult
$Res call({
 int total, List<SearchHitRemoteModel> results
});




}
/// @nodoc
class _$EventSearchResponseRemoteModelCopyWithImpl<$Res>
    implements $EventSearchResponseRemoteModelCopyWith<$Res> {
  _$EventSearchResponseRemoteModelCopyWithImpl(this._self, this._then);

  final EventSearchResponseRemoteModel _self;
  final $Res Function(EventSearchResponseRemoteModel) _then;

/// Create a copy of EventSearchResponseRemoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? results = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<SearchHitRemoteModel>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _EventSearchResponseRemoteModel implements EventSearchResponseRemoteModel {
  const _EventSearchResponseRemoteModel({this.total = 0, final  List<SearchHitRemoteModel> results = const <SearchHitRemoteModel>[]}): _results = results;
  factory _EventSearchResponseRemoteModel.fromJson(Map<String, dynamic> json) => _$EventSearchResponseRemoteModelFromJson(json);

@override@JsonKey() final  int total;
 final  List<SearchHitRemoteModel> _results;
@override@JsonKey() List<SearchHitRemoteModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of EventSearchResponseRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventSearchResponseRemoteModelCopyWith<_EventSearchResponseRemoteModel> get copyWith => __$EventSearchResponseRemoteModelCopyWithImpl<_EventSearchResponseRemoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventSearchResponseRemoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventSearchResponseRemoteModel&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'EventSearchResponseRemoteModel(total: $total, results: $results)';
}


}

/// @nodoc
abstract mixin class _$EventSearchResponseRemoteModelCopyWith<$Res> implements $EventSearchResponseRemoteModelCopyWith<$Res> {
  factory _$EventSearchResponseRemoteModelCopyWith(_EventSearchResponseRemoteModel value, $Res Function(_EventSearchResponseRemoteModel) _then) = __$EventSearchResponseRemoteModelCopyWithImpl;
@override @useResult
$Res call({
 int total, List<SearchHitRemoteModel> results
});




}
/// @nodoc
class __$EventSearchResponseRemoteModelCopyWithImpl<$Res>
    implements _$EventSearchResponseRemoteModelCopyWith<$Res> {
  __$EventSearchResponseRemoteModelCopyWithImpl(this._self, this._then);

  final _EventSearchResponseRemoteModel _self;
  final $Res Function(_EventSearchResponseRemoteModel) _then;

/// Create a copy of EventSearchResponseRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? results = null,}) {
  return _then(_EventSearchResponseRemoteModel(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<SearchHitRemoteModel>,
  ));
}


}

// dart format on
