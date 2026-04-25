import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/attendee.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/repetition.dart';

part 'event_form_state.freezed.dart';

/// State of the event create/edit form.
@freezed
abstract class EventFormState with _$EventFormState {
  /// Creates an [EventFormState].
  const factory EventFormState({
    required String calendarId,
    @Default('') String title,
    @Default('') String location,
    @Default('') String description,
    required DateTime start,
    required DateTime end,
    @Default(false) bool allday,
    @Default('Europe/Paris') String timezone,
    RepetitionEntity? repetition,
    @Default(<AttendeeEntity>[]) List<AttendeeEntity> attendees,
    @Default(false) bool isSubmitting,
    String? error,
    @Default(false) bool didSubmit,
  }) = _EventFormState;

  /// Hydrates the form from an existing entity (edit mode).
  factory EventFormState.fromEntity(CalendarEventEntity event) =>
      EventFormState(
        calendarId: event.calId,
        title: event.title ?? '',
        location: event.location ?? '',
        description: event.description ?? '',
        start: DateTime.parse(event.start),
        end: event.end == null
            ? DateTime.parse(event.start)
            : DateTime.parse(event.end!),
        allday: event.allday,
        timezone: event.timezone,
        repetition: event.repetition,
        attendees: event.attendees,
      );

  /// Default empty state for the create flow.
  factory EventFormState.create({
    required String calendarId,
    DateTime? at,
  }) {
    final DateTime now = at ?? DateTime.now();
    final DateTime start =
        DateTime(now.year, now.month, now.day, now.hour);
    return EventFormState(
      calendarId: calendarId,
      start: start,
      end: start.add(const Duration(hours: 1)),
    );
  }
}
