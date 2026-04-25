import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/features/calendar_view/domain/enums/calendar_view_kind.dart';
import 'package:twake_calendar_mobile/features/calendar_view/presentation/controllers/month_view_controller.dart';
import 'package:twake_calendar_mobile/features/calendar_view/presentation/controllers/month_view_state.dart';
import 'package:twake_calendar_mobile/features/calendar_view/presentation/controllers/view_kind_controller.dart';
import 'package:twake_calendar_mobile/features/calendar_view/presentation/screens/day_view_screen.dart';
import 'package:twake_calendar_mobile/features/calendar_view/presentation/screens/week_view_screen.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/presentation/screens/event_preview_screen.dart';
import 'package:twake_calendar_mobile/features/sync/sync_providers.dart';
import 'package:twake_calendar_mobile/foundation/routing/app_router.dart';

/// Top-level calendar layout. Switches between month/week/day views based
/// on [viewKindControllerProvider]. Hosts the shared AppBar (search,
/// sidebar, settings, conflicts badge) and the create-event FAB.
class CalendarLayoutScreen extends ConsumerWidget {
  /// Creates a [CalendarLayoutScreen].
  const CalendarLayoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CalendarViewKind kind = ref.watch(viewKindControllerProvider);

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
          _ConflictsBadge(),
          PopupMenuButton<CalendarViewKind>(
            tooltip: context.l10n.viewMonth,
            initialValue: kind,
            onSelected: ref
                .read(viewKindControllerProvider.notifier)
                .switchTo,
            icon: Icon(switch (kind) {
              CalendarViewKind.month => Icons.calendar_view_month,
              CalendarViewKind.week => Icons.calendar_view_week,
              CalendarViewKind.day => Icons.calendar_view_day,
            }),
            itemBuilder: (BuildContext c) => <PopupMenuEntry<CalendarViewKind>>[
              PopupMenuItem<CalendarViewKind>(
                value: CalendarViewKind.month,
                child: Text(c.l10n.viewMonth),
              ),
              PopupMenuItem<CalendarViewKind>(
                value: CalendarViewKind.week,
                child: Text(c.l10n.viewWeek),
              ),
              PopupMenuItem<CalendarViewKind>(
                value: CalendarViewKind.day,
                child: Text(c.l10n.viewDay),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: context.l10n.settingsTitle,
            onPressed: () => const SettingsRoute().push<void>(context),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => const EventCreateRoute().push<void>(context),
        icon: const Icon(Icons.add),
        label: Text(context.l10n.eventCreate),
      ),
      body: switch (kind) {
        CalendarViewKind.month => const MonthViewBody(),
        CalendarViewKind.week => const WeekViewScreen(),
        CalendarViewKind.day => const DayViewScreen(),
      },
    );
  }
}

/// Month view body — the existing TableCalendar + agenda combo extracted
/// from the previous MonthViewScreen.
class MonthViewBody extends ConsumerWidget {
  /// Creates a [MonthViewBody].
  const MonthViewBody({super.key});

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
      data: (MonthViewState state) => _MonthBody(state: state),
    );
  }
}

class _MonthBody extends ConsumerWidget {
  const _MonthBody({required this.state});
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
                          builder: (_) => EventPreviewScreen(event: event),
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
      '${d.hour.toString().padLeft(2, '0')}:'
      '${d.minute.toString().padLeft(2, '0')}';
}

class _ConflictsBadge extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int count = ref.watch(conflictCountProvider).valueOrNull ?? 0;
    if (count == 0) return const SizedBox.shrink();
    return IconButton(
      tooltip: context.l10n.syncConflictsTitle,
      onPressed: () => const ConflictsRoute().push<void>(context),
      icon: Badge(
        label: Text('$count'),
        child: const Icon(Icons.sync_problem),
      ),
    );
  }
}
