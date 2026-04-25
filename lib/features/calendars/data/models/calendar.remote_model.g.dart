// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar.remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CalDavLinkRemoteModel _$CalDavLinkRemoteModelFromJson(
  Map<String, dynamic> json,
) => _CalDavLinkRemoteModel(href: json['href'] as String?);

Map<String, dynamic> _$CalDavLinkRemoteModelToJson(
  _CalDavLinkRemoteModel instance,
) => <String, dynamic>{'href': instance.href};

_CalendarRemoteModel _$CalendarRemoteModelFromJson(Map<String, dynamic> json) =>
    _CalendarRemoteModel(
      id: json['id'] as String,
      name: json['dav:name'] as String,
      color: json['apple:color'] as String?,
      description: json['caldav:description'] as String?,
      links:
          (json['_links'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
              k,
              CalDavLinkRemoteModel.fromJson(e as Map<String, dynamic>),
            ),
          ) ??
          const <String, CalDavLinkRemoteModel>{},
    );

Map<String, dynamic> _$CalendarRemoteModelToJson(
  _CalendarRemoteModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'dav:name': instance.name,
  'apple:color': instance.color,
  'caldav:description': instance.description,
  '_links': instance.links,
};

_CalendarListEmbeddedRemoteModel _$CalendarListEmbeddedRemoteModelFromJson(
  Map<String, dynamic> json,
) => _CalendarListEmbeddedRemoteModel(
  calendars:
      (json['dav:calendar'] as List<dynamic>?)
          ?.map((e) => CalendarRemoteModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CalendarRemoteModel>[],
);

Map<String, dynamic> _$CalendarListEmbeddedRemoteModelToJson(
  _CalendarListEmbeddedRemoteModel instance,
) => <String, dynamic>{'dav:calendar': instance.calendars};

_CalendarListRemoteModel _$CalendarListRemoteModelFromJson(
  Map<String, dynamic> json,
) => _CalendarListRemoteModel(
  embedded: CalendarListEmbeddedRemoteModel.fromJson(
    json['_embedded'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$CalendarListRemoteModelToJson(
  _CalendarListRemoteModel instance,
) => <String, dynamic>{'_embedded': instance.embedded};
