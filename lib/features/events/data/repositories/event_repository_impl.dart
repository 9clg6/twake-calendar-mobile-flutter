import 'package:twake_calendar_mobile/core/ical/jcal_codec.dart';
import 'package:twake_calendar_mobile/core/logging/log.dart';
import 'package:twake_calendar_mobile/features/events/data/datasources/caldav_event_remote_datasource.dart';
import 'package:twake_calendar_mobile/features/events/data/models/event_report.remote_model.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/repositories/event_repository.dart';

/// CalDAV-backed [EventRepository].
///
/// Reads run a REPORT against the calendar collection. Each `dav:item`
/// contains a full jCal (`vcalendar` -> `vevent` master + optional
/// recurrence overrides). The first `vevent` is mapped to the entity; the
/// `passthroughProps` mechanism preserves any property the client doesn't
/// model so that round-tripping back to the server is lossless.
final class EventRepositoryImpl implements EventRepository {
  /// Creates an [EventRepositoryImpl].
  const EventRepositoryImpl({
    required CaldavEventRemoteDataSource remoteDataSource,
    required JCalCodec jcalCodec,
  })  : _remoteDataSource = remoteDataSource,
        _jcalCodec = jcalCodec;

  final CaldavEventRemoteDataSource _remoteDataSource;
  final JCalCodec _jcalCodec;

  @override
  Future<List<CalendarEventEntity>> fetchEventsInRange({
    required String calendarId,
    required DateTime start,
    required DateTime end,
  }) async {
    final List<CalendarItemRemoteModel> items =
        await _remoteDataSource.fetchEventsInRange(
      calendarId: calendarId,
      start: start,
      end: end,
    );
    final Log log = Log.named('EventRepositoryImpl');
    final List<CalendarEventEntity> events = <CalendarEventEntity>[];
    for (final CalendarItemRemoteModel item in items) {
      final List<dynamic> data = item.data;
      if (data.length < 3 || data[2] is! List<dynamic>) continue;
      final List<dynamic> components = data[2] as List<dynamic>;
      for (final dynamic component in components) {
        if (component is! List<dynamic>) continue;
        if (component.isEmpty || component.first != 'vevent') continue;
        try {
          events.add(
            _jcalCodec.parseVevent(
              component,
              calId: calendarId,
              url: '/calendars/$calendarId.json',
            ),
          );
        } on Exception catch (e, st) {
          log.warning('Skipping malformed VEVENT', e, st);
        }
      }
    }
    return events;
  }

  @override
  Future<CalendarEventEntity?> fetchEvent(String url) async {
    final dynamic raw = await _remoteDataSource.fetchEvent(url);
    if (raw is! List<dynamic> || raw.length < 3) return null;
    final List<dynamic> components = raw[2] as List<dynamic>;
    for (final dynamic component in components) {
      if (component is List<dynamic> &&
          component.isNotEmpty &&
          component.first == 'vevent') {
        return _jcalCodec.parseVevent(
          component,
          calId: '',
          url: url,
        );
      }
    }
    return null;
  }
}
