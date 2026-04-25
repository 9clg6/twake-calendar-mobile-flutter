import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/usecases/delete_calendar_usecase.dart';

import '../../../../_helpers/mocks.dart';

void main() {
  late MockCalendarRepository repository;
  late DeleteCalendarUseCase useCase;

  setUp(() {
    repository = MockCalendarRepository();
    useCase = DeleteCalendarUseCase(calendarRepository: repository);
  });

  test('forwards calendarLink to the repository', () async {
    when(() => repository.deleteCalendar(any())).thenAnswer((_) async {});

    await useCase.execute('/dav/calendars/me/me-1.json');

    verify(() => repository.deleteCalendar('/dav/calendars/me/me-1.json'))
        .called(1);
  });
}
