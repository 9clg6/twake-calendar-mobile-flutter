import 'package:twake_calendar_mobile/features/calendars/domain/entities/calendar.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/repositories/calendar_repository.dart';
import 'package:twake_calendar_mobile/shared/domain/entities/user.dart';

/// In-memory fake repository used while the real CalDAV data source is not
/// wired up. Allows the UI layer to render against representative data.
final class FakeCalendarRepository implements CalendarRepository {
  /// Creates a [FakeCalendarRepository].
  const FakeCalendarRepository();

  @override
  Future<List<CalendarEntity>> fetchCalendars() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    const UserEntity owner = UserEntity(
      openpaasId: 'me',
      email: 'me@example.com',
      firstName: 'Demo',
      lastName: 'User',
    );
    const UserEntity colleague = UserEntity(
      openpaasId: 'alice',
      email: 'alice@example.com',
      firstName: 'Alice',
      lastName: 'Martin',
    );
    return const <CalendarEntity>[
      CalendarEntity(
        id: 'me-personal',
        link: '/calendars/me/me-personal.json',
        name: 'My calendar',
        owner: owner,
        colorLight: '#F67E35',
        colorDark: '#F67E35',
      ),
      CalendarEntity(
        id: 'alice-shared',
        link: '/calendars/alice/alice-shared.json',
        name: 'Alice — team',
        owner: colleague,
        colorLight: '#3F51B5',
        colorDark: '#3F51B5',
      ),
      CalendarEntity(
        id: 'alice-delegated',
        link: '/calendars/alice/alice-delegated.json',
        name: 'Alice — delegated',
        owner: colleague,
        delegated: true,
        colorLight: '#009688',
        colorDark: '#009688',
      ),
    ];
  }

  @override
  Future<void> createCalendar({
    required String id,
    required String name,
    String? description,
    String? color,
  }) async {
    // Fake repository: no-op.
  }

  @override
  Future<void> updateCalendar({
    required String calendarLink,
    String? name,
    String? description,
    String? color,
  }) async {
    // Fake repository: no-op.
  }

  @override
  Future<void> deleteCalendar(String calendarLink) async {
    // Fake repository: no-op.
  }
}
