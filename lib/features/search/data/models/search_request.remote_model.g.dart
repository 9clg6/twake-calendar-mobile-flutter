// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_request.remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchCalendarRefRemoteModel _$SearchCalendarRefRemoteModelFromJson(
  Map<String, dynamic> json,
) => _SearchCalendarRefRemoteModel(
  calendarId: json['calendarId'] as String,
  userId: json['userId'] as String,
);

Map<String, dynamic> _$SearchCalendarRefRemoteModelToJson(
  _SearchCalendarRefRemoteModel instance,
) => <String, dynamic>{
  'calendarId': instance.calendarId,
  'userId': instance.userId,
};

_EventSearchRequestRemoteModel _$EventSearchRequestRemoteModelFromJson(
  Map<String, dynamic> json,
) => _EventSearchRequestRemoteModel(
  query: json['query'] as String,
  calendars:
      (json['calendars'] as List<dynamic>?)
          ?.map(
            (e) => SearchCalendarRefRemoteModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const <SearchCalendarRefRemoteModel>[],
  organizers:
      (json['organizers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  attendees:
      (json['attendees'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
);

Map<String, dynamic> _$EventSearchRequestRemoteModelToJson(
  _EventSearchRequestRemoteModel instance,
) => <String, dynamic>{
  'query': instance.query,
  'calendars': instance.calendars,
  'organizers': instance.organizers,
  'attendees': instance.attendees,
};
