import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/interfaces/result_state.dart';
import 'package:twake_calendar_mobile/features/calendar_view/presentation/controllers/month_view_state.dart';
import 'package:twake_calendar_mobile/features/calendars/calendars_providers.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/entities/calendar.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/usecases/get_calendars_usecase.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/usecases/get_events_in_range_usecase.dart';
import 'package:twake_calendar_mobile/features/events/events_providers.dart';
import 'package:twake_calendar_mobile/features/events/presentation/controllers/debug_events_controller.dart';
import 'package:twake_calendar_mobile/features/notifications/domain/services/local_reminder_service.dart';
import 'package:twake_calendar_mobile/features/notifications/notifications_providers.dart';

/// Controller of the month view.
///
/// Loads the calendars and the events for the focused month, then groups
/// them by day for easy rendering with `table_calendar`.
final class MonthViewController extends AsyncNotifier<MonthViewState> {
  late GetCalendarsUseCase _getCalendarsUseCase;
  late GetEventsInRangeUseCase _getEventsUseCase;

  @override
  Future<MonthViewState> build() async {
    _getCalendarsUseCase = ref.watch(getCalendarsUseCaseProvider);
    _getEventsUseCase = ref.watch(getEventsInRangeUseCaseProvider);
    // Re-render when the debug bar injects or clears events.
    ref.watch(debugEventsControllerProvider);
    return _loadForMonth(state.valueOrNull?.focusedMonth ?? DateTime.now());
  }

  /// Switches the focused month and refreshes events.
  Future<void> focusMonth(DateTime month) async {
    state = const AsyncLoading<MonthViewState>();
    state =
        await AsyncValue.guard<MonthViewState>(() => _loadForMonth(month));
  }

  /// Updates the selected day without re-fetching.
  void selectDay(DateTime day) {
    final MonthViewState? current = state.valueOrNull;
    if (current == null) return;
    state = AsyncData<MonthViewState>(current.copyWith(selectedDay: day));
  }

  Future<MonthViewState> _loadForMonth(DateTime any) async {
    final DateTime now = DateTime.now();
    final DateTime focused = DateTime(any.year, any.month);
    final DateTime start = DateTime(focused.year, focused.month - 1, 25);
    final DateTime end = DateTime(focused.year, focused.month + 1, 7);

    final ResultState<List<CalendarEntity>> calendarsResult =
        await _getCalendarsUseCase.execute();
    final List<CalendarEntity> calendars = calendarsResult.when<List<CalendarEntity>>(
      success: (List<CalendarEntity> data) => data,
      failure: (Exception e) => throw e,
    );

    final List<CalendarEventEntity> events = <CalendarEventEntity>[];
    for (final CalendarEntity c in calendars) {
      final ResultState<List<CalendarEventEntity>> eventsResult =
          await _getEventsUseCase.execute(
        GetEventsInRangeParams(
          calendarId: c.id,
          start: start,
          end: end,
        ),
      );
      eventsResult.when<void>(
        success: events.addAll,
        failure: (Exception e) => throw e,
      );
    }

    // Merge synthetic events injected from the debug bar so they surface
    // in the agenda exactly like real ones.
    events.addAll(ref.read(debugEventsControllerProvider));

    final Map<DateTime, List<CalendarEventEntity>> byDay =
        <DateTime, List<CalendarEventEntity>>{};
    for (final CalendarEventEntity event in events) {
      final DateTime startDate = DateTime.parse(event.start);
      final DateTime key =
          DateTime(startDate.year, startDate.month, startDate.day);
      byDay.putIfAbsent(key, () => <CalendarEventEntity>[]).add(event);
    }

    // Schedule a local reminder 5 minutes before each upcoming event.
    final LocalReminderService reminders =
        ref.read(localReminderServiceProvider);
    await ref.read(localNotificationsInitProvider.future);
    for (final CalendarEventEntity event in events) {
      final DateTime startTime = DateTime.parse(event.start);
      if (startTime.isAfter(now)) {
        await reminders.scheduleDefaultFor(event);
      }
    }

    return MonthViewState(
      focusedMonth: focused,
      selectedDay: state.valueOrNull?.selectedDay ?? DateTime(any.year, any.month, any.day),
      eventsByDay: byDay,
    );
  }
}

/// Provider for [MonthViewController].
final AsyncNotifierProvider<MonthViewController, MonthViewState>
    monthViewControllerProvider =
    AsyncNotifierProvider<MonthViewController, MonthViewState>(
  MonthViewController.new,
  name: 'monthViewControllerProvider',
);
