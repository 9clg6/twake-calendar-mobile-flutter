import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/entities/calendar.dart';

part 'sidebar_state.freezed.dart';

/// Immutable state of the calendars sidebar.
@freezed
abstract class SidebarState with _$SidebarState {
  /// Creates a [SidebarState].
  const factory SidebarState({
    required List<CalendarEntity> myCalendars,
    required List<CalendarEntity> sharedCalendars,
    required List<CalendarEntity> delegatedCalendars,
    required Set<String> selectedCalendarIds,
  }) = _SidebarState;

  /// Empty initial state.
  factory SidebarState.initial() => const SidebarState(
        myCalendars: <CalendarEntity>[],
        sharedCalendars: <CalendarEntity>[],
        delegatedCalendars: <CalendarEntity>[],
        selectedCalendarIds: <String>{},
      );
}
