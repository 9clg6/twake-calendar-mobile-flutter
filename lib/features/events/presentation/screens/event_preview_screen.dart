import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:linagora_design_flutter/linagora_design_flutter.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/attendee.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/event_class.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/partstat.dart';
import 'package:twake_calendar_mobile/features/events/domain/usecases/update_partstat_usecase.dart';
import 'package:twake_calendar_mobile/features/events/events_providers.dart';
import 'package:twake_calendar_mobile/features/events/presentation/extensions/calendar_event_x.dart';
import 'package:twake_calendar_mobile/features/events/presentation/screens/event_form_screen.dart';
import 'package:twake_calendar_mobile/features/events/presentation/widgets/ics_source_view.dart';

/// Read-only preview of a [CalendarEventEntity].
///
/// Mirrors the EventPreview popover of the web frontend (`EventPreview/`
/// folder) — header (title + privacy lock), time subtitle, optional
/// location, description, recurrence summary, video conference link,
/// reminder, and the attendees list with PARTSTAT badges.
class EventPreviewScreen extends ConsumerWidget {
  /// Creates an [EventPreviewScreen].
  const EventPreviewScreen({required this.event, super.key});

  /// Event to display.
  final CalendarEventEntity event;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.shortTitle.isEmpty ? '—' : event.shortTitle),
        actions: <Widget>[
          if (event.classification != EventClass.publicClass)
            const Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(Icons.lock_outline),
            ),
          IconButton(
            tooltip: context.l10n.actionsModify,
            icon: const Icon(Icons.edit_outlined),
            onPressed: () => Navigator.of(context).push<void>(
              MaterialPageRoute<void>(
                builder: (_) => EventFormScreen(event: event),
              ),
            ),
          ),
          IconButton(
            tooltip: context.l10n.actionsDelete,
            icon: const Icon(Icons.delete_outline),
            onPressed: () async {
              await ref
                  .read(deleteEventUseCaseProvider)
                  .execute(event.url);
              if (context.mounted) Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          _TimeSubtitle(event: event),
          const Gap(16),
          if (event.location != null && event.location!.isNotEmpty)
            _IconRow(
              icon: Icons.location_on_outlined,
              text: event.location!,
            ),
          if (event.repetition != null)
            _IconRow(
              icon: Icons.repeat,
              text: '${event.repetition!.freq.name.toUpperCase()}'
                  '${event.repetition!.interval > 1 ? ' x${event.repetition!.interval}' : ''}',
            ),
          if (event.description != null && event.description!.isNotEmpty)
            _IconRow(
              icon: Icons.subject,
              text: event.description!,
            ),
          if (event.videoConferenceUrl != null &&
              event.videoConferenceUrl!.isNotEmpty)
            _IconRow(
              icon: Icons.videocam_outlined,
              text: event.videoConferenceUrl!,
            ),
          if (event.alarm != null)
            _IconRow(
              icon: Icons.notifications_none,
              text: event.alarm!.trigger,
            ),
          const Gap(16),
          if (event.attendees.isNotEmpty) ...<Widget>[
            Text(
              context.l10n.eventAttendees,
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(8),
            for (final AttendeeEntity attendee in event.attendees)
              _AttendeeRow(attendee: attendee),
            const Gap(16),
            _RsvpButtons(event: event),
          ],
          const Gap(16),
          IcsSourceView(event: event),
        ],
      ),
    );
  }
}

class _RsvpButtons extends ConsumerWidget {
  const _RsvpButtons({required this.event});

  final CalendarEventEntity event;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> apply(Partstat next) async {
      final AttendeeEntity me = event.attendees.firstWhere(
        (AttendeeEntity a) => a.partstat == Partstat.needsAction ||
            a.partstat == Partstat.accepted ||
            a.partstat == Partstat.declined ||
            a.partstat == Partstat.tentative,
        orElse: () => event.attendees.first,
      );
      await ref.read(updatePartstatUseCaseProvider).execute(
            UpdatePartstatParams(
              event: event,
              attendeeAddress: me.calAddress,
              partstat: next,
            ),
          );
      if (context.mounted) Navigator.of(context).pop();
    }

    return Wrap(
      spacing: 8,
      children: <Widget>[
        OutlinedButton.icon(
          icon: const Icon(Icons.check),
          label: Text(context.l10n.eventRsvpAccept),
          onPressed: () => apply(Partstat.accepted),
        ),
        OutlinedButton.icon(
          icon: const Icon(Icons.help_outline),
          label: Text(context.l10n.eventRsvpTentative),
          onPressed: () => apply(Partstat.tentative),
        ),
        OutlinedButton.icon(
          icon: const Icon(Icons.close),
          label: Text(context.l10n.eventRsvpDecline),
          onPressed: () => apply(Partstat.declined),
        ),
      ],
    );
  }
}

class _TimeSubtitle extends StatelessWidget {
  const _TimeSubtitle({required this.event});

  final CalendarEventEntity event;

  @override
  Widget build(BuildContext context) {
    if (event.allday) {
      return Text(event.start.split('T').first,
          style: context.textTheme.bodyLarge);
    }
    return Text(
      '${event.startHhmm} – ${event.endHhmm} (${event.timezone})',
      style: context.textTheme.bodyLarge,
    );
  }
}

class _IconRow extends StatelessWidget {
  const _IconRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon, size: 20, color: context.colorScheme.onSurfaceVariant),
          const Gap(12),
          Expanded(
            child: Text(text, style: context.textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}

class _AttendeeRow extends StatelessWidget {
  const _AttendeeRow({required this.attendee});

  final AttendeeEntity attendee;

  @override
  Widget build(BuildContext context) {
    final IconData? icon = switch (attendee.partstat) {
      Partstat.accepted => Icons.check_circle_outline,
      Partstat.declined => Icons.cancel_outlined,
      Partstat.tentative => Icons.help_outline,
      _ => null,
    };
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: <Widget>[
          RoundAvatar(
            text: attendee.cn.isNotEmpty ? attendee.cn : attendee.calAddress,
            size: 32,
          ),
          const Gap(12),
          Expanded(
            child: Text(
              attendee.cn.isNotEmpty ? attendee.cn : attendee.calAddress,
              style: context.textTheme.bodyLarge,
            ),
          ),
          if (icon != null)
            Icon(icon, size: 20, color: context.colorScheme.onSurfaceVariant),
        ],
      ),
    );
  }

}
