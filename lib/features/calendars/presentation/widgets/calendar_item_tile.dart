import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/features/calendars/calendars_providers.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/entities/calendar.dart';
import 'package:twake_calendar_mobile/features/calendars/presentation/controllers/sidebar_controller.dart';
import 'package:twake_calendar_mobile/features/calendars/presentation/screens/calendar_form_dialog.dart';

/// Single row in the sidebar — checkbox + color square + name + context
/// menu (edit / delete).
class CalendarItemTile extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final Color accent =
        _parseColor(calendar.colorLight) ?? context.colorScheme.primary;
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
            PopupMenuButton<_CalendarAction>(
              icon: const Icon(Icons.more_horiz),
              onSelected: (_CalendarAction action) async {
                switch (action) {
                  case _CalendarAction.edit:
                    await showDialog<void>(
                      context: context,
                      builder: (_) => CalendarFormDialog(existing: calendar),
                    );
                  case _CalendarAction.delete:
                    final bool? confirmed = await showDialog<bool>(
                      context: context,
                      builder: (BuildContext c) => AlertDialog(
                        title: Text(c.l10n.calendarDelete),
                        content: Text(c.l10n.calendarDeleteConfirm),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () =>
                                Navigator.of(c).pop<bool>(false),
                            child: Text(c.l10n.actionsCancel),
                          ),
                          FilledButton(
                            onPressed: () =>
                                Navigator.of(c).pop<bool>(true),
                            child: Text(c.l10n.actionsDelete),
                          ),
                        ],
                      ),
                    );
                    if (confirmed != true) return;
                    await ref
                        .read(deleteCalendarUseCaseProvider)
                        .execute(calendar.link);
                    ref.invalidate(sidebarControllerProvider);
                }
              },
              itemBuilder: (BuildContext c) =>
                  <PopupMenuEntry<_CalendarAction>>[
                PopupMenuItem<_CalendarAction>(
                  value: _CalendarAction.edit,
                  child: Text(c.l10n.actionsModify),
                ),
                PopupMenuItem<_CalendarAction>(
                  value: _CalendarAction.delete,
                  child: Text(c.l10n.actionsDelete),
                ),
              ],
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

enum _CalendarAction { edit, delete }
