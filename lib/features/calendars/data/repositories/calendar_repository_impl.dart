import 'package:twake_calendar_mobile/features/calendars/data/datasources/caldav_calendar_remote_datasource.dart';
import 'package:twake_calendar_mobile/features/calendars/data/mappers/calendar_mapper.dart';
import 'package:twake_calendar_mobile/features/calendars/data/models/calendar.remote_model.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/entities/calendar.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/repositories/calendar_repository.dart';
import 'package:twake_calendar_mobile/shared/domain/entities/user.dart';
import 'package:twake_calendar_mobile/shared/domain/repositories/user_repository.dart';

/// Default [CalendarRepository] backed by the CalDAV endpoint.
final class CalendarRepositoryImpl implements CalendarRepository {
  /// Creates a [CalendarRepositoryImpl].
  const CalendarRepositoryImpl({
    required CaldavCalendarRemoteDataSource remoteDataSource,
    required UserRepository userRepository,
  })  : _remoteDataSource = remoteDataSource,
        _userRepository = userRepository;

  final CaldavCalendarRemoteDataSource _remoteDataSource;
  final UserRepository _userRepository;

  @override
  Future<List<CalendarEntity>> fetchCalendars() async {
    final UserEntity me = await _userRepository.fetchCurrentUser();
    final List<CalendarRemoteModel> raw =
        await _remoteDataSource.fetchCalendars(userId: me.openpaasId);
    return raw
        .map((CalendarRemoteModel m) => m.toEntity(owner: me))
        .toList(growable: false);
  }
}
