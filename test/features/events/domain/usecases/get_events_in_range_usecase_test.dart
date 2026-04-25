import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:twake_calendar_mobile/core/interfaces/result_state.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/usecases/get_events_in_range_usecase.dart';

import '../../../../_helpers/mocks.dart';

void main() {
  late MockEventRepository repository;
  late GetEventsInRangeUseCase useCase;

  setUpAll(registerCommonFallbacks);

  setUp(() {
    repository = MockEventRepository();
    useCase = GetEventsInRangeUseCase(eventRepository: repository);
  });

  GetEventsInRangeParams buildParams() => GetEventsInRangeParams(
        calendarId: 'cal-1',
        start: DateTime.utc(2026, 4),
        end: DateTime.utc(2026, 5),
      );

  test('forwards calendarId to the repository', () async {
    when(() => repository.fetchEventsInRange(
          calendarId: any(named: 'calendarId'),
          start: any(named: 'start'),
          end: any(named: 'end'),
        )).thenAnswer((_) async => const <CalendarEventEntity>[]);

    await useCase.execute(buildParams());

    verify(() => repository.fetchEventsInRange(
          calendarId: 'cal-1',
          start: DateTime.utc(2026, 4),
          end: DateTime.utc(2026, 5),
        )).called(1);
  });

  test('wraps repository data in Success', () async {
    final CalendarEventEntity event = CalendarEventEntity(
      uid: 'e',
      calId: 'cal-1',
      url: '/dav/e.ics',
      start: '2026-04-25T09:00:00',
      timezone: 'Europe/Paris',
    );
    when(() => repository.fetchEventsInRange(
          calendarId: any(named: 'calendarId'),
          start: any(named: 'start'),
          end: any(named: 'end'),
        )).thenAnswer((_) async => <CalendarEventEntity>[event]);

    final ResultState<List<CalendarEventEntity>> result =
        await useCase.execute(buildParams());

    expect(result, isA<Success<List<CalendarEventEntity>>>());
  });

  test('Success carries the events returned by the repository', () async {
    final CalendarEventEntity event = CalendarEventEntity(
      uid: 'e',
      calId: 'cal-1',
      url: '/dav/e.ics',
      start: '2026-04-25T09:00:00',
      timezone: 'Europe/Paris',
    );
    when(() => repository.fetchEventsInRange(
          calendarId: any(named: 'calendarId'),
          start: any(named: 'start'),
          end: any(named: 'end'),
        )).thenAnswer((_) async => <CalendarEventEntity>[event]);

    final ResultState<List<CalendarEventEntity>> result =
        await useCase.execute(buildParams());

    expect(
      result.when<List<CalendarEventEntity>>(
        success: (List<CalendarEventEntity> data) => data,
        failure: (_) => <CalendarEventEntity>[],
      ),
      <CalendarEventEntity>[event],
    );
  });

  test('captures repository exception into Failure', () async {
    when(() => repository.fetchEventsInRange(
          calendarId: any(named: 'calendarId'),
          start: any(named: 'start'),
          end: any(named: 'end'),
        )).thenThrow(const FormatException('boom'));

    final ResultState<List<CalendarEventEntity>> result =
        await useCase.execute(buildParams());

    expect(result, isA<Failure<List<CalendarEventEntity>>>());
  });
}
