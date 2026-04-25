import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/alarm.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/attendee.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/organizer.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/repetition.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/event_class.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/event_status.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/transparency.dart';

part 'calendar_event.freezed.dart';

/// Calendar event — domain model.
///
/// Mirrors the `CalendarEvent` interface of the web frontend
/// (`twake-calendar-frontend/src/features/Events/EventsTypes.ts`).
@freezed
abstract class CalendarEventEntity with _$CalendarEventEntity {
  /// Creates a [CalendarEventEntity].
  const factory CalendarEventEntity({
    required String uid,
    required String calId,
    required String url,
    required String start,
    required String timezone,
    String? end,
    String? title,
    String? description,
    String? location,
    OrganizerEntity? organizer,
    @Default(<AttendeeEntity>[]) List<AttendeeEntity> attendees,
    RepetitionEntity? repetition,
    AlarmEntity? alarm,
    @Default(EventClass.publicClass) EventClass classification,
    @Default(Transparency.opaque) Transparency transp,
    EventStatus? status,
    @Default(false) bool allday,
    String? recurrenceId,
    @Default(<String>[]) List<String> exdates,
    int? sequence,
    String? videoConferenceUrl,
    @Default(<List<dynamic>>[]) List<List<dynamic>> passthroughProps,
  }) = _CalendarEventEntity;
}
