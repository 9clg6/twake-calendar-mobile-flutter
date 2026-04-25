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

  @override
  Future<void> createCalendar({
    required String id,
    required String name,
    String? description,
    String? color,
  }) async {
    final UserEntity me = await _userRepository.fetchCurrentUser();
    await _remoteDataSource.createCalendar(
      userId: me.openpaasId,
      body: <String, dynamic>{
        'id': id,
        'dav:name': name,
        if (description != null) 'caldav:description': description,
        if (color != null) 'apple:color': color,
      },
    );
  }

  @override
  Future<void> updateCalendar({
    required String calendarLink,
    String? name,
    String? description,
    String? color,
  }) =>
      _remoteDataSource.proppatchCalendar(
        calLink: calendarLink,
        body: <String, dynamic>{
          if (name != null) 'dav:name': name,
          if (description != null) 'caldav:description': description,
          if (color != null) 'apple:color': color,
        },
      );

  @override
  Future<void> deleteCalendar(String calendarLink) =>
      _remoteDataSource.deleteCalendar(calLink: calendarLink);
}
