import 'package:twake_calendar_mobile/features/calendars/data/endpoints/caldav_calendar_endpoint.dart';
import 'package:twake_calendar_mobile/features/calendars/data/models/calendar.remote_model.dart';

/// Default scope used by the web frontend (`personal+shared+delegated+
/// subscribed`).
const Map<String, dynamic> _defaultScope = <String, dynamic>{
  'personal': 'true',
  'sharedDelegationStatus': 'accepted',
  'sharedPublicSubscription': 'true',
  'withRights': 'true',
};

/// CalDAV calendar remote data source.
abstract interface class CaldavCalendarRemoteDataSource {
  /// Lists every calendar accessible to [userId].
  Future<List<CalendarRemoteModel>> fetchCalendars({required String userId});
}

/// Default implementation backed by [CaldavCalendarEndpoint].
final class CaldavCalendarRemoteDataSourceImpl
    implements CaldavCalendarRemoteDataSource {
  /// Creates a [CaldavCalendarRemoteDataSourceImpl].
  const CaldavCalendarRemoteDataSourceImpl({
    required CaldavCalendarEndpoint endpoint,
  }) : _endpoint = endpoint;

  final CaldavCalendarEndpoint _endpoint;

  @override
  Future<List<CalendarRemoteModel>> fetchCalendars({
    required String userId,
  }) async {
    final CalendarListRemoteModel response =
        await _endpoint.listCalendars(userId, _defaultScope);
    return response.embedded.calendars;
  }
}
