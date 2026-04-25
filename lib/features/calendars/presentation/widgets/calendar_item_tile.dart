import 'package:flutter/material.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/entities/calendar.dart';

/// Single row in the sidebar — checkbox + color square + calendar name.
class CalendarItemTile extends StatelessWidget {
  /// Creates a [CalendarItemTile].
  const CalendarItemTile({
    required this.calendar,
    required this.isSelected,
    required this.onToggle,
    super.key,
  });

  /// The calendar to display.
  final CalendarEntity calendar;

  /// Whether the calendar is currently visible.
  final bool isSelected;

  /// Called when the user taps the checkbox or the row.
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final Color accent = _parseColor(calendar.colorLight) ??
        context.colorScheme.primary;
    return InkWell(
      onTap: onToggle,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: <Widget>[
            Checkbox(
              value: isSelected,
              onChanged: (_) => onToggle(),
              activeColor: accent,
            ),
            Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: accent,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                calendar.name,
                style: context.textTheme.bodyLarge,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color? _parseColor(String? hex) {
    if (hex == null || !hex.startsWith('#')) return null;
    final String value = hex.substring(1);
    if (value.length != 6 && value.length != 8) return null;
    final String full = value.length == 6 ? 'FF$value' : value;
    final int? parsed = int.tryParse(full, radix: 16);
    if (parsed == null) return null;
    return Color(parsed);
  }
}
