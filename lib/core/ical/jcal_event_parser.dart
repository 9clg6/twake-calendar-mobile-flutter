import 'package:twake_calendar_mobile/core/errors/ical_exception.dart';
import 'package:twake_calendar_mobile/core/ical/jcal.dart';
import 'package:twake_calendar_mobile/core/ical/jcal_params.dart';
import 'package:twake_calendar_mobile/core/ical/jcal_value_format.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/alarm.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/attendee.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/organizer.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/repetition.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/attendee_role.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/cutype.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/event_class.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/event_status.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/partstat.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/repeat_freq.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/transparency.dart';

/// Parses a jCal `vevent` component into a [CalendarEventEntity].
///
/// The parser is tolerant: it never throws on missing fields and falls back
/// to safe defaults. Only structurally invalid jCal input raises an
/// [IcalException].
final class JCalEventParser {
  /// Creates a [JCalEventParser].
  const JCalEventParser();

  /// Parses [vevent] (`['vevent', [props], [subComponents]]`) into an entity.
  ///
  /// [calId] and [url] are not present in jCal — pass them from the calling
  /// context (the data source typically tracks the URL it fetched).
  CalendarEventEntity parse(
    JCalComponent vevent, {
    required String calId,
    required String url,
  }) {
    if (vevent.isEmpty || vevent.first != 'vevent') {
      throw const IcalException('Not a vevent component');
    }
    if (vevent.length < 2 || vevent[1] is! List) {
      throw const IcalException('Malformed vevent component');
    }

    final List<dynamic> properties = vevent[1] as List<dynamic>;
    final List<dynamic> subComponents =
        vevent.length >= 3 && vevent[2] is List<dynamic>
            ? vevent[2] as List<dynamic>
            : const <dynamic>[];

    String uid = '';
    String? title;
    String? description;
    String? location;
    String start = '';
    String? end;
    String timezone = 'Etc/UTC';
    bool allday = false;
    EventClass classification = EventClass.publicClass;
    Transparency transp = Transparency.opaque;
    EventStatus? status;
    int? sequence;
    String? recurrenceId;
    String? videoConferenceUrl;
    OrganizerEntity? organizer;
    final List<AttendeeEntity> attendees = <AttendeeEntity>[];
    final List<String> exdates = <String>[];
    RepetitionEntity? repetition;
    final List<List<dynamic>> passthrough = <List<dynamic>>[];

    for (final dynamic raw in properties) {
      if (raw is! List<dynamic> || raw.length < 4) continue;
      final String key = (raw[0] as String).toLowerCase();
      final Map<String, dynamic> params = (raw[1] as Map<dynamic, dynamic>)
          .map<String, dynamic>(
        (dynamic k, dynamic v) => MapEntry<String, dynamic>(k as String, v),
      );
      final dynamic value = raw[3];

      switch (key) {
        case 'uid':
          uid = (value as String?) ?? '';
          break;
        case 'summary':
          title = value as String?;
          break;
        case 'description':
          description = value as String?;
          break;
        case 'location':
          location = value as String?;
          break;
        case 'dtstart':
          final String v = value.toString();
          start = v;
          allday = JCalValueFormat.isAllDayValue(v);
          timezone = JCalParams.tzid(params) ??
              (JCalValueFormat.isUtcValue(v) ? 'Etc/UTC' : timezone);
          break;
        case 'dtend':
          end = value.toString();
          break;
        case 'class':
          classification = EventClass.fromIcal(value as String?);
          break;
        case 'transp':
          transp = Transparency.fromIcal(value as String?);
          break;
        case 'status':
          status = EventStatus.fromIcal(value as String?);
          break;
        case 'sequence':
          sequence = value is int ? value : int.tryParse(value.toString());
          break;
        case 'recurrence-id':
          recurrenceId = value.toString();
          break;
        case 'x-openpaas-videoconference':
          videoConferenceUrl = value is String ? value : null;
          break;
        case 'organizer':
          organizer = OrganizerEntity(
            calAddress: _stripMailto(value.toString()),
            cn: (params['cn'] as String?) ?? '',
          );
          break;
        case 'attendee':
          attendees.add(
            AttendeeEntity(
              calAddress: _stripMailto(value.toString()),
              partstat: Partstat.fromIcal(params['partstat'] as String?),
              role: AttendeeRole.fromIcal(params['role'] as String?),
              cutype: CuType.fromIcal(params['cutype'] as String?),
              rsvp: (params['rsvp'] as String?)?.toUpperCase() == 'TRUE',
              cn: (params['cn'] as String?) ?? '',
            ),
          );
          break;
        case 'exdate':
          exdates.add(value.toString());
          break;
        case 'rrule':
          repetition = _parseRrule(value);
          break;
        default:
          if (!JCalConstants.knownVeventProps.contains(key)) {
            passthrough.add(raw);
          }
          break;
      }
    }

    AlarmEntity? alarm;
    for (final dynamic sub in subComponents) {
      if (sub is List<dynamic> && sub.isNotEmpty && sub.first == 'valarm') {
        alarm = _parseValarm(sub);
        break;
      }
    }

    return CalendarEventEntity(
      uid: recurrenceId != null ? '$uid/$recurrenceId' : uid,
      calId: calId,
      url: url,
      start: start,
      timezone: timezone,
      end: end,
      title: title,
      description: description,
      location: location,
      organizer: organizer,
      attendees: attendees,
      repetition: repetition,
      alarm: alarm,
      classification: classification,
      transp: transp,
      status: status,
      allday: allday,
      recurrenceId: recurrenceId,
      exdates: exdates,
      sequence: sequence,
      videoConferenceUrl: videoConferenceUrl,
      passthroughProps: passthrough,
    );
  }

  RepetitionEntity? _parseRrule(dynamic raw) {
    if (raw is! Map) return null;
    final Map<String, dynamic> data = raw.map<String, dynamic>(
      (dynamic k, dynamic v) =>
          MapEntry<String, dynamic>((k as String).toLowerCase(), v),
    );
    final RepeatFreq? freq = RepeatFreq.fromIcal(data['freq'] as String?);
    if (freq == null) return null;
    final dynamic byday = data['byday'];
    final List<String> bydayList = byday is List
        ? byday.map((dynamic e) => (e as String).toUpperCase()).toList()
        : byday is String
            ? <String>[byday.toUpperCase()]
            : const <String>[];
    return RepetitionEntity(
      freq: freq,
      interval: data['interval'] is int
          ? data['interval'] as int
          : int.tryParse(data['interval']?.toString() ?? '1') ?? 1,
      byday: bydayList,
      count: data['count'] is int
          ? data['count'] as int
          : int.tryParse(data['count']?.toString() ?? ''),
      until: data['until']?.toString(),
    );
  }

  AlarmEntity? _parseValarm(JCalComponent valarm) {
    if (valarm.length < 2 || valarm[1] is! List) return null;
    final List<dynamic> props = valarm[1] as List<dynamic>;
    String? trigger;
    String action = 'DISPLAY';
    String? description;
    for (final dynamic raw in props) {
      if (raw is! List<dynamic> || raw.length < 4) continue;
      final String key = (raw[0] as String).toLowerCase();
      final dynamic value = raw[3];
      switch (key) {
        case 'trigger':
          trigger = value.toString();
          break;
        case 'action':
          action = (value as String?) ?? 'DISPLAY';
          break;
        case 'description':
          description = value as String?;
          break;
      }
    }
    if (trigger == null) return null;
    return AlarmEntity(
      trigger: trigger,
      action: action,
      description: description,
    );
  }

  String _stripMailto(String value) =>
      value.replaceFirst(RegExp(r'^mailto:', caseSensitive: false), '');
}
