// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserRemoteModel _$UserRemoteModelFromJson(Map<String, dynamic> json) =>
    _UserRemoteModel(
      id: json['id'] as String,
      preferredEmail: json['preferredEmail'] as String?,
      firstName: json['firstname'] as String?,
      lastName: json['lastname'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$UserRemoteModelToJson(_UserRemoteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'preferredEmail': instance.preferredEmail,
      'firstname': instance.firstName,
      'lastname': instance.lastName,
      'avatarUrl': instance.avatarUrl,
    };
