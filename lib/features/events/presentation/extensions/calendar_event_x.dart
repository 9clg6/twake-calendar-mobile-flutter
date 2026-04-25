import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';

/// Presentation-only helpers on top of [CalendarEventEntity] (per
/// GUIDELINES §2.5.2: presentation logic does not belong on the domain
/// entity).
extension CalendarEventX on CalendarEventEntity {
  /// Whether the event spans more than one calendar day.
  bool get isMultiDay {
    if (end == null) return false;
    final DateTime startDt = DateTime.parse(start);
    final DateTime endDt = DateTime.parse(end!);
    return startDt.year != endDt.year ||
        startDt.month != endDt.month ||
        startDt.day != endDt.day;
  }

  /// Short single-line preview of the title (used in dense lists).
  String get shortTitle => (title ?? '').length > 60
      ? '${(title ?? '').substring(0, 60)}…'
      : (title ?? '');

  /// `HH:mm` formatting for the start time (parsed without timezone shift).
  String get startHhmm => _hhmm(DateTime.parse(start));

  /// `HH:mm` formatting for the end time, or empty when not set.
  String get endHhmm => end == null ? '' : _hhmm(DateTime.parse(end!));

  String _hhmm(DateTime d) =>
      '${d.hour.toString().padLeft(2, '0')}:'
      '${d.minute.toString().padLeft(2, '0')}';
}
