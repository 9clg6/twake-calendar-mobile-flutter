import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/notifications/domain/services/local_reminder_service.dart';
import 'package:twake_calendar_mobile/features/notifications/notifications_providers.dart';

/// Holds the list of synthetic events injected from the debug bar so they
/// surface in the agenda alongside the regular feed. Demo-only.
final class DebugEventsController extends Notifier<List<CalendarEventEntity>> {
  @override
  List<CalendarEventEntity> build() => <CalendarEventEntity>[];

  /// Adds a debug event starting [start] from now, lasting 30 minutes, and
  /// schedules a local reminder 5 minutes before — so the user can verify
  /// the notification pipeline without waiting for a real event.
  Future<CalendarEventEntity> addStartingIn(Duration start) async {
    final DateTime startsAt = DateTime.now().add(start);
    final CalendarEventEntity event = CalendarEventEntity(
      uid: 'debug-${DateTime.now().microsecondsSinceEpoch}',
      calId: 'debug',
      url: '/debug/${DateTime.now().microsecondsSinceEpoch}.ics',
      start: _iso(startsAt),
      end: _iso(startsAt.add(const Duration(minutes: 30))),
      timezone: 'Europe/Paris',
      title: 'Debug event +${start.inMinutes}m',
      location: 'Triggered from the debug bar',
    );
    state = <CalendarEventEntity>[...state, event];
    await ref.read(localNotificationsInitProvider.future);
    final LocalReminderService reminders =
        ref.read(localReminderServiceProvider);
    await reminders.scheduleDefaultFor(event);
    return event;
  }

  /// Removes every debug event (and cancels their pending reminder).
  Future<void> clear() async {
    final LocalReminderService reminders =
        ref.read(localReminderServiceProvider);
    for (final CalendarEventEntity event in state) {
      await reminders.cancelFor(event);
    }
    state = <CalendarEventEntity>[];
  }

  static String _iso(DateTime d) => d.toIso8601String().split('.').first;
}

/// Provider for [DebugEventsController].
final NotifierProvider<DebugEventsController, List<CalendarEventEntity>>
    debugEventsControllerProvider =
    NotifierProvider<DebugEventsController, List<CalendarEventEntity>>(
  DebugEventsController.new,
  name: 'debugEventsControllerProvider',
);
