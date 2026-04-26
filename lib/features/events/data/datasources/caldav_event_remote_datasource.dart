import 'dart:convert';

import 'package:twake_calendar_mobile/features/events/data/endpoints/caldav_event_endpoint.dart';
import 'package:twake_calendar_mobile/features/events/data/models/event_report.remote_model.dart';

/// CalDAV event remote data source.
abstract interface class CaldavEventRemoteDataSource {
  /// Fetches every event of [calendarId] whose DTSTART falls in
  /// `[start, end]`.
  Future<List<CalendarItemRemoteModel>> fetchEventsInRange({
    required String calendarId,
    required DateTime start,
    required DateTime end,
  });

  /// Fetches the raw jCal of a single event.
  Future<dynamic> fetchEvent(String eventPath);

  /// Creates or updates an event using its full jCal payload.
  Future<void> putEvent({
    required String eventPath,
    required List<dynamic> jcal,
  });

  /// Deletes an event.
  Future<void> deleteEvent(String eventPath);

  /// Moves an event between calendars.
  Future<void> moveEvent({
    required String fromPath,
    required String toUrl,
  });
}

/// Default implementation backed by [CaldavEventEndpoint].
final class CaldavEventRemoteDataSourceImpl
    implements CaldavEventRemoteDataSource {
  /// Creates a [CaldavEventRemoteDataSourceImpl].
  const CaldavEventRemoteDataSourceImpl({required CaldavEventEndpoint endpoint})
      : _endpoint = endpoint;

  final CaldavEventEndpoint _endpoint;

  @override
  Future<List<CalendarItemRemoteModel>> fetchEventsInRange({
    required String calendarId,
    required DateTime start,
    required DateTime end,
  }) async {
    final CalendarReportRemoteModel response = await _endpoint.reportRange(
      calendarId,
      <String, dynamic>{
        'match': <String, dynamic>{
          'start': start.toUtc().toIso8601String(),
          'end': end.toUtc().toIso8601String(),
        },
      },
    );
    return response.embedded.items;
  }

  @override
  Future<dynamic> fetchEvent(String eventPath) =>
      _endpoint.fetchEvent(eventPath);

  @override
  Future<void> putEvent({
    required String eventPath,
    required List<dynamic> jcal,
  }) async {
    await _endpoint.putEvent(eventPath, jsonEncode(jcal));
  }

  @override
  Future<void> deleteEvent(String eventPath) =>
      _endpoint.deleteEvent(eventPath);

  @override
  Future<void> moveEvent({
    required String fromPath,
    required String toUrl,
  }) =>
      _endpoint.moveEvent(fromPath, toUrl);
}
