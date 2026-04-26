import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/core/theme/color_tokens.dart';
import 'package:twake_calendar_mobile/features/calendar_view/domain/enums/calendar_view_kind.dart';
import 'package:twake_calendar_mobile/features/calendar_view/presentation/controllers/month_view_controller.dart';
import 'package:twake_calendar_mobile/features/calendar_view/presentation/controllers/month_view_state.dart';
import 'package:twake_calendar_mobile/features/calendar_view/presentation/controllers/view_kind_controller.dart';
import 'package:twake_calendar_mobile/features/calendar_view/presentation/screens/day_view_screen.dart';
import 'package:twake_calendar_mobile/features/calendar_view/presentation/screens/week_view_screen.dart';
import 'package:twake_calendar_mobile/features/events/presentation/controllers/debug_events_controller.dart';
import 'package:twake_calendar_mobile/foundation/app/demo_mode.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/presentation/screens/event_preview_screen.dart';
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kDemoMode ? 168 : 120),
        child: _CalendarHeader(kind: kind),
      ),
      floatingActionButton: SizedBox(
        width: 64,
        height: 64,
        child: FloatingActionButton(
          onPressed: () => const EventCreateRoute().push<void>(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.add, size: 32),
        ),
      ),
      body: switch (kind) {
        CalendarViewKind.month => const MonthViewBody(),
        CalendarViewKind.week => const WeekViewScreen(),
        CalendarViewKind.day => const DayViewScreen(),
      },
    );
  }
}

/// Two-row header — brand strip (logo + help/apps/avatar) over the
/// date-nav strip (hamburger / prev / today / next / month-label / search /
/// refresh / settings) — mirrors the web mobile layout.
class _CalendarHeader extends ConsumerWidget {
  const _CalendarHeader({required this.kind});

  final CalendarViewKind kind;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MonthViewState? state =
        ref.watch(monthViewControllerProvider).valueOrNull;
    final DateTime focused = state?.focusedMonth ?? DateTime.now();
    final DateTime selected = state?.selectedDay ?? DateTime.now();
    final MonthViewController controller =
        ref.read(monthViewControllerProvider.notifier);
    void shiftBack() {
      switch (kind) {
        case CalendarViewKind.day:
          controller.selectDay(selected.subtract(const Duration(days: 1)));
        case CalendarViewKind.week:
          controller.selectDay(selected.subtract(const Duration(days: 7)));
        case CalendarViewKind.month:
          controller.focusMonth(_shift(focused, -1));
      }
    }

    void shiftForward() {
      switch (kind) {
        case CalendarViewKind.day:
          controller.selectDay(selected.add(const Duration(days: 1)));
        case CalendarViewKind.week:
          controller.selectDay(selected.add(const Duration(days: 7)));
        case CalendarViewKind.month:
          controller.focusMonth(_shift(focused, 1));
      }
    }

    void goToToday() {
      final DateTime now = DateTime.now();
      controller.focusMonth(now);
      controller.selectDay(now);
    }

    final String labelText = switch (kind) {
      CalendarViewKind.month => _formatMonth(context, focused),
      CalendarViewKind.week => _formatWeek(context, selected),
      CalendarViewKind.day => _formatDay(context, selected),
    };
    return SafeArea(
      bottom: false,
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          border: Border(
            bottom: BorderSide(
              color: context.colorScheme.outline,
              width: 1,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Row 1 — brand + settings + avatar.
            SizedBox(
              height: 56,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: <Widget>[
                    const _TwakeLogo(),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.settings_outlined),
                      tooltip: context.l10n.settingsTitle,
                      onPressed: () =>
                          const SettingsRoute().push<void>(context),
                    ),
                    const CircleAvatar(
                      radius: 16,
                      backgroundColor: ColorTokens.divider,
                      child: Icon(Icons.person_outline, size: 18),
                    ),
                  ],
                ),
              ),
            ),
            // Row 2 — debug bar (demo mode only) — exercise the local
            // notification pipeline by spawning an event 6 minutes ahead.
            if (kDemoMode) const _DebugBar(),
            // Row 3 — hamburger / nav / month label / actions.
            SizedBox(
              height: 56,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.menu),
                      tooltip: context.l10n.calendarPersonal,
                      onPressed: () =>
                          const SidebarRoute().push<void>(context),
                    ),
                    IconButton(
                      icon: const Icon(Icons.chevron_left),
                      visualDensity: VisualDensity.compact,
                      onPressed: shiftBack,
                    ),
                    IconButton(
                      icon: const Icon(Icons.calendar_today_outlined),
                      visualDensity: VisualDensity.compact,
                      tooltip: 'Today',
                      onPressed: goToToday,
                    ),
                    IconButton(
                      icon: const Icon(Icons.chevron_right),
                      visualDensity: VisualDensity.compact,
                      onPressed: shiftForward,
                    ),
                    Expanded(
                      child: Text(
                        labelText,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: ColorTokens.textTertiary,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.search),
                      visualDensity: VisualDensity.compact,
                      tooltip: context.l10n.searchTitle,
                      onPressed: () =>
                          const SearchRoute().push<void>(context),
                    ),
                    PopupMenuButton<CalendarViewKind>(
                      tooltip: context.l10n.viewMonth,
                      initialValue: kind,
                      onSelected: ref
                          .read(viewKindControllerProvider.notifier)
                          .switchTo,
                      padding: EdgeInsets.zero,
                      iconSize: 22,
                      icon: Icon(switch (kind) {
                        CalendarViewKind.month => Icons.calendar_view_month,
                        CalendarViewKind.week => Icons.calendar_view_week,
                        CalendarViewKind.day => Icons.calendar_view_day,
                      }),
                      itemBuilder: (BuildContext c) =>
                          <PopupMenuEntry<CalendarViewKind>>[
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static DateTime _shift(DateTime d, int months) {
    final int year = d.year + (d.month - 1 + months) ~/ 12;
    final int month = (d.month - 1 + months) % 12 + 1;
    return DateTime(year, month, 1);
  }

  static String _formatMonth(BuildContext context, DateTime d) {
    const List<String> en = <String>[
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    const List<String> fr = <String>[
      'Janvier',
      'Février',
      'Mars',
      'Avril',
      'Mai',
      'Juin',
      'Juillet',
      'Août',
      'Septembre',
      'Octobre',
      'Novembre',
      'Décembre',
    ];
    final bool isFr = Localizations.localeOf(context).languageCode == 'fr';
    final List<String> names = isFr ? fr : en;
    return '${names[d.month - 1]} ${d.year}';
  }

  /// "27 avril 2026" / "April 27, 2026" — Day-view label.
  static String _formatDay(BuildContext context, DateTime d) {
    final bool isFr = Localizations.localeOf(context).languageCode == 'fr';
    final String month = _monthName(context, d, full: !isFr);
    return isFr
        ? '${d.day} $month ${d.year}'
        : '$month ${d.day}, ${d.year}';
  }

  /// "1 – 7 avril 2026" / "April 1 – 7, 2026" — Week-view label.
  /// Spans across months ("28 avril – 4 mai 2026") when the week
  /// straddles a month boundary.
  static String _formatWeek(BuildContext context, DateTime d) {
    final DateTime monday =
        d.subtract(Duration(days: d.weekday - DateTime.monday));
    final DateTime sunday = monday.add(const Duration(days: 6));
    final bool isFr = Localizations.localeOf(context).languageCode == 'fr';
    final String mMonth = _monthName(context, monday, full: false);
    final String sMonth = _monthName(context, sunday, full: false);
    if (monday.month == sunday.month) {
      return isFr
          ? '${monday.day} – ${sunday.day} $sMonth ${sunday.year}'
          : '$sMonth ${monday.day} – ${sunday.day}, ${sunday.year}';
    }
    return isFr
        ? '${monday.day} $mMonth – ${sunday.day} $sMonth ${sunday.year}'
        : '$mMonth ${monday.day} – $sMonth ${sunday.day}, ${sunday.year}';
  }

  static String _monthName(BuildContext context, DateTime d,
      {bool full = true}) {
    const List<String> enFull = <String>[
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    const List<String> enShort = <String>[
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    const List<String> frFull = <String>[
      'janvier', 'février', 'mars', 'avril', 'mai', 'juin',
      'juillet', 'août', 'septembre', 'octobre', 'novembre', 'décembre',
    ];
    const List<String> frShort = <String>[
      'janv.', 'févr.', 'mars', 'avr.', 'mai', 'juin',
      'juil.', 'août', 'sept.', 'oct.', 'nov.', 'déc.',
    ];
    final bool isFr = Localizations.localeOf(context).languageCode == 'fr';
    final List<String> names = isFr
        ? (full ? frFull : frShort)
        : (full ? enFull : enShort);
    return names[d.month - 1];
  }
}

/// Debug-only bar — spawns events on demand and clears them, so the
/// reviewer can validate the local-reminder pipeline live.
class _DebugBar extends ConsumerWidget {
  const _DebugBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 48,
      width: double.infinity,
      color: const Color(0xFFFFF3E0),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: <Widget>[
          const Icon(Icons.bug_report_outlined, size: 18,
              color: ColorTokens.twakeOrange),
          const Gap(8),
          Expanded(
            child: Text(
              'DEMO',
              style: TextStyle(
                color: ColorTokens.twakeOrange,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
                fontSize: 11,
              ),
            ),
          ),
          TextButton.icon(
            icon: const Icon(Icons.notifications_active_outlined, size: 18),
            label: const Text('+6 min event'),
            style: TextButton.styleFrom(
              foregroundColor: ColorTokens.twakeOrange,
              visualDensity: VisualDensity.compact,
            ),
            onPressed: () async {
              final event = await ref
                  .read(debugEventsControllerProvider.notifier)
                  .addStartingIn(const Duration(minutes: 6));
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Reminder scheduled in ~1 min for "${event.title}"',
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_sweep_outlined, size: 20),
            tooltip: 'Clear debug events',
            color: ColorTokens.twakeOrange,
            visualDensity: VisualDensity.compact,
            onPressed: () =>
                ref.read(debugEventsControllerProvider.notifier).clear(),
          ),
        ],
      ),
    );
  }
}

class _TwakeLogo extends StatelessWidget {
  const _TwakeLogo();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            ColorTokens.logoGradientStart,
            ColorTokens.logoGradientEnd,
          ],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        Icons.calendar_month_rounded,
        color: Colors.white,
        size: 20,
      ),
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
          onDaySelected: (DateTime selected, DateTime focused) {
            final bool tappedSameDay =
                isSameDay(selected, state.selectedDay);
            ref
                .read(monthViewControllerProvider.notifier)
                .selectDay(selected);
            if (tappedSameDay) {
              ref
                  .read(viewKindControllerProvider.notifier)
                  .switchTo(CalendarViewKind.day);
            }
          },
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

