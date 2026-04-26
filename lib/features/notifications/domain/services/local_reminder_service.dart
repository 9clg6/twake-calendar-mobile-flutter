import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/notifications/data/datasources/local_notifications_datasource.dart';

/// Schedules client-side reminders matching the VALARM trigger of an event.
///
/// The trigger is an ISO 8601 duration always expressed relative to the
/// event's DTSTART, e.g. `-PT15M` for 15 minutes before.
final class LocalReminderService {
  /// Creates a [LocalReminderService].
  const LocalReminderService({
    required LocalNotificationsDataSource notifications,
  }) : _notifications = notifications;

  final LocalNotificationsDataSource _notifications;

  /// Schedules a reminder for [event] if it carries a VALARM, returning the
  /// notification id used (so the caller can cancel it later).
  Future<int?> scheduleFor(CalendarEventEntity event) async {
    final String? trigger = event.alarm?.trigger;
    if (trigger == null) return null;
    final Duration? offset = parseIcalDuration(trigger);
    if (offset == null) return null;

    final DateTime start = DateTime.parse(event.start);
    final DateTime triggerAt = start.add(offset);
    if (triggerAt.isBefore(DateTime.now())) return null;

    final int id = event.uid.hashCode;
    await _notifications.schedule(
      id: id,
      scheduledAt: triggerAt,
      title: event.title ?? '',
      timezone: event.timezone,
      body: event.location,
    );
    return id;
  }

  /// Cancels a previously scheduled reminder for [event].
  Future<void> cancelFor(CalendarEventEntity event) =>
      _notifications.cancel(event.uid.hashCode);

  /// Schedules a reminder [leadTime] before the event start regardless of
  /// the VALARM trigger — used by demo mode and as a default when the
  /// event ships without an explicit alarm.
  Future<int?> scheduleDefaultFor(
    CalendarEventEntity event, {
    Duration leadTime = const Duration(minutes: 5),
  }) async {
    final DateTime start = DateTime.parse(event.start);
    final DateTime triggerAt = start.subtract(leadTime);
    if (triggerAt.isBefore(DateTime.now())) return null;
    final int id = event.uid.hashCode;
    await _notifications.schedule(
      id: id,
      scheduledAt: triggerAt,
      title: event.title ?? '',
      timezone: event.timezone,
      body: 'Starts in ${leadTime.inMinutes} min'
          '${event.location != null && event.location!.isNotEmpty
              ? ' · ${event.location}'
              : ''}',
    );
    return id;
  }
}

/// Parses an iCalendar duration string (RFC 5545 §3.3.6) into a [Duration].
///
/// Supports the negative offset typically used for triggers (`-PT15M`,
/// `-P1D`). Returns null on malformed input.
Duration? parseIcalDuration(String input) {
  final RegExp pattern = RegExp(
    r'^(-)?P(?:(\d+)D)?(?:T(?:(\d+)H)?(?:(\d+)M)?(?:(\d+)S)?)?$',
  );
  final RegExpMatch? match = pattern.firstMatch(input);
  if (match == null) return null;
  final bool negative = match.group(1) == '-';
  final int days = int.tryParse(match.group(2) ?? '0') ?? 0;
  final int hours = int.tryParse(match.group(3) ?? '0') ?? 0;
  final int minutes = int.tryParse(match.group(4) ?? '0') ?? 0;
  final int seconds = int.tryParse(match.group(5) ?? '0') ?? 0;
  final Duration value = Duration(
    days: days,
    hours: hours,
    minutes: minutes,
    seconds: seconds,
  );
  return negative ? -value : value;
}
