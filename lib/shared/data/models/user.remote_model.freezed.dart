// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserRemoteModel {

 String get id;@JsonKey(name: 'preferredEmail') String? get preferredEmail;@JsonKey(name: 'firstname') String? get firstName;@JsonKey(name: 'lastname') String? get lastName;@JsonKey(name: 'avatarUrl') String? get avatarUrl;
/// Create a copy of UserRemoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRemoteModelCopyWith<UserRemoteModel> get copyWith => _$UserRemoteModelCopyWithImpl<UserRemoteModel>(this as UserRemoteModel, _$identity);

  /// Serializes this UserRemoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRemoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.preferredEmail, preferredEmail) || other.preferredEmail == preferredEmail)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,preferredEmail,firstName,lastName,avatarUrl);

@override
String toString() {
  return 'UserRemoteModel(id: $id, preferredEmail: $preferredEmail, firstName: $firstName, lastName: $lastName, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $UserRemoteModelCopyWith<$Res>  {
  factory $UserRemoteModelCopyWith(UserRemoteModel value, $Res Function(UserRemoteModel) _then) = _$UserRemoteModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'preferredEmail') String? preferredEmail,@JsonKey(name: 'firstname') String? firstName,@JsonKey(name: 'lastname') String? lastName,@JsonKey(name: 'avatarUrl') String? avatarUrl
});




}
/// @nodoc
class _$UserRemoteModelCopyWithImpl<$Res>
    implements $UserRemoteModelCopyWith<$Res> {
  _$UserRemoteModelCopyWithImpl(this._self, this._then);

  final UserRemoteModel _self;
  final $Res Function(UserRemoteModel) _then;

/// Create a copy of UserRemoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? preferredEmail = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,preferredEmail: freezed == preferredEmail ? _self.preferredEmail : preferredEmail // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserRemoteModel implements UserRemoteModel {
  const _UserRemoteModel({required this.id, @JsonKey(name: 'preferredEmail') this.preferredEmail, @JsonKey(name: 'firstname') this.firstName, @JsonKey(name: 'lastname') this.lastName, @JsonKey(name: 'avatarUrl') this.avatarUrl});
  factory _UserRemoteModel.fromJson(Map<String, dynamic> json) => _$UserRemoteModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'preferredEmail') final  String? preferredEmail;
@override@JsonKey(name: 'firstname') final  String? firstName;
@override@JsonKey(name: 'lastname') final  String? lastName;
@override@JsonKey(name: 'avatarUrl') final  String? avatarUrl;

/// Create a copy of UserRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserRemoteModelCopyWith<_UserRemoteModel> get copyWith => __$UserRemoteModelCopyWithImpl<_UserRemoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserRemoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserRemoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.preferredEmail, preferredEmail) || other.preferredEmail == preferredEmail)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,preferredEmail,firstName,lastName,avatarUrl);

@override
String toString() {
  return 'UserRemoteModel(id: $id, preferredEmail: $preferredEmail, firstName: $firstName, lastName: $lastName, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$UserRemoteModelCopyWith<$Res> implements $UserRemoteModelCopyWith<$Res> {
  factory _$UserRemoteModelCopyWith(_UserRemoteModel value, $Res Function(_UserRemoteModel) _then) = __$UserRemoteModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'preferredEmail') String? preferredEmail,@JsonKey(name: 'firstname') String? firstName,@JsonKey(name: 'lastname') String? lastName,@JsonKey(name: 'avatarUrl') String? avatarUrl
});




}
/// @nodoc
class __$UserRemoteModelCopyWithImpl<$Res>
    implements _$UserRemoteModelCopyWith<$Res> {
  __$UserRemoteModelCopyWithImpl(this._self, this._then);

  final _UserRemoteModel _self;
  final $Res Function(_UserRemoteModel) _then;

/// Create a copy of UserRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? preferredEmail = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? avatarUrl = freezed,}) {
  return _then(_UserRemoteModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,preferredEmail: freezed == preferredEmail ? _self.preferredEmail : preferredEmail // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
