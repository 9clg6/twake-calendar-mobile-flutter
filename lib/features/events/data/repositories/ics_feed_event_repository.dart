import 'dart:async';

import 'package:dio/dio.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/repositories/event_repository.dart';

/// Read-only [EventRepository] that consumes a public iCalendar (.ics) feed.
///
/// Used in demo mode so the app surfaces real Linagora calendar data
/// without going through the regular CalDAV pipeline. The feed is fetched
/// once and refreshed every [refreshInterval]; mutations are no-ops.
final class IcsFeedEventRepository implements EventRepository {
  /// Creates an [IcsFeedEventRepository] pointing at [feedUrl].
  IcsFeedEventRepository({
    required this.feedUrl,
    Dio? dio,
    this.refreshInterval = const Duration(minutes: 1),
  }) : _dio = dio ?? Dio() {
    _refreshLoop();
  }

  /// Public iCalendar feed URL.
  final String feedUrl;

  /// How often to refetch the feed in the background.
  final Duration refreshInterval;

  final Dio _dio;
  Future<List<CalendarEventEntity>>? _pending;
  List<CalendarEventEntity>? _cached;
  Timer? _timer;

  void _refreshLoop() {
    _timer?.cancel();
    _timer = Timer.periodic(refreshInterval, (_) {
      _pending = _load();
    });
  }

  Future<List<CalendarEventEntity>> _load() async {
    final Response<String> response = await _dio.get<String>(
      feedUrl,
      options: Options(responseType: ResponseType.plain),
    );
    final List<CalendarEventEntity> parsed =
        IcsTextParser.parseEvents(response.data ?? '');
    _cached = parsed;
    return parsed;
  }

  Future<List<CalendarEventEntity>> _ensureLoaded() {
    if (_cached != null) return Future<List<CalendarEventEntity>>.value(_cached);
    return _pending ??= _load();
  }

  @override
  Future<List<CalendarEventEntity>> fetchEventsInRange({
    required String calendarId,
    required DateTime start,
    required DateTime end,
  }) async {
    final List<CalendarEventEntity> all = await _ensureLoaded();
    return all.where((CalendarEventEntity e) {
      final DateTime evStart = DateTime.parse(e.start);
      return evStart.isAfter(start.subtract(const Duration(days: 1))) &&
          evStart.isBefore(end.add(const Duration(days: 1)));
    }).toList();
  }

  @override
  Future<CalendarEventEntity?> fetchEvent(String url) async {
    final List<CalendarEventEntity> all = await _ensureLoaded();
    try {
      return all.firstWhere((CalendarEventEntity e) => e.url == url);
    } on StateError {
      return null;
    }
  }

  @override
  Future<void> saveEvent(CalendarEventEntity event) async {}

  @override
  Future<void> deleteEvent(String url) async {}

  @override
  Future<void> moveEvent({required String fromUrl, required String toUrl}) async {}
}

/// Minimal RFC 5545 parser — only the VEVENT properties consumed by the
/// app. The Linagora feed unfolds long lines with leading whitespace, so
/// we collapse those before splitting on key/value pairs.
abstract final class IcsTextParser {
  /// Parses [icsText] and returns the list of VEVENT components as
  /// [CalendarEventEntity] instances. Components without DTSTART are
  /// skipped — they are usually VTIMEZONE blocks.
  static List<CalendarEventEntity> parseEvents(String icsText) {
    final List<String> lines = _unfold(icsText);
    final List<CalendarEventEntity> events = <CalendarEventEntity>[];
    Map<String, String>? current;
    for (final String line in lines) {
      if (line == 'BEGIN:VEVENT') {
        current = <String, String>{};
        continue;
      }
      if (line == 'END:VEVENT') {
        if (current != null) {
          final CalendarEventEntity? event = _toEntity(current);
          if (event != null) events.add(event);
        }
        current = null;
        continue;
      }
      if (current == null) continue;
      final int colon = line.indexOf(':');
      if (colon < 0) continue;
      final String key = line.substring(0, colon);
      final String value = line.substring(colon + 1);
      current[key] = value;
    }
    return events;
  }

  static List<String> _unfold(String input) {
    final List<String> raw = input.replaceAll('\r', '').split('\n');
    final List<String> unfolded = <String>[];
    for (final String line in raw) {
      if (line.isEmpty) continue;
      if ((line.startsWith(' ') || line.startsWith('\t')) &&
          unfolded.isNotEmpty) {
        unfolded[unfolded.length - 1] =
            unfolded.last + line.substring(1);
      } else {
        unfolded.add(line);
      }
    }
    return unfolded;
  }

  static CalendarEventEntity? _toEntity(Map<String, String> props) {
    final String? uid = props['UID'];
    final String? rawStart = _findValue(props, 'DTSTART');
    final String? rawEnd = _findValue(props, 'DTEND');
    if (uid == null || rawStart == null) return null;
    final String? tzid = _findTzid(props, 'DTSTART');
    return CalendarEventEntity(
      uid: uid,
      calId: 'linagora-feed',
      url: '/feed/$uid',
      start: _toIso(rawStart),
      end: rawEnd == null ? null : _toIso(rawEnd),
      timezone: tzid ?? 'UTC',
      title: _decode(props['SUMMARY'] ?? ''),
      location: _decode(props['LOCATION']),
      description: _decode(props['DESCRIPTION']),
      allday: rawStart.length == 8,
    );
  }

  static String? _findValue(Map<String, String> props, String name) {
    for (final String key in props.keys) {
      if (key == name || key.startsWith('$name;')) return props[key];
    }
    return null;
  }

  static String? _findTzid(Map<String, String> props, String name) {
    for (final String key in props.keys) {
      if (key.startsWith('$name;')) {
        final Match? m = RegExp('TZID=([^;:]+)').firstMatch(key);
        if (m != null) return m.group(1);
      }
    }
    return null;
  }

  /// Converts an iCalendar timestamp (`YYYYMMDDTHHMMSS[Z]` or `YYYYMMDD`)
  /// into a Dart-friendly ISO 8601 string.
  static String _toIso(String value) {
    final String v = value.trim();
    if (v.length == 8) {
      return '${v.substring(0, 4)}-${v.substring(4, 6)}-${v.substring(6, 8)}';
    }
    if (v.length >= 15) {
      final String date =
          '${v.substring(0, 4)}-${v.substring(4, 6)}-${v.substring(6, 8)}';
      final String time =
          '${v.substring(9, 11)}:${v.substring(11, 13)}:${v.substring(13, 15)}';
      final String suffix = v.endsWith('Z') ? 'Z' : '';
      return '${date}T$time$suffix';
    }
    return v;
  }

  static String? _decode(String? value) {
    if (value == null) return null;
    return value
        .replaceAll(r'\,', ',')
        .replaceAll(r'\;', ';')
        .replaceAll(r'\n', '\n')
        .replaceAll(r'\\', r'\');
  }
}
