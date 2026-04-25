// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PersonEntity {

 String get id; String get displayName; String get email; String get objectType;
/// Create a copy of PersonEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonEntityCopyWith<PersonEntity> get copyWith => _$PersonEntityCopyWithImpl<PersonEntity>(this as PersonEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.email, email) || other.email == email)&&(identical(other.objectType, objectType) || other.objectType == objectType));
}


@override
int get hashCode => Object.hash(runtimeType,id,displayName,email,objectType);

@override
String toString() {
  return 'PersonEntity(id: $id, displayName: $displayName, email: $email, objectType: $objectType)';
}


}

/// @nodoc
abstract mixin class $PersonEntityCopyWith<$Res>  {
  factory $PersonEntityCopyWith(PersonEntity value, $Res Function(PersonEntity) _then) = _$PersonEntityCopyWithImpl;
@useResult
$Res call({
 String id, String displayName, String email, String objectType
});




}
/// @nodoc
class _$PersonEntityCopyWithImpl<$Res>
    implements $PersonEntityCopyWith<$Res> {
  _$PersonEntityCopyWithImpl(this._self, this._then);

  final PersonEntity _self;
  final $Res Function(PersonEntity) _then;

/// Create a copy of PersonEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? displayName = null,Object? email = null,Object? objectType = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,objectType: null == objectType ? _self.objectType : objectType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _PersonEntity implements PersonEntity {
  const _PersonEntity({required this.id, required this.displayName, required this.email, this.objectType = 'user'});
  

@override final  String id;
@override final  String displayName;
@override final  String email;
@override@JsonKey() final  String objectType;

/// Create a copy of PersonEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonEntityCopyWith<_PersonEntity> get copyWith => __$PersonEntityCopyWithImpl<_PersonEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.email, email) || other.email == email)&&(identical(other.objectType, objectType) || other.objectType == objectType));
}


@override
int get hashCode => Object.hash(runtimeType,id,displayName,email,objectType);

@override
String toString() {
  return 'PersonEntity(id: $id, displayName: $displayName, email: $email, objectType: $objectType)';
}


}

/// @nodoc
abstract mixin class _$PersonEntityCopyWith<$Res> implements $PersonEntityCopyWith<$Res> {
  factory _$PersonEntityCopyWith(_PersonEntity value, $Res Function(_PersonEntity) _then) = __$PersonEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String displayName, String email, String objectType
});




}
/// @nodoc
class __$PersonEntityCopyWithImpl<$Res>
    implements _$PersonEntityCopyWith<$Res> {
  __$PersonEntityCopyWithImpl(this._self, this._then);

  final _PersonEntity _self;
  final $Res Function(_PersonEntity) _then;

/// Create a copy of PersonEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? displayName = null,Object? email = null,Object? objectType = null,}) {
  return _then(_PersonEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,objectType: null == objectType ? _self.objectType : objectType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
