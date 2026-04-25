import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:twake_calendar_mobile/core/interfaces/result_state.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/usecases/create_calendar_usecase.dart';

import '../../../../_helpers/mocks.dart';

void main() {
  late MockCalendarRepository repository;
  late CreateCalendarUseCase useCase;

  setUp(() {
    repository = MockCalendarRepository();
    useCase = CreateCalendarUseCase(calendarRepository: repository);
  });

  test('forwards id to the repository', () async {
    when(() => repository.createCalendar(
          id: any(named: 'id'),
          name: any(named: 'name'),
          description: any(named: 'description'),
          color: any(named: 'color'),
        )).thenAnswer((_) async {});

    await useCase.execute(
      const CreateCalendarParams(id: 'cal-1', name: 'Mine'),
    );

    verify(() => repository.createCalendar(
          id: 'cal-1',
          name: 'Mine',
          description: null,
          color: null,
        )).called(1);
  });

  test('forwards optional description and color', () async {
    when(() => repository.createCalendar(
          id: any(named: 'id'),
          name: any(named: 'name'),
          description: any(named: 'description'),
          color: any(named: 'color'),
        )).thenAnswer((_) async {});

    await useCase.execute(
      const CreateCalendarParams(
        id: 'cal-1',
        name: 'Mine',
        description: 'My calendar',
        color: '#F67E35',
      ),
    );

    verify(() => repository.createCalendar(
          id: 'cal-1',
          name: 'Mine',
          description: 'My calendar',
          color: '#F67E35',
        )).called(1);
  });

  test('returns Failure when the repository throws', () async {
    when(() => repository.createCalendar(
          id: any(named: 'id'),
          name: any(named: 'name'),
          description: any(named: 'description'),
          color: any(named: 'color'),
        )).thenThrow(const FormatException('boom'));

    final ResultState<void> result = await useCase.execute(
      const CreateCalendarParams(id: 'cal-1', name: 'Mine'),
    );

    expect(result, isA<Failure<void>>());
  });
}
