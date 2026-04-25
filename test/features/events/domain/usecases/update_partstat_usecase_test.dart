import 'package:flutter_test/flutter_test.dart';
import 'package:twake_calendar_mobile/core/interfaces/result_state.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/attendee.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/partstat.dart';
import 'package:twake_calendar_mobile/features/events/domain/repositories/event_repository.dart';
import 'package:twake_calendar_mobile/features/events/domain/usecases/update_partstat_usecase.dart';

class _CapturingRepository implements EventRepository {
  CalendarEventEntity? lastSaved;

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
  Future<void> deleteEvent(String url) async {}

  @override
  Future<void> moveEvent({required String fromUrl, required String toUrl}) async {}
}

void main() {
  test('UpdatePartstatUseCase replaces only the matching attendee', () async {
    final _CapturingRepository repo = _CapturingRepository();
    final CalendarEventEntity event = CalendarEventEntity(
      uid: 'e',
      calId: 'c',
      url: '/dav/e.ics',
      start: '2026-04-25T09:00:00',
      timezone: 'Europe/Paris',
      attendees: const <AttendeeEntity>[
        AttendeeEntity(calAddress: 'a@x.io'),
        AttendeeEntity(calAddress: 'b@x.io', partstat: Partstat.tentative),
      ],
    );

    final ResultState<void> result =
        await UpdatePartstatUseCase(eventRepository: repo).execute(
      UpdatePartstatParams(
        event: event,
        attendeeAddress: 'b@x.io',
        partstat: Partstat.declined,
      ),
    );

    expect(result, isA<Success<void>>());
    expect(repo.lastSaved, isNotNull);
    final List<AttendeeEntity> attendees = repo.lastSaved!.attendees;
    expect(attendees, hasLength(2));
    final AttendeeEntity a =
        attendees.firstWhere((AttendeeEntity x) => x.calAddress == 'a@x.io');
    final AttendeeEntity b =
        attendees.firstWhere((AttendeeEntity x) => x.calAddress == 'b@x.io');
    expect(a.partstat, Partstat.needsAction);
    expect(b.partstat, Partstat.declined);
  });
}
