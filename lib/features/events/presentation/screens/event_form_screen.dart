import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/presentation/controllers/event_form_controller.dart';
import 'package:twake_calendar_mobile/features/events/presentation/controllers/event_form_state.dart';
import 'package:twake_calendar_mobile/features/events/presentation/widgets/recurrence_field.dart';

/// Minimal create / edit form for an event.
///
/// Only covers title, location, description, start/end, all-day. Recurrence,
/// attendees, video conference, alarms and class are deferred to follow-up
/// screens (event_recurrence_modal, attendee_search, ...).
class EventFormScreen extends ConsumerStatefulWidget {
  /// Creates an [EventFormScreen]. [event] is null in create mode.
  const EventFormScreen({this.event, super.key});

  /// Event to edit, or null when creating a fresh one.
  final CalendarEventEntity? event;

  @override
  ConsumerState<EventFormScreen> createState() => _EventFormScreenState();
}

class _EventFormScreenState extends ConsumerState<EventFormScreen> {
  @override
  Widget build(BuildContext context) {
    final AsyncValue<EventFormState> async =
        ref.watch(eventFormControllerProvider(widget.event));
    final EventFormController controller =
        ref.read(eventFormControllerProvider(widget.event).notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.event == null
            ? context.l10n.eventCreate
            : context.l10n.eventUpdate),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: context.l10n.actionsSave,
            onPressed: () async {
              final bool ok = await controller.submit();
              if (ok && context.mounted) Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (Object e, StackTrace _) => Center(
          child: Text(context.l10n.errorUnknown,
              style: context.textTheme.bodyLarge),
        ),
        data: (EventFormState state) => ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            if (state.error != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  state.error!,
                  style: TextStyle(color: context.colorScheme.error),
                ),
              ),
            TextField(
              decoration: InputDecoration(
                labelText: context.l10n.eventTitle,
                hintText: context.l10n.eventTitleHint,
                border: const OutlineInputBorder(),
              ),
              autofocus: widget.event == null,
              controller: TextEditingController(text: state.title),
              onChanged: controller.onTitleChanged,
            ),
            const Gap(12),
            SwitchListTile(
              value: state.allday,
              title: Text(context.l10n.eventAllDay),
              onChanged: controller.onAllDayChanged,
            ),
            _DateTimeRow(
              label: context.l10n.eventStart,
              value: state.start,
              allday: state.allday,
              onChanged: controller.onStartChanged,
            ),
            _DateTimeRow(
              label: context.l10n.eventEnd,
              value: state.end,
              allday: state.allday,
              onChanged: controller.onEndChanged,
            ),
            RecurrenceField(
              value: state.repetition,
              onChanged: controller.onRepetitionChanged,
            ),
            const Gap(12),
            TextField(
              decoration: InputDecoration(
                labelText: context.l10n.eventLocation,
                border: const OutlineInputBorder(),
              ),
              controller: TextEditingController(text: state.location),
              onChanged: controller.onLocationChanged,
            ),
            const Gap(12),
            TextField(
              decoration: InputDecoration(
                labelText: context.l10n.eventDescription,
                border: const OutlineInputBorder(),
              ),
              maxLines: 4,
              controller: TextEditingController(text: state.description),
              onChanged: controller.onDescriptionChanged,
            ),
            if (state.isSubmitting) ...<Widget>[
              const Gap(16),
              const Center(child: CircularProgressIndicator()),
            ],
          ],
        ),
      ),
    );
  }
}

class _DateTimeRow extends StatelessWidget {
  const _DateTimeRow({
    required this.label,
    required this.value,
    required this.allday,
    required this.onChanged,
  });

  final String label;
  final DateTime value;
  final bool allday;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(label, style: context.textTheme.bodySmall),
      subtitle: Text(_format(value, allday)),
      trailing: const Icon(Icons.edit_calendar_outlined),
      onTap: () async {
        final DateTime? date = await showDatePicker(
          context: context,
          initialDate: value,
          firstDate: DateTime(2020),
          lastDate: DateTime(2035, 12, 31),
        );
        if (date == null) return;
        if (allday) {
          onChanged(DateTime(date.year, date.month, date.day));
          return;
        }
        if (!context.mounted) return;
        final TimeOfDay? time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(value),
        );
        if (time == null) return;
        onChanged(DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        ));
      },
    );
  }

  String _format(DateTime value, bool allday) {
    final String d =
        '${value.year.toString().padLeft(4, '0')}-'
        '${value.month.toString().padLeft(2, '0')}-'
        '${value.day.toString().padLeft(2, '0')}';
    if (allday) return d;
    return '$d ${value.hour.toString().padLeft(2, '0')}:'
        '${value.minute.toString().padLeft(2, '0')}';
  }
}
