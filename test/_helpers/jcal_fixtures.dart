/// Builders for jCal VEVENT components used across the codec tests.
///
/// Centralised so each test can override only the property it cares about
/// — keeps individual tests atomic.
library;

/// Returns a baseline jCal `vevent` matching the fields produced by the web
/// frontend. Pass `extraProps` to append custom rows.
List<dynamic> minimalVevent({
  String uid = 'event-1',
  String summary = 'Team Meeting',
  String dtstart = '2026-04-25T09:00:00',
  String dtend = '2026-04-25T10:00:00',
  String tzid = 'Europe/Paris',
  String dtType = 'date-time',
  String classification = 'PUBLIC',
  String transp = 'OPAQUE',
  List<List<dynamic>> extraProps = const <List<dynamic>>[],
  List<dynamic> subComponents = const <dynamic>[],
}) {
  return <dynamic>[
    'vevent',
    <dynamic>[
      <dynamic>['uid', <String, dynamic>{}, 'text', uid],
      <dynamic>['transp', <String, dynamic>{}, 'text', transp],
      <dynamic>[
        'dtstart',
        <String, dynamic>{'tzid': tzid},
        dtType,
        dtstart,
      ],
      <dynamic>['class', <String, dynamic>{}, 'text', classification],
      <dynamic>['summary', <String, dynamic>{}, 'text', summary],
      <dynamic>[
        'dtend',
        <String, dynamic>{'tzid': tzid},
        dtType,
        dtend,
      ],
      ...extraProps,
    ],
    subComponents,
  ];
}
