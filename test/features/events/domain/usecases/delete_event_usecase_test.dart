import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:twake_calendar_mobile/core/interfaces/result_state.dart';
import 'package:twake_calendar_mobile/features/events/domain/usecases/delete_event_usecase.dart';

import '../../../../_helpers/mocks.dart';

void main() {
  late MockEventRepository repository;
  late DeleteEventUseCase useCase;

  setUpAll(registerCommonFallbacks);

  setUp(() {
    repository = MockEventRepository();
    useCase = DeleteEventUseCase(eventRepository: repository);
  });

  test('forwards the URL to repository.deleteEvent', () async {
    when(() => repository.deleteEvent(any())).thenAnswer((_) async {});

    await useCase.execute('/dav/calendars/me/cal-1.json/event-1.ics');

    verify(() => repository
            .deleteEvent('/dav/calendars/me/cal-1.json/event-1.ics'))
        .called(1);
  });

  test('returns Success on a successful delete', () async {
    when(() => repository.deleteEvent(any())).thenAnswer((_) async {});

    final ResultState<void> result = await useCase.execute('/x');

    expect(result, isA<Success<void>>());
  });

  test('returns Failure when the repository throws', () async {
    when(() => repository.deleteEvent(any()))
        .thenThrow(const FormatException('boom'));

    final ResultState<void> result = await useCase.execute('/x');

    expect(result, isA<Failure<void>>());
  });
}
