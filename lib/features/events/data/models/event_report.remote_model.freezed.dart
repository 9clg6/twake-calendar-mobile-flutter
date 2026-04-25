// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_report.remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalendarItemRemoteModel {

 String? get etag; int? get status;@JsonKey(name: 'data') List<dynamic> get data;
/// Create a copy of CalendarItemRemoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarItemRemoteModelCopyWith<CalendarItemRemoteModel> get copyWith => _$CalendarItemRemoteModelCopyWithImpl<CalendarItemRemoteModel>(this as CalendarItemRemoteModel, _$identity);

  /// Serializes this CalendarItemRemoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarItemRemoteModel&&(identical(other.etag, etag) || other.etag == etag)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,etag,status,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'CalendarItemRemoteModel(etag: $etag, status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $CalendarItemRemoteModelCopyWith<$Res>  {
  factory $CalendarItemRemoteModelCopyWith(CalendarItemRemoteModel value, $Res Function(CalendarItemRemoteModel) _then) = _$CalendarItemRemoteModelCopyWithImpl;
@useResult
$Res call({
 String? etag, int? status,@JsonKey(name: 'data') List<dynamic> data
});




}
/// @nodoc
class _$CalendarItemRemoteModelCopyWithImpl<$Res>
    implements $CalendarItemRemoteModelCopyWith<$Res> {
  _$CalendarItemRemoteModelCopyWithImpl(this._self, this._then);

  final CalendarItemRemoteModel _self;
  final $Res Function(CalendarItemRemoteModel) _then;

/// Create a copy of CalendarItemRemoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? etag = freezed,Object? status = freezed,Object? data = null,}) {
  return _then(_self.copyWith(
etag: freezed == etag ? _self.etag : etag // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CalendarItemRemoteModel implements CalendarItemRemoteModel {
  const _CalendarItemRemoteModel({this.etag, this.status, @JsonKey(name: 'data') required final  List<dynamic> data}): _data = data;
  factory _CalendarItemRemoteModel.fromJson(Map<String, dynamic> json) => _$CalendarItemRemoteModelFromJson(json);

@override final  String? etag;
@override final  int? status;
 final  List<dynamic> _data;
@override@JsonKey(name: 'data') List<dynamic> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of CalendarItemRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarItemRemoteModelCopyWith<_CalendarItemRemoteModel> get copyWith => __$CalendarItemRemoteModelCopyWithImpl<_CalendarItemRemoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalendarItemRemoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarItemRemoteModel&&(identical(other.etag, etag) || other.etag == etag)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,etag,status,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'CalendarItemRemoteModel(etag: $etag, status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CalendarItemRemoteModelCopyWith<$Res> implements $CalendarItemRemoteModelCopyWith<$Res> {
  factory _$CalendarItemRemoteModelCopyWith(_CalendarItemRemoteModel value, $Res Function(_CalendarItemRemoteModel) _then) = __$CalendarItemRemoteModelCopyWithImpl;
@override @useResult
$Res call({
 String? etag, int? status,@JsonKey(name: 'data') List<dynamic> data
});




}
/// @nodoc
class __$CalendarItemRemoteModelCopyWithImpl<$Res>
    implements _$CalendarItemRemoteModelCopyWith<$Res> {
  __$CalendarItemRemoteModelCopyWithImpl(this._self, this._then);

  final _CalendarItemRemoteModel _self;
  final $Res Function(_CalendarItemRemoteModel) _then;

/// Create a copy of CalendarItemRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? etag = freezed,Object? status = freezed,Object? data = null,}) {
  return _then(_CalendarItemRemoteModel(
etag: freezed == etag ? _self.etag : etag // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}


}


/// @nodoc
mixin _$CalendarReportEmbeddedRemoteModel {

@JsonKey(name: 'dav:item') List<CalendarItemRemoteModel> get items;@JsonKey(name: 'sync-token') String? get syncToken;
/// Create a copy of CalendarReportEmbeddedRemoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarReportEmbeddedRemoteModelCopyWith<CalendarReportEmbeddedRemoteModel> get copyWith => _$CalendarReportEmbeddedRemoteModelCopyWithImpl<CalendarReportEmbeddedRemoteModel>(this as CalendarReportEmbeddedRemoteModel, _$identity);

  /// Serializes this CalendarReportEmbeddedRemoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarReportEmbeddedRemoteModel&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.syncToken, syncToken) || other.syncToken == syncToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),syncToken);

@override
String toString() {
  return 'CalendarReportEmbeddedRemoteModel(items: $items, syncToken: $syncToken)';
}


}

/// @nodoc
abstract mixin class $CalendarReportEmbeddedRemoteModelCopyWith<$Res>  {
  factory $CalendarReportEmbeddedRemoteModelCopyWith(CalendarReportEmbeddedRemoteModel value, $Res Function(CalendarReportEmbeddedRemoteModel) _then) = _$CalendarReportEmbeddedRemoteModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'dav:item') List<CalendarItemRemoteModel> items,@JsonKey(name: 'sync-token') String? syncToken
});




}
/// @nodoc
class _$CalendarReportEmbeddedRemoteModelCopyWithImpl<$Res>
    implements $CalendarReportEmbeddedRemoteModelCopyWith<$Res> {
  _$CalendarReportEmbeddedRemoteModelCopyWithImpl(this._self, this._then);

  final CalendarReportEmbeddedRemoteModel _self;
  final $Res Function(CalendarReportEmbeddedRemoteModel) _then;

/// Create a copy of CalendarReportEmbeddedRemoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? syncToken = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CalendarItemRemoteModel>,syncToken: freezed == syncToken ? _self.syncToken : syncToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CalendarReportEmbeddedRemoteModel implements CalendarReportEmbeddedRemoteModel {
  const _CalendarReportEmbeddedRemoteModel({@JsonKey(name: 'dav:item') final  List<CalendarItemRemoteModel> items = const <CalendarItemRemoteModel>[], @JsonKey(name: 'sync-token') this.syncToken}): _items = items;
  factory _CalendarReportEmbeddedRemoteModel.fromJson(Map<String, dynamic> json) => _$CalendarReportEmbeddedRemoteModelFromJson(json);

 final  List<CalendarItemRemoteModel> _items;
@override@JsonKey(name: 'dav:item') List<CalendarItemRemoteModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(name: 'sync-token') final  String? syncToken;

/// Create a copy of CalendarReportEmbeddedRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarReportEmbeddedRemoteModelCopyWith<_CalendarReportEmbeddedRemoteModel> get copyWith => __$CalendarReportEmbeddedRemoteModelCopyWithImpl<_CalendarReportEmbeddedRemoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalendarReportEmbeddedRemoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarReportEmbeddedRemoteModel&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.syncToken, syncToken) || other.syncToken == syncToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),syncToken);

@override
String toString() {
  return 'CalendarReportEmbeddedRemoteModel(items: $items, syncToken: $syncToken)';
}


}

/// @nodoc
abstract mixin class _$CalendarReportEmbeddedRemoteModelCopyWith<$Res> implements $CalendarReportEmbeddedRemoteModelCopyWith<$Res> {
  factory _$CalendarReportEmbeddedRemoteModelCopyWith(_CalendarReportEmbeddedRemoteModel value, $Res Function(_CalendarReportEmbeddedRemoteModel) _then) = __$CalendarReportEmbeddedRemoteModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'dav:item') List<CalendarItemRemoteModel> items,@JsonKey(name: 'sync-token') String? syncToken
});




}
/// @nodoc
class __$CalendarReportEmbeddedRemoteModelCopyWithImpl<$Res>
    implements _$CalendarReportEmbeddedRemoteModelCopyWith<$Res> {
  __$CalendarReportEmbeddedRemoteModelCopyWithImpl(this._self, this._then);

  final _CalendarReportEmbeddedRemoteModel _self;
  final $Res Function(_CalendarReportEmbeddedRemoteModel) _then;

/// Create a copy of CalendarReportEmbeddedRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? syncToken = freezed,}) {
  return _then(_CalendarReportEmbeddedRemoteModel(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CalendarItemRemoteModel>,syncToken: freezed == syncToken ? _self.syncToken : syncToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CalendarReportRemoteModel {

@JsonKey(name: '_embedded') CalendarReportEmbeddedRemoteModel get embedded;
/// Create a copy of CalendarReportRemoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarReportRemoteModelCopyWith<CalendarReportRemoteModel> get copyWith => _$CalendarReportRemoteModelCopyWithImpl<CalendarReportRemoteModel>(this as CalendarReportRemoteModel, _$identity);

  /// Serializes this CalendarReportRemoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarReportRemoteModel&&(identical(other.embedded, embedded) || other.embedded == embedded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,embedded);

@override
String toString() {
  return 'CalendarReportRemoteModel(embedded: $embedded)';
}


}

/// @nodoc
abstract mixin class $CalendarReportRemoteModelCopyWith<$Res>  {
  factory $CalendarReportRemoteModelCopyWith(CalendarReportRemoteModel value, $Res Function(CalendarReportRemoteModel) _then) = _$CalendarReportRemoteModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_embedded') CalendarReportEmbeddedRemoteModel embedded
});


$CalendarReportEmbeddedRemoteModelCopyWith<$Res> get embedded;

}
/// @nodoc
class _$CalendarReportRemoteModelCopyWithImpl<$Res>
    implements $CalendarReportRemoteModelCopyWith<$Res> {
  _$CalendarReportRemoteModelCopyWithImpl(this._self, this._then);

  final CalendarReportRemoteModel _self;
  final $Res Function(CalendarReportRemoteModel) _then;

/// Create a copy of CalendarReportRemoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? embedded = null,}) {
  return _then(_self.copyWith(
embedded: null == embedded ? _self.embedded : embedded // ignore: cast_nullable_to_non_nullable
as CalendarReportEmbeddedRemoteModel,
  ));
}
/// Create a copy of CalendarReportRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CalendarReportEmbeddedRemoteModelCopyWith<$Res> get embedded {
  
  return $CalendarReportEmbeddedRemoteModelCopyWith<$Res>(_self.embedded, (value) {
    return _then(_self.copyWith(embedded: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _CalendarReportRemoteModel implements CalendarReportRemoteModel {
  const _CalendarReportRemoteModel({@JsonKey(name: '_embedded') required this.embedded});
  factory _CalendarReportRemoteModel.fromJson(Map<String, dynamic> json) => _$CalendarReportRemoteModelFromJson(json);

@override@JsonKey(name: '_embedded') final  CalendarReportEmbeddedRemoteModel embedded;

/// Create a copy of CalendarReportRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarReportRemoteModelCopyWith<_CalendarReportRemoteModel> get copyWith => __$CalendarReportRemoteModelCopyWithImpl<_CalendarReportRemoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalendarReportRemoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarReportRemoteModel&&(identical(other.embedded, embedded) || other.embedded == embedded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,embedded);

@override
String toString() {
  return 'CalendarReportRemoteModel(embedded: $embedded)';
}


}

/// @nodoc
abstract mixin class _$CalendarReportRemoteModelCopyWith<$Res> implements $CalendarReportRemoteModelCopyWith<$Res> {
  factory _$CalendarReportRemoteModelCopyWith(_CalendarReportRemoteModel value, $Res Function(_CalendarReportRemoteModel) _then) = __$CalendarReportRemoteModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_embedded') CalendarReportEmbeddedRemoteModel embedded
});


@override $CalendarReportEmbeddedRemoteModelCopyWith<$Res> get embedded;

}
/// @nodoc
class __$CalendarReportRemoteModelCopyWithImpl<$Res>
    implements _$CalendarReportRemoteModelCopyWith<$Res> {
  __$CalendarReportRemoteModelCopyWithImpl(this._self, this._then);

  final _CalendarReportRemoteModel _self;
  final $Res Function(_CalendarReportRemoteModel) _then;

/// Create a copy of CalendarReportRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? embedded = null,}) {
  return _then(_CalendarReportRemoteModel(
embedded: null == embedded ? _self.embedded : embedded // ignore: cast_nullable_to_non_nullable
as CalendarReportEmbeddedRemoteModel,
  ));
}

/// Create a copy of CalendarReportRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CalendarReportEmbeddedRemoteModelCopyWith<$Res> get embedded {
  
  return $CalendarReportEmbeddedRemoteModelCopyWith<$Res>(_self.embedded, (value) {
    return _then(_self.copyWith(embedded: value));
  });
}
}

// dart format on
