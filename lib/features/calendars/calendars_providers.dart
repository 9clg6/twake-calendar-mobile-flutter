import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/features/calendars/data/repositories/fake_calendar_repository.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/repositories/calendar_repository.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/usecases/get_calendars_usecase.dart';

/// Provides the [CalendarRepository] used by the feature.
///
/// Currently bound to [FakeCalendarRepository]; will be replaced with the real
/// CalDAV-backed implementation once `caldav_calendar_endpoint` and the
/// associated data source are wired up.
final Provider<CalendarRepository> calendarRepositoryProvider =
    Provider<CalendarRepository>(
  (Ref<CalendarRepository> ref) => const FakeCalendarRepository(),
  name: 'calendarRepositoryProvider',
);

/// Provides [GetCalendarsUseCase].
final Provider<GetCalendarsUseCase> getCalendarsUseCaseProvider =
    Provider<GetCalendarsUseCase>(
  (Ref<GetCalendarsUseCase> ref) => GetCalendarsUseCase(
    calendarRepository: ref.watch(calendarRepositoryProvider),
  ),
  name: 'getCalendarsUseCaseProvider',
);
