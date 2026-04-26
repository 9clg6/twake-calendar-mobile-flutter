import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/core/theme/color_tokens.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';

/// Generic time grid widget used by both Day and Week views.
///
/// Renders [days] as columns; each column is a 24-hour time grid where
/// timed events are positioned absolutely based on their start/end. All-day
/// events are stacked on top in a band (one row per all-day event).
class TimeGridView extends StatelessWidget {
  /// Creates a [TimeGridView].
  const TimeGridView({
    required this.days,
    required this.eventsByDay,
    required this.onEventTap,
    this.hourHeight = 56,
    super.key,
  });

  /// Days to render as columns (left to right).
  final List<DateTime> days;

  /// Events grouped by day (DateTime normalized to year/month/day).
  final Map<DateTime, List<CalendarEventEntity>> eventsByDay;

  /// Tap callback.
  final void Function(CalendarEventEntity event) onEventTap;

  /// Pixel height of one hour row.
  final double hourHeight;

  static const double _hourLabelWidth = 56;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _DaysHeader(days: days, hourLabelWidth: _hourLabelWidth),
          _AllDayBand(
            days: days,
            eventsByDay: eventsByDay,
            hourLabelWidth: _hourLabelWidth,
            onEventTap: onEventTap,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _HourColumn(hourHeight: hourHeight, width: _hourLabelWidth),
              for (final DateTime day in days)
                Expanded(
                  child: _DayColumn(
                    day: day,
                    events: eventsByDay[_normalize(day)] ??
                        const <CalendarEventEntity>[],
                    hourHeight: hourHeight,
                    onEventTap: onEventTap,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  static DateTime _normalize(DateTime d) => DateTime(d.year, d.month, d.day);
}

class _DaysHeader extends StatelessWidget {
  const _DaysHeader({required this.days, required this.hourLabelWidth});

  final List<DateTime> days;
  final double hourLabelWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Left gutter — Week number + UTC offset (matches the web mobile).
          SizedBox(
            width: hourLabelWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Week ${_weekNumber(days.first)}',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: ColorTokens.textTertiary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(2),
                Text(
                  _utcOffset(),
                  style: context.textTheme.bodySmall?.copyWith(
                    color: ColorTokens.twakeOrange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          for (final DateTime day in days)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${day.day}',
                    style: context.textTheme.titleLarge?.copyWith(
                      color: ColorTokens.textTertiary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    _weekdayShort(day),
                    style: context.textTheme.bodySmall?.copyWith(
                      color: ColorTokens.textMuted,
                      letterSpacing: 0.6,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  static String _weekdayShort(DateTime day) {
    const List<String> labels = <String>[
      'MON.',
      'TUE.',
      'WED.',
      'THU.',
      'FRI.',
      'SAT.',
      'SUN.',
    ];
    return labels[day.weekday - 1];
  }

  /// ISO 8601 week number — Monday-based, fits the web "Semaine N" label.
  static int _weekNumber(DateTime d) {
    final DateTime thursday =
        d.add(Duration(days: 4 - (d.weekday == 0 ? 7 : d.weekday)));
    final DateTime firstThursday =
        DateTime(thursday.year, 1, 4).add(Duration(days: 4 -
            (DateTime(thursday.year, 1, 4).weekday == 0
                ? 7
                : DateTime(thursday.year, 1, 4).weekday)));
    return 1 + thursday.difference(firstThursday).inDays ~/ 7;
  }

  static String _utcOffset() {
    final Duration offset = DateTime.now().timeZoneOffset;
    final String sign = offset.isNegative ? '-' : '+';
    final int hours = offset.inHours.abs();
    return 'UTC$sign$hours';
  }
}

class _AllDayBand extends StatelessWidget {
  const _AllDayBand({
    required this.days,
    required this.eventsByDay,
    required this.hourLabelWidth,
    required this.onEventTap,
  });

  final List<DateTime> days;
  final Map<DateTime, List<CalendarEventEntity>> eventsByDay;
  final double hourLabelWidth;
  final void Function(CalendarEventEntity) onEventTap;

  @override
  Widget build(BuildContext context) {
    final List<List<CalendarEventEntity>> perDay = days
        .map((DateTime d) => (eventsByDay[
                DateTime(d.year, d.month, d.day)] ??
                const <CalendarEventEntity>[])
            .where((CalendarEventEntity e) => e.allday)
            .toList())
        .toList();
    if (perDay.every((List<CalendarEventEntity> l) => l.isEmpty)) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: <Widget>[
          SizedBox(width: hourLabelWidth),
          for (final List<CalendarEventEntity> events in perDay)
            Expanded(
              child: Column(
                children: <Widget>[
                  for (final CalendarEventEntity e in events)
                    InkWell(
                      onTap: () => onEventTap(e),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 2,
                          vertical: 1,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color:
                              context.colorScheme.primary.withValues(alpha: .2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          e.title ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.bodySmall,
                        ),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _HourColumn extends StatelessWidget {
  const _HourColumn({required this.hourHeight, required this.width});

  final double hourHeight;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          for (int hour = 0; hour < 24; hour++)
            SizedBox(
              height: hourHeight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8, top: 4),
                child: Text(
                  '${hour.toString().padLeft(2, '0')}:00',
                  style: context.textTheme.bodySmall,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _DayColumn extends StatelessWidget {
  const _DayColumn({
    required this.day,
    required this.events,
    required this.hourHeight,
    required this.onEventTap,
  });

  final DateTime day;
  final List<CalendarEventEntity> events;
  final double hourHeight;
  final void Function(CalendarEventEntity) onEventTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: context.colorScheme.outline),
        ),
      ),
      height: hourHeight * 24,
      child: Stack(
        children: <Widget>[
          // Hour grid.
          for (int hour = 1; hour < 24; hour++)
            Positioned(
              top: hour * hourHeight,
              left: 0,
              right: 0,
              child: Divider(
                height: 1,
                color: context.colorScheme.outline.withValues(alpha: .4),
              ),
            ),
          // Events.
          for (final CalendarEventEntity e in events.where(
            (CalendarEventEntity x) => !x.allday,
          ))
            _PositionedEvent(
              event: e,
              hourHeight: hourHeight,
              onTap: () => onEventTap(e),
            ),
        ],
      ),
    );
  }
}

class _PositionedEvent extends StatelessWidget {
  const _PositionedEvent({
    required this.event,
    required this.hourHeight,
    required this.onTap,
  });

  final CalendarEventEntity event;
  final double hourHeight;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final DateTime start = DateTime.parse(event.start);
    final DateTime end =
        event.end == null ? start.add(const Duration(hours: 1)) : DateTime.parse(event.end!);
    final double top = (start.hour + start.minute / 60) * hourHeight;
    final double height =
        ((end.difference(start).inMinutes) / 60) * hourHeight;
    return Positioned(
      top: top,
      left: 2,
      right: 2,
      height: height.clamp(20.0, hourHeight * 24),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFD8F1DD),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRect(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  _hhmm(start),
                  style: const TextStyle(
                    color: Color(0xFF1B7F3A),
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                    height: 1.1,
                  ),
                ),
                const Gap(6),
                Expanded(
                  child: Text(
                    event.title ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF1B7F3A),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      height: 1.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _hhmm(DateTime d) =>
      '${d.hour.toString().padLeft(2, '0')}:'
      '${d.minute.toString().padLeft(2, '0')}';
}
