import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/network/dio_client_provider.dart';
import 'package:twake_calendar_mobile/features/calendars/data/datasources/caldav_calendar_remote_datasource.dart';
import 'package:twake_calendar_mobile/features/calendars/data/endpoints/caldav_calendar_endpoint.dart';
import 'package:twake_calendar_mobile/features/calendars/data/repositories/calendar_repository_impl.dart';
import 'package:twake_calendar_mobile/features/calendars/data/repositories/fake_calendar_repository.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/repositories/calendar_repository.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/usecases/create_calendar_usecase.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/usecases/delete_calendar_usecase.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/usecases/get_calendars_usecase.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/usecases/update_calendar_usecase.dart';
import 'package:twake_calendar_mobile/shared/shared_providers.dart';

/// CalDAV endpoint provider.
final Provider<CaldavCalendarEndpoint> caldavCalendarEndpointProvider =
    Provider<CaldavCalendarEndpoint>(
  (Ref<CaldavCalendarEndpoint> ref) =>
      CaldavCalendarEndpoint(ref.watch(dioClientProvider).dio),
  name: 'caldavCalendarEndpointProvider',
);

/// CalDAV calendar remote data source provider.
final Provider<CaldavCalendarRemoteDataSource>
    caldavCalendarRemoteDataSourceProvider =
    Provider<CaldavCalendarRemoteDataSource>(
  (Ref<CaldavCalendarRemoteDataSource> ref) =>
      CaldavCalendarRemoteDataSourceImpl(
    endpoint: ref.watch(caldavCalendarEndpointProvider),
  ),
  name: 'caldavCalendarRemoteDataSourceProvider',
);

/// Toggle to swap the real CalDAV-backed repository with [FakeCalendarRepository]
/// for offline UI development.
///
/// Override the provider in tests / dev runs:
/// `ProviderScope(overrides: [useFakeCalendarRepositoryProvider.overrideWithValue(true)])`.
final Provider<bool> useFakeCalendarRepositoryProvider = Provider<bool>(
  (Ref<bool> ref) => false,
  name: 'useFakeCalendarRepositoryProvider',
);

/// Calendar repository provider.
final Provider<CalendarRepository> calendarRepositoryProvider =
    Provider<CalendarRepository>(
  (Ref<CalendarRepository> ref) {
    if (ref.watch(useFakeCalendarRepositoryProvider)) {
      return const FakeCalendarRepository();
    }
    return CalendarRepositoryImpl(
      remoteDataSource: ref.watch(caldavCalendarRemoteDataSourceProvider),
      userRepository: ref.watch(userRepositoryProvider),
    );
  },
  name: 'calendarRepositoryProvider',
);

/// `GetCalendarsUseCase` provider.
final Provider<GetCalendarsUseCase> getCalendarsUseCaseProvider =
    Provider<GetCalendarsUseCase>(
  (Ref<GetCalendarsUseCase> ref) => GetCalendarsUseCase(
    calendarRepository: ref.watch(calendarRepositoryProvider),
  ),
  name: 'getCalendarsUseCaseProvider',
);

/// `CreateCalendarUseCase` provider.
final Provider<CreateCalendarUseCase> createCalendarUseCaseProvider =
    Provider<CreateCalendarUseCase>(
  (Ref<CreateCalendarUseCase> ref) => CreateCalendarUseCase(
    calendarRepository: ref.watch(calendarRepositoryProvider),
  ),
  name: 'createCalendarUseCaseProvider',
);

/// `UpdateCalendarUseCase` provider.
final Provider<UpdateCalendarUseCase> updateCalendarUseCaseProvider =
    Provider<UpdateCalendarUseCase>(
  (Ref<UpdateCalendarUseCase> ref) => UpdateCalendarUseCase(
    calendarRepository: ref.watch(calendarRepositoryProvider),
  ),
  name: 'updateCalendarUseCaseProvider',
);

/// `DeleteCalendarUseCase` provider.
final Provider<DeleteCalendarUseCase> deleteCalendarUseCaseProvider =
    Provider<DeleteCalendarUseCase>(
  (Ref<DeleteCalendarUseCase> ref) => DeleteCalendarUseCase(
    calendarRepository: ref.watch(calendarRepositoryProvider),
  ),
  name: 'deleteCalendarUseCaseProvider',
);
