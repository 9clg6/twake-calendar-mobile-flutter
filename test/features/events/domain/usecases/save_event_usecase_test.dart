import 'package:flutter_test/flutter_test.dart';
import 'package:twake_calendar_mobile/core/interfaces/result_state.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/repositories/event_repository.dart';
import 'package:twake_calendar_mobile/features/events/domain/usecases/delete_event_usecase.dart';
import 'package:twake_calendar_mobile/features/events/domain/usecases/save_event_usecase.dart';

class _RecordingRepository implements EventRepository {
  CalendarEventEntity? lastSaved;
  String? lastDeletedUrl;

  @override
  Future<List<CalendarEventEntity>> fetchEventsInRange({
    required String calendarId,
    required DateTime start,
    required DateTime end,
  }) async => const <CalendarEventEntity>[];

  @override
  Future<CalendarEventEntity?> fetchEvent(String url) async => null;

  @override
  Future<void> saveEvent(CalendarEventEntity event) async {
    lastSaved = event;
  }

  @override
  Future<void> deleteEvent(String url) async {
    lastDeletedUrl = url;
  }

  @override
  Future<void> moveEvent({
    required String fromUrl,
    required String toUrl,
  }) async {}
}

void main() {
  group('SaveEventUseCase / DeleteEventUseCase', () {
    test('SaveEventUseCase forwards the entity', () async {
      final _RecordingRepository repo = _RecordingRepository();
      final CalendarEventEntity event = CalendarEventEntity(
        uid: 'e1',
        calId: 'c1',
        url: '/dav/x.ics',
        start: '2026-04-25T09:00:00',
        timezone: 'Europe/Paris',
        title: 'New event',
      );
      final ResultState<void> result =
          await SaveEventUseCase(eventRepository: repo).execute(event);
      expect(result, isA<Success<void>>());
      expect(repo.lastSaved, event);
    });

    test('DeleteEventUseCase forwards the URL', () async {
      final _RecordingRepository repo = _RecordingRepository();
      final ResultState<void> result =
          await DeleteEventUseCase(eventRepository: repo)
              .execute('/dav/x.ics');
      expect(result, isA<Success<void>>());
      expect(repo.lastDeletedUrl, '/dav/x.ics');
    });
  });
}
