import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/entities/calendar.dart';
import 'package:twake_calendar_mobile/features/calendars/presentation/widgets/calendar_item_tile.dart';

/// Collapsible section of the sidebar grouping a set of calendars under a
/// title (My calendars, Shared, Delegated, Subscribed).
class CalendarSection extends StatelessWidget {
  /// Creates a [CalendarSection].
  const CalendarSection({
    required this.title,
    required this.calendars,
    required this.selectedIds,
    required this.onToggle,
    super.key,
  });

  /// Section title.
  final String title;

  /// Calendars to render.
  final List<CalendarEntity> calendars;

  /// Selected ids set.
  final Set<String> selectedIds;

  /// Called when an item is toggled.
  final void Function(String id) onToggle;

  @override
  Widget build(BuildContext context) {
    if (calendars.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            title,
            style: context.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Gap(4),
        for (final CalendarEntity c in calendars)
          CalendarItemTile(
            calendar: c,
            isSelected: selectedIds.contains(c.id),
            onToggle: () => onToggle(c.id),
          ),
        const Gap(12),
      ],
    );
  }
}
