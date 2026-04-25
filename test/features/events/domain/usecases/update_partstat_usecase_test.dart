import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/attendee.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/partstat.dart';
import 'package:twake_calendar_mobile/features/events/domain/usecases/update_partstat_usecase.dart';

import '../../../../_helpers/mocks.dart';

CalendarEventEntity eventWithAttendees() => CalendarEventEntity(
      uid: 'e',
      calId: 'cal',
      url: '/dav/e.ics',
      start: '2026-04-25T09:00:00',
      timezone: 'Europe/Paris',
      attendees: const <AttendeeEntity>[
        AttendeeEntity(calAddress: 'a@x.io'),
        AttendeeEntity(calAddress: 'b@x.io', partstat: Partstat.tentative),
      ],
    );

void main() {
  late MockEventRepository repository;
  late UpdatePartstatUseCase useCase;

  setUpAll(registerCommonFallbacks);

  setUp(() {
    repository = MockEventRepository();
    useCase = UpdatePartstatUseCase(eventRepository: repository);
  });

  test('saves the event after updating partstat', () async {
    when(() => repository.saveEvent(any())).thenAnswer((_) async {});

    await useCase.execute(
      UpdatePartstatParams(
        event: eventWithAttendees(),
        attendeeAddress: 'b@x.io',
        partstat: Partstat.declined,
      ),
    );

    verify(() => repository.saveEvent(any())).called(1);
  });

  test('updates only the matching attendee', () async {
    final List<CalendarEventEntity> captured = <CalendarEventEntity>[];
    when(() => repository.saveEvent(any())).thenAnswer((Invocation i) async {
      captured.add(i.positionalArguments.first as CalendarEventEntity);
    });

    await useCase.execute(
      UpdatePartstatParams(
        event: eventWithAttendees(),
        attendeeAddress: 'b@x.io',
        partstat: Partstat.declined,
      ),
    );

    final AttendeeEntity b = captured.single.attendees
        .firstWhere((AttendeeEntity x) => x.calAddress == 'b@x.io');
    expect(b.partstat, Partstat.declined);
  });

  test('does not change the other attendees', () async {
    final List<CalendarEventEntity> captured = <CalendarEventEntity>[];
    when(() => repository.saveEvent(any())).thenAnswer((Invocation i) async {
      captured.add(i.positionalArguments.first as CalendarEventEntity);
    });

    await useCase.execute(
      UpdatePartstatParams(
        event: eventWithAttendees(),
        attendeeAddress: 'b@x.io',
        partstat: Partstat.declined,
      ),
    );

    final AttendeeEntity a = captured.single.attendees
        .firstWhere((AttendeeEntity x) => x.calAddress == 'a@x.io');
    expect(a.partstat, Partstat.needsAction);
  });
}
