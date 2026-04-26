import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/attendee.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/presentation/extensions/calendar_event_x.dart';

/// Renders the ICS (RFC 5545) representation of an event in a collapsed
/// section with a copy-to-clipboard action — mirrors the "View source"
/// affordance from the web frontend.
class IcsSourceView extends StatelessWidget {
  /// Creates an [IcsSourceView].
  const IcsSourceView({required this.event, super.key});

  /// Event whose ICS payload should be rendered.
  final CalendarEventEntity event;

  @override
  Widget build(BuildContext context) {
    final String ics = _buildIcs(event);
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      shape: const Border(),
      collapsedShape: const Border(),
      title: Text(
        'ICS source',
        style: context.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      childrenPadding: const EdgeInsets.symmetric(vertical: 8),
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F8FA),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: context.colorScheme.outline),
          ),
          child: SelectableText(
            ics,
            style: const TextStyle(
              fontFamily: 'Courier',
              fontSize: 12,
              height: 1.4,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            icon: const Icon(Icons.copy_outlined, size: 16),
            label: const Text('Copy'),
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: ics));
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('ICS copied')),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// Builds an RFC 5545 iCalendar text dump of [event]. Stays read-only —
/// the canonical serialization for outgoing PUTs lives in
/// [JCalEventBuilder].
String _buildIcs(CalendarEventEntity event) {
  final StringBuffer b = StringBuffer()
    ..writeln('BEGIN:VCALENDAR')
    ..writeln('VERSION:2.0')
    ..writeln('PRODID:-//Twake Calendar Mobile//EN')
    ..writeln('BEGIN:VEVENT')
    ..writeln('UID:${event.uid}')
    ..writeln('DTSTAMP:${_dtstamp()}')
    ..writeln('SUMMARY:${_escape(event.shortTitle)}')
    ..writeln(_dt('DTSTART', event.start, event.allday, event.timezone));
  if (event.end != null && event.end!.isNotEmpty) {
    b.writeln(_dt('DTEND', event.end!, event.allday, event.timezone));
  }
  if (event.location != null && event.location!.isNotEmpty) {
    b.writeln('LOCATION:${_escape(event.location!)}');
  }
  if (event.description != null && event.description!.isNotEmpty) {
    b.writeln('DESCRIPTION:${_escape(event.description!)}');
  }
  if (event.classification.name != 'publicClass') {
    b.writeln('CLASS:${event.classification.name.toUpperCase()}');
  }
  if (event.organizer != null) {
    b.writeln(
      'ORGANIZER;CN=${_escape(event.organizer!.cn)}'
      ':${event.organizer!.calAddress}',
    );
  }
  for (final AttendeeEntity a in event.attendees) {
    b.writeln(
      'ATTENDEE;CN=${_escape(a.cn)};'
      'PARTSTAT=${a.partstat.name.toUpperCase()};'
      'ROLE=${a.role.name.toUpperCase()}'
      ':mailto:${a.calAddress.replaceFirst('mailto:', '')}',
    );
  }
  if (event.repetition != null) {
    final List<String> parts = <String>[
      'FREQ=${event.repetition!.freq.name.toUpperCase()}',
      'INTERVAL=${event.repetition!.interval}',
      if (event.repetition!.count != null)
        'COUNT=${event.repetition!.count}',
      if (event.repetition!.until != null)
        'UNTIL=${event.repetition!.until}',
      if (event.repetition!.byday.isNotEmpty)
        'BYDAY=${event.repetition!.byday.join(',')}',
    ];
    b.writeln('RRULE:${parts.join(';')}');
  }
  if (event.alarm != null) {
    b
      ..writeln('BEGIN:VALARM')
      ..writeln('ACTION:DISPLAY')
      ..writeln('TRIGGER:${event.alarm!.trigger}')
      ..writeln('END:VALARM');
  }
  b
    ..writeln('END:VEVENT')
    ..write('END:VCALENDAR');
  return b.toString();
}

String _escape(String value) =>
    value.replaceAll('\\', r'\\').replaceAll(',', r'\,').replaceAll('\n', r'\n');

String _dtstamp() {
  final DateTime now = DateTime.now().toUtc();
  return '${_pad4(now.year)}${_pad2(now.month)}${_pad2(now.day)}T'
      '${_pad2(now.hour)}${_pad2(now.minute)}${_pad2(now.second)}Z';
}

String _dt(String name, String iso, bool allday, String tzid) {
  if (allday) return '$name;VALUE=DATE:${iso.split('T').first.replaceAll('-', '')}';
  final String compact = iso
      .replaceAll('-', '')
      .replaceAll(':', '')
      .split('.')
      .first;
  return '$name;TZID=$tzid:$compact';
}

String _pad2(int n) => n.toString().padLeft(2, '0');
String _pad4(int n) => n.toString().padLeft(4, '0');
