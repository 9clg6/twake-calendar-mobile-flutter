// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_search_response.remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PeopleNameRemoteModel _$PeopleNameRemoteModelFromJson(
  Map<String, dynamic> json,
) => _PeopleNameRemoteModel(displayName: json['displayName'] as String?);

Map<String, dynamic> _$PeopleNameRemoteModelToJson(
  _PeopleNameRemoteModel instance,
) => <String, dynamic>{'displayName': instance.displayName};

_PeopleEmailRemoteModel _$PeopleEmailRemoteModelFromJson(
  Map<String, dynamic> json,
) => _PeopleEmailRemoteModel(value: json['value'] as String?);

Map<String, dynamic> _$PeopleEmailRemoteModelToJson(
  _PeopleEmailRemoteModel instance,
) => <String, dynamic>{'value': instance.value};

_PeopleHitRemoteModel _$PeopleHitRemoteModelFromJson(
  Map<String, dynamic> json,
) => _PeopleHitRemoteModel(
  id: json['id'] as String,
  objectType: json['objectType'] as String?,
  names:
      (json['names'] as List<dynamic>?)
          ?.map(
            (e) => PeopleNameRemoteModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <PeopleNameRemoteModel>[],
  emails:
      (json['emailAddresses'] as List<dynamic>?)
          ?.map(
            (e) => PeopleEmailRemoteModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <PeopleEmailRemoteModel>[],
);

Map<String, dynamic> _$PeopleHitRemoteModelToJson(
  _PeopleHitRemoteModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'objectType': instance.objectType,
  'names': instance.names,
  'emailAddresses': instance.emails,
};
