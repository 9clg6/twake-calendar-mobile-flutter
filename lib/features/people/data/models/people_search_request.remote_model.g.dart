// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_search_request.remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PeopleSearchRequestRemoteModel _$PeopleSearchRequestRemoteModelFromJson(
  Map<String, dynamic> json,
) => _PeopleSearchRequestRemoteModel(
  q: json['q'] as String,
  limit: (json['limit'] as num?)?.toInt() ?? 10,
  objectTypes:
      (json['objectTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>['user', 'contact'],
);

Map<String, dynamic> _$PeopleSearchRequestRemoteModelToJson(
  _PeopleSearchRequestRemoteModel instance,
) => <String, dynamic>{
  'q': instance.q,
  'limit': instance.limit,
  'objectTypes': instance.objectTypes,
};
