import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/features/calendar_view/presentation/controllers/month_view_controller.dart';
import 'package:twake_calendar_mobile/features/calendar_view/presentation/controllers/month_view_state.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/presentation/screens/event_preview_screen.dart';
import 'package:twake_calendar_mobile/foundation/routing/app_router.dart';

/// Calendar layout — month view at the top, agenda of the selected day below.
class MonthViewScreen extends ConsumerWidget {
  /// Creates a [MonthViewScreen].
  const MonthViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<MonthViewState> async =
        ref.watch(monthViewControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appName),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.list_outlined),
            tooltip: context.l10n.calendarPersonal,
            onPressed: () => const SidebarRoute().push<void>(context),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: context.l10n.searchTitle,
            onPressed: () => const SearchRoute().push<void>(context),
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: context.l10n.settingsTitle,
            onPressed: () => const SettingsRoute().push<void>(context),
          ),
        ],
      ),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (Object e, StackTrace _) => Center(
          child: Text(
            context.l10n.errorUnknown,
            style: context.textTheme.bodyLarge,
          ),
        ),
        data: (MonthViewState state) => _MonthViewBody(state: state),
      ),
    );
  }
}

class _MonthViewBody extends ConsumerWidget {
  const _MonthViewBody({required this.state});

  final MonthViewState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<CalendarEventEntity> dayEvents =
        state.eventsByDay[_normalize(state.selectedDay)] ??
            const <CalendarEventEntity>[];

    return Column(
      children: <Widget>[
        TableCalendar<CalendarEventEntity>(
          firstDay: DateTime.utc(2020),
          lastDay: DateTime.utc(2035, 12, 31),
          focusedDay: state.focusedMonth,
          selectedDayPredicate: (DateTime day) =>
              isSameDay(day, state.selectedDay),
          eventLoader: (DateTime day) =>
              state.eventsByDay[_normalize(day)] ??
              const <CalendarEventEntity>[],
          calendarFormat: CalendarFormat.month,
          startingDayOfWeek: StartingDayOfWeek.monday,
          headerStyle: const HeaderStyle(formatButtonVisible: false),
          onDaySelected: (DateTime selected, DateTime focused) =>
              ref
                  .read(monthViewControllerProvider.notifier)
                  .selectDay(selected),
          onPageChanged: (DateTime focused) => ref
              .read(monthViewControllerProvider.notifier)
              .focusMonth(focused),
        ),
        const Divider(),
        Expanded(
          child: dayEvents.isEmpty
              ? Center(
                  child: Text(
                    context.l10n.searchEmpty,
                    style: context.textTheme.bodyLarge,
                  ),
                )
              : ListView.separated(
                  itemCount: dayEvents.length,
                  separatorBuilder: (BuildContext _, int _) => const Gap(4),
                  itemBuilder: (BuildContext c, int i) {
                    final CalendarEventEntity event = dayEvents[i];
                    return ListTile(
                      title: Text(event.title ?? ''),
                      subtitle: Text(_formatRange(event)),
                      onTap: () => Navigator.of(c).push<void>(
                        MaterialPageRoute<void>(
                          builder: (_) =>
                              EventPreviewScreen(event: event),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  DateTime _normalize(DateTime d) => DateTime(d.year, d.month, d.day);

  String _formatRange(CalendarEventEntity e) {
    final DateTime start = DateTime.parse(e.start);
    if (e.end == null) return _hhmm(start);
    final DateTime end = DateTime.parse(e.end!);
    return '${_hhmm(start)} – ${_hhmm(end)}';
  }

  String _hhmm(DateTime d) =>
      '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';
}
