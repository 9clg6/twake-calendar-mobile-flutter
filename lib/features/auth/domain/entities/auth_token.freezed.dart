// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthTokenEntity {

 String get accessToken; String? get refreshToken; String? get idToken; DateTime? get expiresAt;
/// Create a copy of AuthTokenEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthTokenEntityCopyWith<AuthTokenEntity> get copyWith => _$AuthTokenEntityCopyWithImpl<AuthTokenEntity>(this as AuthTokenEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthTokenEntity&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.idToken, idToken) || other.idToken == idToken)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}


@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,idToken,expiresAt);

@override
String toString() {
  return 'AuthTokenEntity(accessToken: $accessToken, refreshToken: $refreshToken, idToken: $idToken, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $AuthTokenEntityCopyWith<$Res>  {
  factory $AuthTokenEntityCopyWith(AuthTokenEntity value, $Res Function(AuthTokenEntity) _then) = _$AuthTokenEntityCopyWithImpl;
@useResult
$Res call({
 String accessToken, String? refreshToken, String? idToken, DateTime? expiresAt
});




}
/// @nodoc
class _$AuthTokenEntityCopyWithImpl<$Res>
    implements $AuthTokenEntityCopyWith<$Res> {
  _$AuthTokenEntityCopyWithImpl(this._self, this._then);

  final AuthTokenEntity _self;
  final $Res Function(AuthTokenEntity) _then;

/// Create a copy of AuthTokenEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = freezed,Object? idToken = freezed,Object? expiresAt = freezed,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,idToken: freezed == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc


class _AuthTokenEntity extends AuthTokenEntity {
  const _AuthTokenEntity({required this.accessToken, this.refreshToken, this.idToken, this.expiresAt}): super._();
  

@override final  String accessToken;
@override final  String? refreshToken;
@override final  String? idToken;
@override final  DateTime? expiresAt;

/// Create a copy of AuthTokenEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthTokenEntityCopyWith<_AuthTokenEntity> get copyWith => __$AuthTokenEntityCopyWithImpl<_AuthTokenEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthTokenEntity&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.idToken, idToken) || other.idToken == idToken)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}


@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,idToken,expiresAt);

@override
String toString() {
  return 'AuthTokenEntity(accessToken: $accessToken, refreshToken: $refreshToken, idToken: $idToken, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$AuthTokenEntityCopyWith<$Res> implements $AuthTokenEntityCopyWith<$Res> {
  factory _$AuthTokenEntityCopyWith(_AuthTokenEntity value, $Res Function(_AuthTokenEntity) _then) = __$AuthTokenEntityCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String? refreshToken, String? idToken, DateTime? expiresAt
});




}
/// @nodoc
class __$AuthTokenEntityCopyWithImpl<$Res>
    implements _$AuthTokenEntityCopyWith<$Res> {
  __$AuthTokenEntityCopyWithImpl(this._self, this._then);

  final _AuthTokenEntity _self;
  final $Res Function(_AuthTokenEntity) _then;

/// Create a copy of AuthTokenEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = freezed,Object? idToken = freezed,Object? expiresAt = freezed,}) {
  return _then(_AuthTokenEntity(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,idToken: freezed == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
