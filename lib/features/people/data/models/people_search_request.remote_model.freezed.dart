// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'people_search_request.remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PeopleSearchRequestRemoteModel {

 String get q; int get limit; List<String> get objectTypes;
/// Create a copy of PeopleSearchRequestRemoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PeopleSearchRequestRemoteModelCopyWith<PeopleSearchRequestRemoteModel> get copyWith => _$PeopleSearchRequestRemoteModelCopyWithImpl<PeopleSearchRequestRemoteModel>(this as PeopleSearchRequestRemoteModel, _$identity);

  /// Serializes this PeopleSearchRequestRemoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PeopleSearchRequestRemoteModel&&(identical(other.q, q) || other.q == q)&&(identical(other.limit, limit) || other.limit == limit)&&const DeepCollectionEquality().equals(other.objectTypes, objectTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,q,limit,const DeepCollectionEquality().hash(objectTypes));

@override
String toString() {
  return 'PeopleSearchRequestRemoteModel(q: $q, limit: $limit, objectTypes: $objectTypes)';
}


}

/// @nodoc
abstract mixin class $PeopleSearchRequestRemoteModelCopyWith<$Res>  {
  factory $PeopleSearchRequestRemoteModelCopyWith(PeopleSearchRequestRemoteModel value, $Res Function(PeopleSearchRequestRemoteModel) _then) = _$PeopleSearchRequestRemoteModelCopyWithImpl;
@useResult
$Res call({
 String q, int limit, List<String> objectTypes
});




}
/// @nodoc
class _$PeopleSearchRequestRemoteModelCopyWithImpl<$Res>
    implements $PeopleSearchRequestRemoteModelCopyWith<$Res> {
  _$PeopleSearchRequestRemoteModelCopyWithImpl(this._self, this._then);

  final PeopleSearchRequestRemoteModel _self;
  final $Res Function(PeopleSearchRequestRemoteModel) _then;

/// Create a copy of PeopleSearchRequestRemoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? q = null,Object? limit = null,Object? objectTypes = null,}) {
  return _then(_self.copyWith(
q: null == q ? _self.q : q // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,objectTypes: null == objectTypes ? _self.objectTypes : objectTypes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PeopleSearchRequestRemoteModel implements PeopleSearchRequestRemoteModel {
  const _PeopleSearchRequestRemoteModel({required this.q, this.limit = 10, final  List<String> objectTypes = const <String>['user', 'contact']}): _objectTypes = objectTypes;
  factory _PeopleSearchRequestRemoteModel.fromJson(Map<String, dynamic> json) => _$PeopleSearchRequestRemoteModelFromJson(json);

@override final  String q;
@override@JsonKey() final  int limit;
 final  List<String> _objectTypes;
@override@JsonKey() List<String> get objectTypes {
  if (_objectTypes is EqualUnmodifiableListView) return _objectTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_objectTypes);
}


/// Create a copy of PeopleSearchRequestRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PeopleSearchRequestRemoteModelCopyWith<_PeopleSearchRequestRemoteModel> get copyWith => __$PeopleSearchRequestRemoteModelCopyWithImpl<_PeopleSearchRequestRemoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PeopleSearchRequestRemoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PeopleSearchRequestRemoteModel&&(identical(other.q, q) || other.q == q)&&(identical(other.limit, limit) || other.limit == limit)&&const DeepCollectionEquality().equals(other._objectTypes, _objectTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,q,limit,const DeepCollectionEquality().hash(_objectTypes));

@override
String toString() {
  return 'PeopleSearchRequestRemoteModel(q: $q, limit: $limit, objectTypes: $objectTypes)';
}


}

/// @nodoc
abstract mixin class _$PeopleSearchRequestRemoteModelCopyWith<$Res> implements $PeopleSearchRequestRemoteModelCopyWith<$Res> {
  factory _$PeopleSearchRequestRemoteModelCopyWith(_PeopleSearchRequestRemoteModel value, $Res Function(_PeopleSearchRequestRemoteModel) _then) = __$PeopleSearchRequestRemoteModelCopyWithImpl;
@override @useResult
$Res call({
 String q, int limit, List<String> objectTypes
});




}
/// @nodoc
class __$PeopleSearchRequestRemoteModelCopyWithImpl<$Res>
    implements _$PeopleSearchRequestRemoteModelCopyWith<$Res> {
  __$PeopleSearchRequestRemoteModelCopyWithImpl(this._self, this._then);

  final _PeopleSearchRequestRemoteModel _self;
  final $Res Function(_PeopleSearchRequestRemoteModel) _then;

/// Create a copy of PeopleSearchRequestRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? q = null,Object? limit = null,Object? objectTypes = null,}) {
  return _then(_PeopleSearchRequestRemoteModel(
q: null == q ? _self.q : q // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,objectTypes: null == objectTypes ? _self._objectTypes : objectTypes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
