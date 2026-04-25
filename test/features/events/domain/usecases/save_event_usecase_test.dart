import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:twake_calendar_mobile/core/interfaces/result_state.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/usecases/save_event_usecase.dart';

import '../../../../_helpers/mocks.dart';

CalendarEventEntity buildEvent() => CalendarEventEntity(
      uid: 'event-1',
      calId: 'cal-1',
      url: '/dav/calendars/me/cal-1.json/event-1.ics',
      start: '2026-04-25T09:00:00',
      timezone: 'Europe/Paris',
      title: 'A meeting',
    );

void main() {
  late MockEventRepository repository;
  late SaveEventUseCase useCase;

  setUpAll(registerCommonFallbacks);

  setUp(() {
    repository = MockEventRepository();
    useCase = SaveEventUseCase(eventRepository: repository);
  });

  test('forwards the event to repository.saveEvent', () async {
    final CalendarEventEntity event = buildEvent();
    when(() => repository.saveEvent(any())).thenAnswer((_) async {});

    await useCase.execute(event);

    verify(() => repository.saveEvent(event)).called(1);
  });

  test('returns Success on a successful save', () async {
    when(() => repository.saveEvent(any())).thenAnswer((_) async {});

    final ResultState<void> result = await useCase.execute(buildEvent());

    expect(result, isA<Success<void>>());
  });

  test('returns Failure when the repository throws', () async {
    when(() => repository.saveEvent(any()))
        .thenThrow(const FormatException('boom'));

    final ResultState<void> result = await useCase.execute(buildEvent());

    expect(result, isA<Failure<void>>());
  });
}
