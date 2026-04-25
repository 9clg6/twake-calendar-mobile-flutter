import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/interfaces/result_state.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/usecases/save_event_usecase.dart';
import 'package:twake_calendar_mobile/features/events/events_providers.dart';
import 'package:twake_calendar_mobile/features/events/presentation/controllers/event_form_state.dart';
import 'package:twake_calendar_mobile/features/notifications/domain/services/local_reminder_service.dart';
import 'package:twake_calendar_mobile/features/notifications/notifications_providers.dart';

/// Controller of the event create/edit form. The provider is keyed by an
/// optional [CalendarEventEntity] so create vs edit are two distinct
/// providers (auto-disposed when the screen pops).
final class EventFormController
    extends FamilyAsyncNotifier<EventFormState, CalendarEventEntity?> {
  late SaveEventUseCase _saveEventUseCase;

  @override
  Future<EventFormState> build(CalendarEventEntity? arg) async {
    _saveEventUseCase = ref.read(saveEventUseCaseProvider);
    if (arg != null) {
      return EventFormState.fromEntity(arg);
    }
    return EventFormState.create(calendarId: 'me-personal');
  }

  void onTitleChanged(String value) =>
      _patch(state.value?.copyWith(title: value));

  void onLocationChanged(String value) =>
      _patch(state.value?.copyWith(location: value));

  void onDescriptionChanged(String value) =>
      _patch(state.value?.copyWith(description: value));

  void onAllDayChanged(bool value) =>
      _patch(state.value?.copyWith(allday: value));

  void onStartChanged(DateTime value) =>
      _patch(state.value?.copyWith(start: value));

  void onEndChanged(DateTime value) =>
      _patch(state.value?.copyWith(end: value));

  /// Submits the form. Returns true on success.
  Future<bool> submit() async {
    final EventFormState? current = state.value;
    if (current == null) return false;
    state = AsyncData<EventFormState>(
      current.copyWith(isSubmitting: true, error: null),
    );
    final CalendarEventEntity entity = _toEntity(current);
    final ResultState<void> result =
        await _saveEventUseCase.execute(entity);
    return result.when<bool>(
      success: (_) {
        state = AsyncData<EventFormState>(
          current.copyWith(isSubmitting: false, didSubmit: true),
        );
        // Best-effort local reminder scheduling. Silent on failure: we
        // don't want a notification permission denial to fail the save.
        final LocalReminderService reminders =
            ref.read(localReminderServiceProvider);
        reminders.scheduleFor(entity).catchError((Object _) => null);
        return true;
      },
      failure: (Exception e) {
        state = AsyncData<EventFormState>(
          current.copyWith(isSubmitting: false, error: e.toString()),
        );
        return false;
      },
    );
  }

  void _patch(EventFormState? next) {
    if (next != null) state = AsyncData<EventFormState>(next);
  }

  CalendarEventEntity _toEntity(EventFormState s) {
    final String uid =
        DateTime.now().millisecondsSinceEpoch.toString();
    final String url =
        '/calendars/me/${s.calendarId}.json/$uid.ics';
    return CalendarEventEntity(
      uid: uid,
      calId: s.calendarId,
      url: url,
      start: s.start.toIso8601String().split('.').first,
      end: s.end.toIso8601String().split('.').first,
      timezone: s.timezone,
      title: s.title,
      location: s.location.isEmpty ? null : s.location,
      description: s.description.isEmpty ? null : s.description,
      allday: s.allday,
    );
  }
}

/// Provider keyed by optional event (null = create, present = edit).
final AsyncNotifierProviderFamily<EventFormController, EventFormState,
        CalendarEventEntity?> eventFormControllerProvider =
    AsyncNotifierProviderFamily<EventFormController, EventFormState,
        CalendarEventEntity?>(
  EventFormController.new,
  name: 'eventFormControllerProvider',
);
