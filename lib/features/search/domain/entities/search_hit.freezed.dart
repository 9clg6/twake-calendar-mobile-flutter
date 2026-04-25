// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_hit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchHitEntity {

 String get uid; String? get summary; String? get start; String? get end; String? get organizer; String? get location;
/// Create a copy of SearchHitEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchHitEntityCopyWith<SearchHitEntity> get copyWith => _$SearchHitEntityCopyWithImpl<SearchHitEntity>(this as SearchHitEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchHitEntity&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.organizer, organizer) || other.organizer == organizer)&&(identical(other.location, location) || other.location == location));
}


@override
int get hashCode => Object.hash(runtimeType,uid,summary,start,end,organizer,location);

@override
String toString() {
  return 'SearchHitEntity(uid: $uid, summary: $summary, start: $start, end: $end, organizer: $organizer, location: $location)';
}


}

/// @nodoc
abstract mixin class $SearchHitEntityCopyWith<$Res>  {
  factory $SearchHitEntityCopyWith(SearchHitEntity value, $Res Function(SearchHitEntity) _then) = _$SearchHitEntityCopyWithImpl;
@useResult
$Res call({
 String uid, String? summary, String? start, String? end, String? organizer, String? location
});




}
/// @nodoc
class _$SearchHitEntityCopyWithImpl<$Res>
    implements $SearchHitEntityCopyWith<$Res> {
  _$SearchHitEntityCopyWithImpl(this._self, this._then);

  final SearchHitEntity _self;
  final $Res Function(SearchHitEntity) _then;

/// Create a copy of SearchHitEntity
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


class _SearchHitEntity implements SearchHitEntity {
  const _SearchHitEntity({required this.uid, this.summary, this.start, this.end, this.organizer, this.location});
  

@override final  String uid;
@override final  String? summary;
@override final  String? start;
@override final  String? end;
@override final  String? organizer;
@override final  String? location;

/// Create a copy of SearchHitEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchHitEntityCopyWith<_SearchHitEntity> get copyWith => __$SearchHitEntityCopyWithImpl<_SearchHitEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchHitEntity&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.organizer, organizer) || other.organizer == organizer)&&(identical(other.location, location) || other.location == location));
}


@override
int get hashCode => Object.hash(runtimeType,uid,summary,start,end,organizer,location);

@override
String toString() {
  return 'SearchHitEntity(uid: $uid, summary: $summary, start: $start, end: $end, organizer: $organizer, location: $location)';
}


}

/// @nodoc
abstract mixin class _$SearchHitEntityCopyWith<$Res> implements $SearchHitEntityCopyWith<$Res> {
  factory _$SearchHitEntityCopyWith(_SearchHitEntity value, $Res Function(_SearchHitEntity) _then) = __$SearchHitEntityCopyWithImpl;
@override @useResult
$Res call({
 String uid, String? summary, String? start, String? end, String? organizer, String? location
});




}
/// @nodoc
class __$SearchHitEntityCopyWithImpl<$Res>
    implements _$SearchHitEntityCopyWith<$Res> {
  __$SearchHitEntityCopyWithImpl(this._self, this._then);

  final _SearchHitEntity _self;
  final $Res Function(_SearchHitEntity) _then;

/// Create a copy of SearchHitEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? summary = freezed,Object? start = freezed,Object? end = freezed,Object? organizer = freezed,Object? location = freezed,}) {
  return _then(_SearchHitEntity(
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

// dart format on
