import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/interfaces/result_state.dart';
import 'package:twake_calendar_mobile/features/calendars/calendars_providers.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/entities/calendar.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/usecases/get_calendars_usecase.dart';
import 'package:twake_calendar_mobile/features/calendars/presentation/controllers/sidebar_state.dart';

/// Controller of the calendars sidebar.
///
/// Loads the calendars on first build, partitions them into mine/shared/
/// delegated buckets, and exposes a toggle action to drive the selected ids.
final class SidebarController extends AsyncNotifier<SidebarState> {
  late GetCalendarsUseCase _getCalendarsUseCase;

  @override
  Future<SidebarState> build() async {
    _getCalendarsUseCase = ref.watch(getCalendarsUseCaseProvider);
    return _fetch();
  }

  Future<SidebarState> _fetch() async {
    final ResultState<List<CalendarEntity>> result =
        await _getCalendarsUseCase.execute();
    return result.when(
      success: (List<CalendarEntity> calendars) {
        final List<CalendarEntity> mine = <CalendarEntity>[];
        final List<CalendarEntity> shared = <CalendarEntity>[];
        final List<CalendarEntity> delegated = <CalendarEntity>[];
        for (final CalendarEntity c in calendars) {
          if (c.delegated) {
            delegated.add(c);
          } else if (c.invite.isNotEmpty || c.owner.openpaasId != 'me') {
            shared.add(c);
          } else {
            mine.add(c);
          }
        }
        return SidebarState(
          myCalendars: mine,
          sharedCalendars: shared,
          delegatedCalendars: delegated,
          selectedCalendarIds: calendars.map((CalendarEntity c) => c.id).toSet(),
        );
      },
      failure: (Exception e) => throw e,
    );
  }

  /// Refreshes the calendars list.
  Future<void> refresh() async {
    state = const AsyncLoading<SidebarState>();
    state = await AsyncValue.guard<SidebarState>(_fetch);
  }

  /// Toggles selection of [calendarId].
  void toggleSelection(String calendarId) {
    final SidebarState? current = state.valueOrNull;
    if (current == null) return;
    final Set<String> next = <String>{...current.selectedCalendarIds};
    if (next.contains(calendarId)) {
      next.remove(calendarId);
    } else {
      next.add(calendarId);
    }
    state = AsyncData<SidebarState>(
      current.copyWith(selectedCalendarIds: next),
    );
  }
}

/// Provider for [SidebarController].
final AsyncNotifierProvider<SidebarController, SidebarState>
    sidebarControllerProvider =
    AsyncNotifierProvider<SidebarController, SidebarState>(
  SidebarController.new,
  name: 'sidebarControllerProvider',
);
