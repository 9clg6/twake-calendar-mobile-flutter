import 'package:twake_calendar_mobile/core/ical/jcal.dart';
import 'package:twake_calendar_mobile/core/ical/jcal_event_builder.dart';
import 'package:twake_calendar_mobile/core/ical/jcal_event_parser.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';

/// High-level codec for jCal payloads exchanged with esn-sabre.
///
/// Combines [JCalEventParser] (deserialize) and [JCalEventBuilder] (serialize)
/// into a single API used by the data layer.
final class JCalCodec {
  /// Creates a [JCalCodec].
  const JCalCodec({
    JCalEventParser parser = const JCalEventParser(),
    JCalEventBuilder builder = const JCalEventBuilder(),
  })  : _parser = parser,
        _builder = builder;

  final JCalEventParser _parser;
  final JCalEventBuilder _builder;

  /// Parses a `vevent` jCal component into a [CalendarEventEntity].
  CalendarEventEntity parseVevent(
    JCalComponent vevent, {
    required String calId,
    required String url,
  }) =>
      _parser.parse(vevent, calId: calId, url: url);

  /// Builds a complete `vcalendar` containing [event] (master).
  ///
  /// VTIMEZONE generation is delegated to a separate helper (not yet wired).
  JCal buildVcalendar(CalendarEventEntity event) {
    return <dynamic>[
      'vcalendar',
      <dynamic>[
        <dynamic>['version', <String, dynamic>{}, 'text', JCalConstants.version],
        <dynamic>['prodid', <String, dynamic>{}, 'text', JCalConstants.prodid],
      ],
      <dynamic>[_builder.build(event)],
    ];
  }

  /// Builds a `vcalendar` with a master event and one or more occurrence
  /// overrides (each must carry its own `recurrenceId`).
  JCal buildVcalendarWithOverrides(
    CalendarEventEntity master,
    List<CalendarEventEntity> overrides,
  ) {
    return <dynamic>[
      'vcalendar',
      <dynamic>[
        <dynamic>['version', <String, dynamic>{}, 'text', JCalConstants.version],
        <dynamic>['prodid', <String, dynamic>{}, 'text', JCalConstants.prodid],
      ],
      <dynamic>[
        _builder.build(master),
        ...overrides.map((CalendarEventEntity e) =>
            _builder.build(e, isOverride: true)),
      ],
    ];
  }
}
