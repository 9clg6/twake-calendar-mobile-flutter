import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/features/calendar_view/presentation/controllers/month_view_controller.dart';
import 'package:twake_calendar_mobile/features/calendar_view/presentation/controllers/month_view_state.dart';
import 'package:twake_calendar_mobile/features/calendar_view/presentation/widgets/time_grid_view.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/presentation/screens/event_preview_screen.dart';

/// Day view — single column showing the selected day.
class DayViewScreen extends ConsumerWidget {
  /// Creates a [DayViewScreen].
  const DayViewScreen({super.key});

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
      data: (MonthViewState state) => TimeGridView(
        days: <DateTime>[
          DateTime(
            state.selectedDay.year,
            state.selectedDay.month,
            state.selectedDay.day,
          ),
        ],
        eventsByDay: state.eventsByDay,
        onEventTap: (CalendarEventEntity e) => Navigator.of(context).push<void>(
          MaterialPageRoute<void>(
            builder: (_) => EventPreviewScreen(event: e),
          ),
        ),
      ),
    );
  }
}
