import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/features/calendar_view/presentation/controllers/month_view_controller.dart';
import 'package:twake_calendar_mobile/features/calendar_view/presentation/controllers/month_view_state.dart';
import 'package:twake_calendar_mobile/features/calendar_view/presentation/widgets/time_grid_view.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/presentation/screens/event_preview_screen.dart';

/// Week view — 7 columns starting on Monday containing the current week.
///
/// Reuses `monthViewControllerProvider` for the data (the controller
/// already loads events for `[focusedMonth - 1 month, focusedMonth + 1
/// month]`, which always covers the visible week).
class WeekViewScreen extends ConsumerWidget {
  /// Creates a [WeekViewScreen].
  const WeekViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<MonthViewState> async =
        ref.watch(monthViewControllerProvider);

    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (Object e, StackTrace _) => Center(
        child: Text(
          context.l10n.errorUnknown,
          style: context.textTheme.bodyLarge,
        ),
      ),
      data: (MonthViewState state) {
        final List<DateTime> days = _weekOf(state.selectedDay);
        return TimeGridView(
          days: days,
          eventsByDay: state.eventsByDay,
          onEventTap: (CalendarEventEntity e) => Navigator.of(context).push<void>(
            MaterialPageRoute<void>(
              builder: (_) => EventPreviewScreen(event: e),
            ),
          ),
        );
      },
    );
  }

  List<DateTime> _weekOf(DateTime day) {
    final DateTime monday =
        day.subtract(Duration(days: day.weekday - DateTime.monday));
    return List<DateTime>.generate(
      7,
      (int i) => DateTime(monday.year, monday.month, monday.day + i),
    );
  }
}
