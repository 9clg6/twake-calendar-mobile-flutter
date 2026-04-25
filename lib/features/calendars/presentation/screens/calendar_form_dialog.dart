import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/features/calendars/calendars_providers.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/entities/calendar.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/usecases/create_calendar_usecase.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/usecases/update_calendar_usecase.dart';
import 'package:twake_calendar_mobile/features/calendars/presentation/controllers/sidebar_controller.dart';

/// Predefined accent colors for calendars (matches the web frontend
/// palette).
const List<String> _kColorPalette = <String>[
  '#F67E35',
  '#3F51B5',
  '#009688',
  '#E91E63',
  '#9C27B0',
  '#4CAF50',
  '#FFC107',
  '#607D8B',
];

/// Modal dialog for creating or editing a personal calendar.
class CalendarFormDialog extends ConsumerStatefulWidget {
  /// Creates a [CalendarFormDialog]. Pass [existing] to enter edit mode.
  const CalendarFormDialog({this.existing, super.key});

  /// Existing calendar (edit mode), or null for create.
  final CalendarEntity? existing;

  @override
  ConsumerState<CalendarFormDialog> createState() => _CalendarFormDialogState();
}

class _CalendarFormDialogState extends ConsumerState<CalendarFormDialog> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late String _color;
  bool _isSubmitting = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: widget.existing?.name ?? '');
    _descriptionController =
        TextEditingController(text: widget.existing?.description ?? '');
    _color = widget.existing?.colorLight ?? _kColorPalette.first;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final String name = _nameController.text.trim();
    if (name.isEmpty) {
      setState(() => _error = context.l10n.errorUnknown);
      return;
    }
    setState(() {
      _isSubmitting = true;
      _error = null;
    });
    try {
      if (widget.existing == null) {
        await ref.read(createCalendarUseCaseProvider).execute(
              CreateCalendarParams(
                id: DateTime.now().millisecondsSinceEpoch
                    .toRadixString(36),
                name: name,
                description: _descriptionController.text.trim(),
                color: _color,
              ),
            );
      } else {
        await ref.read(updateCalendarUseCaseProvider).execute(
              UpdateCalendarParams(
                calendarLink: widget.existing!.link,
                name: name,
                description: _descriptionController.text.trim(),
                color: _color,
              ),
            );
      }
      ref.invalidate(sidebarControllerProvider);
      if (mounted) Navigator.of(context).pop();
    } on Exception catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _isSubmitting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.existing == null
          ? context.l10n.actionsCreate
          : context.l10n.calendarSettings),
      content: SizedBox(
        width: 360,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (_error != null) ...<Widget>[
              Text(
                _error!,
                style: TextStyle(color: context.colorScheme.error),
              ),
              const Gap(8),
            ],
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: context.l10n.eventTitle,
                border: const OutlineInputBorder(),
              ),
            ),
            const Gap(12),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: context.l10n.eventDescription,
                border: const OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const Gap(16),
            Text(
              context.l10n.calendarColor,
              style: context.textTheme.bodySmall,
            ),
            const Gap(8),
            Wrap(
              spacing: 8,
              children: <Widget>[
                for (final String hex in _kColorPalette)
                  GestureDetector(
                    onTap: () => setState(() => _color = hex),
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: _hexToColor(hex),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: hex == _color
                              ? context.colorScheme.onSurface
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed:
              _isSubmitting ? null : () => Navigator.of(context).pop(),
          child: Text(context.l10n.actionsCancel),
        ),
        FilledButton(
          onPressed: _isSubmitting ? null : _submit,
          child: _isSubmitting
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(context.l10n.actionsSave),
        ),
      ],
    );
  }

  Color _hexToColor(String hex) {
    final String value = hex.replaceFirst('#', '');
    final String full = value.length == 6 ? 'FF$value' : value;
    return Color(int.parse(full, radix: 16));
  }
}
