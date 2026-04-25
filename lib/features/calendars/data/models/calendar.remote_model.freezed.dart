// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar.remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalDavLinkRemoteModel {

 String? get href;
/// Create a copy of CalDavLinkRemoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalDavLinkRemoteModelCopyWith<CalDavLinkRemoteModel> get copyWith => _$CalDavLinkRemoteModelCopyWithImpl<CalDavLinkRemoteModel>(this as CalDavLinkRemoteModel, _$identity);

  /// Serializes this CalDavLinkRemoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalDavLinkRemoteModel&&(identical(other.href, href) || other.href == href));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,href);

@override
String toString() {
  return 'CalDavLinkRemoteModel(href: $href)';
}


}

/// @nodoc
abstract mixin class $CalDavLinkRemoteModelCopyWith<$Res>  {
  factory $CalDavLinkRemoteModelCopyWith(CalDavLinkRemoteModel value, $Res Function(CalDavLinkRemoteModel) _then) = _$CalDavLinkRemoteModelCopyWithImpl;
@useResult
$Res call({
 String? href
});




}
/// @nodoc
class _$CalDavLinkRemoteModelCopyWithImpl<$Res>
    implements $CalDavLinkRemoteModelCopyWith<$Res> {
  _$CalDavLinkRemoteModelCopyWithImpl(this._self, this._then);

  final CalDavLinkRemoteModel _self;
  final $Res Function(CalDavLinkRemoteModel) _then;

/// Create a copy of CalDavLinkRemoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? href = freezed,}) {
  return _then(_self.copyWith(
href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CalDavLinkRemoteModel implements CalDavLinkRemoteModel {
  const _CalDavLinkRemoteModel({this.href});
  factory _CalDavLinkRemoteModel.fromJson(Map<String, dynamic> json) => _$CalDavLinkRemoteModelFromJson(json);

@override final  String? href;

/// Create a copy of CalDavLinkRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalDavLinkRemoteModelCopyWith<_CalDavLinkRemoteModel> get copyWith => __$CalDavLinkRemoteModelCopyWithImpl<_CalDavLinkRemoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalDavLinkRemoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalDavLinkRemoteModel&&(identical(other.href, href) || other.href == href));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,href);

@override
String toString() {
  return 'CalDavLinkRemoteModel(href: $href)';
}


}

/// @nodoc
abstract mixin class _$CalDavLinkRemoteModelCopyWith<$Res> implements $CalDavLinkRemoteModelCopyWith<$Res> {
  factory _$CalDavLinkRemoteModelCopyWith(_CalDavLinkRemoteModel value, $Res Function(_CalDavLinkRemoteModel) _then) = __$CalDavLinkRemoteModelCopyWithImpl;
@override @useResult
$Res call({
 String? href
});




}
/// @nodoc
class __$CalDavLinkRemoteModelCopyWithImpl<$Res>
    implements _$CalDavLinkRemoteModelCopyWith<$Res> {
  __$CalDavLinkRemoteModelCopyWithImpl(this._self, this._then);

  final _CalDavLinkRemoteModel _self;
  final $Res Function(_CalDavLinkRemoteModel) _then;

/// Create a copy of CalDavLinkRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? href = freezed,}) {
  return _then(_CalDavLinkRemoteModel(
href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CalendarRemoteModel {

 String get id;@JsonKey(name: 'dav:name') String get name;@JsonKey(name: 'apple:color') String? get color;@JsonKey(name: 'caldav:description') String? get description;@JsonKey(name: '_links') Map<String, CalDavLinkRemoteModel> get links;
/// Create a copy of CalendarRemoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarRemoteModelCopyWith<CalendarRemoteModel> get copyWith => _$CalendarRemoteModelCopyWithImpl<CalendarRemoteModel>(this as CalendarRemoteModel, _$identity);

  /// Serializes this CalendarRemoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarRemoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.links, links));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,color,description,const DeepCollectionEquality().hash(links));

@override
String toString() {
  return 'CalendarRemoteModel(id: $id, name: $name, color: $color, description: $description, links: $links)';
}


}

/// @nodoc
abstract mixin class $CalendarRemoteModelCopyWith<$Res>  {
  factory $CalendarRemoteModelCopyWith(CalendarRemoteModel value, $Res Function(CalendarRemoteModel) _then) = _$CalendarRemoteModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'dav:name') String name,@JsonKey(name: 'apple:color') String? color,@JsonKey(name: 'caldav:description') String? description,@JsonKey(name: '_links') Map<String, CalDavLinkRemoteModel> links
});




}
/// @nodoc
class _$CalendarRemoteModelCopyWithImpl<$Res>
    implements $CalendarRemoteModelCopyWith<$Res> {
  _$CalendarRemoteModelCopyWithImpl(this._self, this._then);

  final CalendarRemoteModel _self;
  final $Res Function(CalendarRemoteModel) _then;

/// Create a copy of CalendarRemoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? color = freezed,Object? description = freezed,Object? links = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as Map<String, CalDavLinkRemoteModel>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CalendarRemoteModel implements CalendarRemoteModel {
  const _CalendarRemoteModel({required this.id, @JsonKey(name: 'dav:name') required this.name, @JsonKey(name: 'apple:color') this.color, @JsonKey(name: 'caldav:description') this.description, @JsonKey(name: '_links') final  Map<String, CalDavLinkRemoteModel> links = const <String, CalDavLinkRemoteModel>{}}): _links = links;
  factory _CalendarRemoteModel.fromJson(Map<String, dynamic> json) => _$CalendarRemoteModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'dav:name') final  String name;
@override@JsonKey(name: 'apple:color') final  String? color;
@override@JsonKey(name: 'caldav:description') final  String? description;
 final  Map<String, CalDavLinkRemoteModel> _links;
@override@JsonKey(name: '_links') Map<String, CalDavLinkRemoteModel> get links {
  if (_links is EqualUnmodifiableMapView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_links);
}


/// Create a copy of CalendarRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarRemoteModelCopyWith<_CalendarRemoteModel> get copyWith => __$CalendarRemoteModelCopyWithImpl<_CalendarRemoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalendarRemoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarRemoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._links, _links));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,color,description,const DeepCollectionEquality().hash(_links));

@override
String toString() {
  return 'CalendarRemoteModel(id: $id, name: $name, color: $color, description: $description, links: $links)';
}


}

/// @nodoc
abstract mixin class _$CalendarRemoteModelCopyWith<$Res> implements $CalendarRemoteModelCopyWith<$Res> {
  factory _$CalendarRemoteModelCopyWith(_CalendarRemoteModel value, $Res Function(_CalendarRemoteModel) _then) = __$CalendarRemoteModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'dav:name') String name,@JsonKey(name: 'apple:color') String? color,@JsonKey(name: 'caldav:description') String? description,@JsonKey(name: '_links') Map<String, CalDavLinkRemoteModel> links
});




}
/// @nodoc
class __$CalendarRemoteModelCopyWithImpl<$Res>
    implements _$CalendarRemoteModelCopyWith<$Res> {
  __$CalendarRemoteModelCopyWithImpl(this._self, this._then);

  final _CalendarRemoteModel _self;
  final $Res Function(_CalendarRemoteModel) _then;

/// Create a copy of CalendarRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? color = freezed,Object? description = freezed,Object? links = null,}) {
  return _then(_CalendarRemoteModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,links: null == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as Map<String, CalDavLinkRemoteModel>,
  ));
}


}


/// @nodoc
mixin _$CalendarListEmbeddedRemoteModel {

@JsonKey(name: 'dav:calendar') List<CalendarRemoteModel> get calendars;
/// Create a copy of CalendarListEmbeddedRemoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarListEmbeddedRemoteModelCopyWith<CalendarListEmbeddedRemoteModel> get copyWith => _$CalendarListEmbeddedRemoteModelCopyWithImpl<CalendarListEmbeddedRemoteModel>(this as CalendarListEmbeddedRemoteModel, _$identity);

  /// Serializes this CalendarListEmbeddedRemoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarListEmbeddedRemoteModel&&const DeepCollectionEquality().equals(other.calendars, calendars));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(calendars));

@override
String toString() {
  return 'CalendarListEmbeddedRemoteModel(calendars: $calendars)';
}


}

/// @nodoc
abstract mixin class $CalendarListEmbeddedRemoteModelCopyWith<$Res>  {
  factory $CalendarListEmbeddedRemoteModelCopyWith(CalendarListEmbeddedRemoteModel value, $Res Function(CalendarListEmbeddedRemoteModel) _then) = _$CalendarListEmbeddedRemoteModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'dav:calendar') List<CalendarRemoteModel> calendars
});




}
/// @nodoc
class _$CalendarListEmbeddedRemoteModelCopyWithImpl<$Res>
    implements $CalendarListEmbeddedRemoteModelCopyWith<$Res> {
  _$CalendarListEmbeddedRemoteModelCopyWithImpl(this._self, this._then);

  final CalendarListEmbeddedRemoteModel _self;
  final $Res Function(CalendarListEmbeddedRemoteModel) _then;

/// Create a copy of CalendarListEmbeddedRemoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? calendars = null,}) {
  return _then(_self.copyWith(
calendars: null == calendars ? _self.calendars : calendars // ignore: cast_nullable_to_non_nullable
as List<CalendarRemoteModel>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CalendarListEmbeddedRemoteModel implements CalendarListEmbeddedRemoteModel {
  const _CalendarListEmbeddedRemoteModel({@JsonKey(name: 'dav:calendar') final  List<CalendarRemoteModel> calendars = const <CalendarRemoteModel>[]}): _calendars = calendars;
  factory _CalendarListEmbeddedRemoteModel.fromJson(Map<String, dynamic> json) => _$CalendarListEmbeddedRemoteModelFromJson(json);

 final  List<CalendarRemoteModel> _calendars;
@override@JsonKey(name: 'dav:calendar') List<CalendarRemoteModel> get calendars {
  if (_calendars is EqualUnmodifiableListView) return _calendars;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_calendars);
}


/// Create a copy of CalendarListEmbeddedRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarListEmbeddedRemoteModelCopyWith<_CalendarListEmbeddedRemoteModel> get copyWith => __$CalendarListEmbeddedRemoteModelCopyWithImpl<_CalendarListEmbeddedRemoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalendarListEmbeddedRemoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarListEmbeddedRemoteModel&&const DeepCollectionEquality().equals(other._calendars, _calendars));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_calendars));

@override
String toString() {
  return 'CalendarListEmbeddedRemoteModel(calendars: $calendars)';
}


}

/// @nodoc
abstract mixin class _$CalendarListEmbeddedRemoteModelCopyWith<$Res> implements $CalendarListEmbeddedRemoteModelCopyWith<$Res> {
  factory _$CalendarListEmbeddedRemoteModelCopyWith(_CalendarListEmbeddedRemoteModel value, $Res Function(_CalendarListEmbeddedRemoteModel) _then) = __$CalendarListEmbeddedRemoteModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'dav:calendar') List<CalendarRemoteModel> calendars
});




}
/// @nodoc
class __$CalendarListEmbeddedRemoteModelCopyWithImpl<$Res>
    implements _$CalendarListEmbeddedRemoteModelCopyWith<$Res> {
  __$CalendarListEmbeddedRemoteModelCopyWithImpl(this._self, this._then);

  final _CalendarListEmbeddedRemoteModel _self;
  final $Res Function(_CalendarListEmbeddedRemoteModel) _then;

/// Create a copy of CalendarListEmbeddedRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? calendars = null,}) {
  return _then(_CalendarListEmbeddedRemoteModel(
calendars: null == calendars ? _self._calendars : calendars // ignore: cast_nullable_to_non_nullable
as List<CalendarRemoteModel>,
  ));
}


}


/// @nodoc
mixin _$CalendarListRemoteModel {

@JsonKey(name: '_embedded') CalendarListEmbeddedRemoteModel get embedded;
/// Create a copy of CalendarListRemoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarListRemoteModelCopyWith<CalendarListRemoteModel> get copyWith => _$CalendarListRemoteModelCopyWithImpl<CalendarListRemoteModel>(this as CalendarListRemoteModel, _$identity);

  /// Serializes this CalendarListRemoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarListRemoteModel&&(identical(other.embedded, embedded) || other.embedded == embedded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,embedded);

@override
String toString() {
  return 'CalendarListRemoteModel(embedded: $embedded)';
}


}

/// @nodoc
abstract mixin class $CalendarListRemoteModelCopyWith<$Res>  {
  factory $CalendarListRemoteModelCopyWith(CalendarListRemoteModel value, $Res Function(CalendarListRemoteModel) _then) = _$CalendarListRemoteModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_embedded') CalendarListEmbeddedRemoteModel embedded
});


$CalendarListEmbeddedRemoteModelCopyWith<$Res> get embedded;

}
/// @nodoc
class _$CalendarListRemoteModelCopyWithImpl<$Res>
    implements $CalendarListRemoteModelCopyWith<$Res> {
  _$CalendarListRemoteModelCopyWithImpl(this._self, this._then);

  final CalendarListRemoteModel _self;
  final $Res Function(CalendarListRemoteModel) _then;

/// Create a copy of CalendarListRemoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? embedded = null,}) {
  return _then(_self.copyWith(
embedded: null == embedded ? _self.embedded : embedded // ignore: cast_nullable_to_non_nullable
as CalendarListEmbeddedRemoteModel,
  ));
}
/// Create a copy of CalendarListRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CalendarListEmbeddedRemoteModelCopyWith<$Res> get embedded {
  
  return $CalendarListEmbeddedRemoteModelCopyWith<$Res>(_self.embedded, (value) {
    return _then(_self.copyWith(embedded: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _CalendarListRemoteModel implements CalendarListRemoteModel {
  const _CalendarListRemoteModel({@JsonKey(name: '_embedded') required this.embedded});
  factory _CalendarListRemoteModel.fromJson(Map<String, dynamic> json) => _$CalendarListRemoteModelFromJson(json);

@override@JsonKey(name: '_embedded') final  CalendarListEmbeddedRemoteModel embedded;

/// Create a copy of CalendarListRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarListRemoteModelCopyWith<_CalendarListRemoteModel> get copyWith => __$CalendarListRemoteModelCopyWithImpl<_CalendarListRemoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalendarListRemoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarListRemoteModel&&(identical(other.embedded, embedded) || other.embedded == embedded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,embedded);

@override
String toString() {
  return 'CalendarListRemoteModel(embedded: $embedded)';
}


}

/// @nodoc
abstract mixin class _$CalendarListRemoteModelCopyWith<$Res> implements $CalendarListRemoteModelCopyWith<$Res> {
  factory _$CalendarListRemoteModelCopyWith(_CalendarListRemoteModel value, $Res Function(_CalendarListRemoteModel) _then) = __$CalendarListRemoteModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_embedded') CalendarListEmbeddedRemoteModel embedded
});


@override $CalendarListEmbeddedRemoteModelCopyWith<$Res> get embedded;

}
/// @nodoc
class __$CalendarListRemoteModelCopyWithImpl<$Res>
    implements _$CalendarListRemoteModelCopyWith<$Res> {
  __$CalendarListRemoteModelCopyWithImpl(this._self, this._then);

  final _CalendarListRemoteModel _self;
  final $Res Function(_CalendarListRemoteModel) _then;

/// Create a copy of CalendarListRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? embedded = null,}) {
  return _then(_CalendarListRemoteModel(
embedded: null == embedded ? _self.embedded : embedded // ignore: cast_nullable_to_non_nullable
as CalendarListEmbeddedRemoteModel,
  ));
}

/// Create a copy of CalendarListRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CalendarListEmbeddedRemoteModelCopyWith<$Res> get embedded {
  
  return $CalendarListEmbeddedRemoteModelCopyWith<$Res>(_self.embedded, (value) {
    return _then(_self.copyWith(embedded: value));
  });
}
}

// dart format on
