// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_calendar_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateCalendarParams {

 String get id; String get name; String? get description; String? get color;
/// Create a copy of CreateCalendarParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateCalendarParamsCopyWith<CreateCalendarParams> get copyWith => _$CreateCalendarParamsCopyWithImpl<CreateCalendarParams>(this as CreateCalendarParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCalendarParams&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,color);

@override
String toString() {
  return 'CreateCalendarParams(id: $id, name: $name, description: $description, color: $color)';
}


}

/// @nodoc
abstract mixin class $CreateCalendarParamsCopyWith<$Res>  {
  factory $CreateCalendarParamsCopyWith(CreateCalendarParams value, $Res Function(CreateCalendarParams) _then) = _$CreateCalendarParamsCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, String? color
});




}
/// @nodoc
class _$CreateCalendarParamsCopyWithImpl<$Res>
    implements $CreateCalendarParamsCopyWith<$Res> {
  _$CreateCalendarParamsCopyWithImpl(this._self, this._then);

  final CreateCalendarParams _self;
  final $Res Function(CreateCalendarParams) _then;

/// Create a copy of CreateCalendarParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? color = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _CreateCalendarParams implements CreateCalendarParams {
  const _CreateCalendarParams({required this.id, required this.name, this.description, this.color});
  

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  String? color;

/// Create a copy of CreateCalendarParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCalendarParamsCopyWith<_CreateCalendarParams> get copyWith => __$CreateCalendarParamsCopyWithImpl<_CreateCalendarParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateCalendarParams&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,color);

@override
String toString() {
  return 'CreateCalendarParams(id: $id, name: $name, description: $description, color: $color)';
}


}

/// @nodoc
abstract mixin class _$CreateCalendarParamsCopyWith<$Res> implements $CreateCalendarParamsCopyWith<$Res> {
  factory _$CreateCalendarParamsCopyWith(_CreateCalendarParams value, $Res Function(_CreateCalendarParams) _then) = __$CreateCalendarParamsCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, String? color
});




}
/// @nodoc
class __$CreateCalendarParamsCopyWithImpl<$Res>
    implements _$CreateCalendarParamsCopyWith<$Res> {
  __$CreateCalendarParamsCopyWithImpl(this._self, this._then);

  final _CreateCalendarParams _self;
  final $Res Function(_CreateCalendarParams) _then;

/// Create a copy of CreateCalendarParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? color = freezed,}) {
  return _then(_CreateCalendarParams(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
