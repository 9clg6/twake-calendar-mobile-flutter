import 'package:mocktail/mocktail.dart';
import 'package:twake_calendar_mobile/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:twake_calendar_mobile/features/auth/data/datasources/oidc_remote_datasource.dart';
import 'package:twake_calendar_mobile/features/auth/domain/entities/auth_token.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/repositories/calendar_repository.dart';
import 'package:twake_calendar_mobile/features/events/data/datasources/caldav_event_remote_datasource.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/repositories/event_repository.dart';
import 'package:twake_calendar_mobile/features/people/domain/repositories/people_repository.dart';
import 'package:twake_calendar_mobile/features/sync/domain/entities/outbox_entry.dart';
import 'package:twake_calendar_mobile/features/sync/domain/enums/outbox_op_type.dart';
import 'package:twake_calendar_mobile/features/sync/domain/repositories/conflict_repository.dart';
import 'package:twake_calendar_mobile/features/sync/domain/repositories/outbox_repository.dart';

class MockEventRepository extends Mock implements EventRepository {}

class MockCalendarRepository extends Mock implements CalendarRepository {}

class MockPeopleRepository extends Mock implements PeopleRepository {}

class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

class MockOidcRemoteDataSource extends Mock implements OidcRemoteDataSource {}

class MockOutboxRepository extends Mock implements OutboxRepository {}

class MockConflictRepository extends Mock implements ConflictRepository {}

class MockCaldavEventRemoteDataSource extends Mock
    implements CaldavEventRemoteDataSource {}

/// Registers fallback values used by mocktail for argument matchers.
void registerCommonFallbacks() {
  registerFallbackValue(
    const AuthTokenEntity(accessToken: 'fallback'),
  );
  registerFallbackValue(
    CalendarEventEntity(
      uid: 'fallback',
      calId: 'cal',
      url: '/dav/x.ics',
      start: '2026-04-25T09:00:00',
      timezone: 'Europe/Paris',
    ),
  );
  registerFallbackValue(
    OutboxEntryEntity(
      id: 0,
      opType: OutboxOpType.put,
      calId: 'cal',
      eventUid: 'uid',
      payload: '',
      createdAt: DateTime.utc(2026),
    ),
  );
}
