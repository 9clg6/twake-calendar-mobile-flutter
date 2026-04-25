import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';

part 'month_view_state.freezed.dart';

/// State of the month-view screen.
@freezed
abstract class MonthViewState with _$MonthViewState {
  /// Creates a [MonthViewState].
  const factory MonthViewState({
    required DateTime focusedMonth,
    required DateTime selectedDay,
    required Map<DateTime, List<CalendarEventEntity>> eventsByDay,
  }) = _MonthViewState;

  /// Builds the initial state centered on [now].
  factory MonthViewState.initial(DateTime now) => MonthViewState(
        focusedMonth: DateTime(now.year, now.month),
        selectedDay: DateTime(now.year, now.month, now.day),
        eventsByDay: const <DateTime, List<CalendarEventEntity>>{},
      );
}
