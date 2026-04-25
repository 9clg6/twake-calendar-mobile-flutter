import 'package:twake_calendar_mobile/core/ical/jcal.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/alarm.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/attendee.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/repetition.dart';

/// Serializes a [CalendarEventEntity] into a jCal `vevent` component.
///
/// Output shape matches the format produced by `ical.js` on the web frontend
/// (`makeVevent.ts`), so the backend treats both clients identically.
final class JCalEventBuilder {
  /// Creates a [JCalEventBuilder].
  const JCalEventBuilder();

  /// Builds the jCal `vevent` component for [event].
  ///
  /// When [isOverride] is true, a `recurrence-id` property is emitted and the
  /// `uid` is split from the suffix produced by the parser.
  JCalComponent build(CalendarEventEntity event, {bool isOverride = false}) {
    final String tzid = event.timezone;
    final List<dynamic> properties = <dynamic>[];

    final String pureUid = event.uid.contains('/')
        ? event.uid.substring(0, event.uid.indexOf('/'))
        : event.uid;
    properties.add(<dynamic>['uid', <String, dynamic>{}, 'text', pureUid]);
    properties.add(<dynamic>[
      'transp',
      <String, dynamic>{},
      'text',
      event.transp.icalValue,
    ]);

    final String dtType = event.allday ? 'date' : 'date-time';
    properties.add(<dynamic>[
      'dtstart',
      <String, dynamic>{'tzid': tzid},
      dtType,
      event.start,
    ]);
    properties.add(<dynamic>[
      'class',
      <String, dynamic>{},
      'text',
      event.classification.icalValue,
    ]);
    properties.add(<dynamic>[
      'sequence',
      <String, dynamic>{},
      'integer',
      event.sequence ?? 1,
    ]);
    properties.add(<dynamic>[
      'x-openpaas-videoconference',
      <String, dynamic>{},
      'unknown',
      event.videoConferenceUrl,
    ]);
    properties.add(<dynamic>[
      'summary',
      <String, dynamic>{},
      'text',
      event.title ?? '',
    ]);

    if (event.end != null) {
      properties.add(<dynamic>[
        'dtend',
        <String, dynamic>{'tzid': tzid},
        dtType,
        event.end,
      ]);
    }
    if (event.location != null && event.location!.isNotEmpty) {
      properties.add(<dynamic>[
        'location',
        <String, dynamic>{},
        'text',
        event.location,
      ]);
    }
    if (event.organizer != null) {
      properties.add(<dynamic>[
        'organizer',
        <String, dynamic>{
          if (event.organizer!.cn.isNotEmpty) 'cn': event.organizer!.cn,
        },
        'cal-address',
        'mailto:${event.organizer!.calAddress}',
      ]);
    }
    if (event.description != null && event.description!.isNotEmpty) {
      properties.add(<dynamic>[
        'description',
        <String, dynamic>{},
        'text',
        event.description,
      ]);
    }
    if (isOverride && event.recurrenceId != null) {
      properties.add(<dynamic>[
        'recurrence-id',
        <String, dynamic>{},
        'date-time',
        event.recurrenceId,
      ]);
    }
    if (event.repetition != null) {
      properties.add(<dynamic>[
        'rrule',
        <String, dynamic>{},
        'recur',
        _rruleMap(event.repetition!),
      ]);
    }
    for (final AttendeeEntity a in event.attendees) {
      properties.add(<dynamic>[
        'attendee',
        <String, dynamic>{
          if (a.cn.isNotEmpty) 'cn': a.cn,
          'partstat': a.partstat.icalValue,
          'rsvp': a.rsvp ? 'TRUE' : 'FALSE',
          'role': a.role.icalValue,
          'cutype': a.cutype.icalValue,
        },
        'cal-address',
        'mailto:${a.calAddress}',
      ]);
    }
    for (final String ex in event.exdates) {
      properties.add(<dynamic>[
        'exdate',
        <String, dynamic>{'tzid': tzid},
        dtType,
        ex,
      ]);
    }

    // Re-emit unknown props captured at parse time.
    for (final List<dynamic> raw in event.passthroughProps) {
      final String key = (raw[0] as String).toLowerCase();
      final bool alreadyEmitted = properties.any((dynamic p) =>
          p is List && p.isNotEmpty && (p[0] as String).toLowerCase() == key);
      if (!alreadyEmitted) {
        properties.add(raw);
      }
    }

    final List<dynamic> subComponents = <dynamic>[];
    if (event.alarm != null) {
      subComponents.add(_buildValarm(event.alarm!));
    }

    return <dynamic>['vevent', properties, subComponents];
  }

  Map<String, dynamic> _rruleMap(RepetitionEntity r) {
    return <String, dynamic>{
      'freq': r.freq.icalValue,
      if (r.interval > 1) 'interval': r.interval,
      if (r.byday.isNotEmpty) 'byday': r.byday,
      if (r.count != null) 'count': r.count,
      if (r.until != null) 'until': r.until,
    };
  }

  JCalComponent _buildValarm(AlarmEntity alarm) {
    return <dynamic>[
      'valarm',
      <dynamic>[
        <dynamic>['trigger', <String, dynamic>{}, 'duration', alarm.trigger],
        <dynamic>['action', <String, dynamic>{}, 'text', alarm.action],
        if (alarm.description != null)
          <dynamic>[
            'description',
            <String, dynamic>{},
            'text',
            alarm.description,
          ],
      ],
      <dynamic>[],
    ];
  }
}
