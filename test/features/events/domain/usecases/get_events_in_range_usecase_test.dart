import 'package:flutter_test/flutter_test.dart';
import 'package:twake_calendar_mobile/core/interfaces/result_state.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/repositories/event_repository.dart';
import 'package:twake_calendar_mobile/features/events/domain/usecases/get_events_in_range_usecase.dart';

class _FakeEventRepository implements EventRepository {
  _FakeEventRepository(this._events);

  final List<CalendarEventEntity> _events;
  GetEventsInRangeParams? lastParams;

  @override
  Future<List<CalendarEventEntity>> fetchEventsInRange({
    required String calendarId,
    required DateTime start,
    required DateTime end,
  }) async {
    lastParams = GetEventsInRangeParams(
      calendarId: calendarId,
      start: start,
      end: end,
    );
    return _events;
  }

  @override
  Future<CalendarEventEntity?> fetchEvent(String url) async => null;

  @override
  Future<void> saveEvent(CalendarEventEntity event) async {}

  @override
  Future<void> deleteEvent(String url) async {}

  @override
  Future<void> moveEvent({required String fromUrl, required String toUrl}) async {}
}

class _ThrowingRepository implements EventRepository {
  @override
  Future<List<CalendarEventEntity>> fetchEventsInRange({
    required String calendarId,
    required DateTime start,
    required DateTime end,
  }) async {
    throw const FormatException('boom');
  }

  @override
  Future<CalendarEventEntity?> fetchEvent(String url) async => null;

  @override
  Future<void> saveEvent(CalendarEventEntity event) async {}

  @override
  Future<void> deleteEvent(String url) async {}

  @override
  Future<void> moveEvent({required String fromUrl, required String toUrl}) async {}
}

void main() {
  group('GetEventsInRangeUseCase', () {
    test('forwards parameters to the repository', () async {
      final _FakeEventRepository repo =
          _FakeEventRepository(<CalendarEventEntity>[]);
      final GetEventsInRangeUseCase useCase =
          GetEventsInRangeUseCase(eventRepository: repo);
      final ResultState<List<CalendarEventEntity>> result =
          await useCase.execute(
        GetEventsInRangeParams(
          calendarId: 'cal-1',
          start: DateTime.utc(2026, 1),
          end: DateTime.utc(2026, 2),
        ),
      );
      expect(result, isA<Success<List<CalendarEventEntity>>>());
      expect(repo.lastParams!.calendarId, 'cal-1');
      expect(repo.lastParams!.start, DateTime.utc(2026, 1));
      expect(repo.lastParams!.end, DateTime.utc(2026, 2));
    });

    test('wraps repository data in Success', () async {
      final CalendarEventEntity event = CalendarEventEntity(
        uid: 'e1',
        calId: 'c1',
        url: '/dav/x.ics',
        start: '2026-04-25T09:00:00',
        timezone: 'Europe/Paris',
      );
      final ResultState<List<CalendarEventEntity>> result =
          await GetEventsInRangeUseCase(
        eventRepository: _FakeEventRepository(<CalendarEventEntity>[event]),
      ).execute(
        GetEventsInRangeParams(
          calendarId: 'c1',
          start: DateTime.utc(2026),
          end: DateTime.utc(2026, 12, 31),
        ),
      );
      expect(
        result.when<int>(
          success: (List<CalendarEventEntity> data) => data.length,
          failure: (Exception _) => -1,
        ),
        1,
      );
    });

    test('repository exception is captured into a Failure', () async {
      final ResultState<List<CalendarEventEntity>> result =
          await GetEventsInRangeUseCase(
        eventRepository: _ThrowingRepository(),
      ).execute(
        GetEventsInRangeParams(
          calendarId: 'c1',
          start: DateTime.utc(2026),
          end: DateTime.utc(2026, 12, 31),
        ),
      );
      expect(result, isA<Failure<List<CalendarEventEntity>>>());
    });
  });
}
