// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchHitRemoteModel _$SearchHitRemoteModelFromJson(
  Map<String, dynamic> json,
) => _SearchHitRemoteModel(
  uid: json['uid'] as String,
  summary: json['summary'] as String?,
  start: json['start'] as String?,
  end: json['end'] as String?,
  organizer: json['organizer'] as String?,
  location: json['location'] as String?,
);

Map<String, dynamic> _$SearchHitRemoteModelToJson(
  _SearchHitRemoteModel instance,
) => <String, dynamic>{
  'uid': instance.uid,
  'summary': instance.summary,
  'start': instance.start,
  'end': instance.end,
  'organizer': instance.organizer,
  'location': instance.location,
};

_EventSearchResponseRemoteModel _$EventSearchResponseRemoteModelFromJson(
  Map<String, dynamic> json,
) => _EventSearchResponseRemoteModel(
  total: (json['total'] as num?)?.toInt() ?? 0,
  results:
      (json['results'] as List<dynamic>?)
          ?.map((e) => SearchHitRemoteModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <SearchHitRemoteModel>[],
);

Map<String, dynamic> _$EventSearchResponseRemoteModelToJson(
  _EventSearchResponseRemoteModel instance,
) => <String, dynamic>{'total': instance.total, 'results': instance.results};
