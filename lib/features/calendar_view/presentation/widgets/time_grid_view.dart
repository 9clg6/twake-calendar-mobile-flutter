import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
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
      height: 40,
      child: Row(
        children: <Widget>[
          SizedBox(width: hourLabelWidth),
          for (final DateTime day in days)
            Expanded(
              child: Center(
                child: Text(
                  '${_weekdayShort(context, day)} ${day.day}',
                  style: context.textTheme.bodyLarge,
                ),
              ),
            ),
        ],
      ),
    );
  }

  String _weekdayShort(BuildContext context, DateTime day) {
    const List<String> labels = <String>[
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
      'Sun',
    ];
    return labels[day.weekday - 1];
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
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: context.colorScheme.primary.withValues(alpha: .8),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                event.title ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(2),
              Text(
                '${_hhmm(start)} – ${_hhmm(end)}',
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _hhmm(DateTime d) =>
      '${d.hour.toString().padLeft(2, '0')}:'
      '${d.minute.toString().padLeft(2, '0')}';
}
