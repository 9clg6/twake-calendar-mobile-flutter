import 'package:twake_calendar_mobile/features/search/data/datasources/event_search_remote_datasource.dart';
import 'package:twake_calendar_mobile/features/search/data/mappers/search_mapper.dart';
import 'package:twake_calendar_mobile/features/search/data/models/search_request.remote_model.dart';
import 'package:twake_calendar_mobile/features/search/data/models/search_response.remote_model.dart';
import 'package:twake_calendar_mobile/features/search/domain/entities/search_hit.dart';
import 'package:twake_calendar_mobile/features/search/domain/params/search_events_params.dart';
import 'package:twake_calendar_mobile/features/search/domain/repositories/event_search_repository.dart';

/// Default [EventSearchRepository].
final class EventSearchRepositoryImpl implements EventSearchRepository {
  /// Creates an [EventSearchRepositoryImpl].
  const EventSearchRepositoryImpl({
    required EventSearchRemoteDataSource remoteDataSource,
    required String currentUserId,
  })  : _remoteDataSource = remoteDataSource,
        _currentUserId = currentUserId;

  final EventSearchRemoteDataSource _remoteDataSource;
  final String _currentUserId;

  @override
  Future<List<SearchHitEntity>> search(SearchEventsParams params) async {
    final EventSearchRequestRemoteModel request =
        EventSearchRequestRemoteModel(
      query: params.query,
      calendars: params.calendarIds
          .map((String id) => SearchCalendarRefRemoteModel(
                calendarId: id,
                userId: _currentUserId,
              ))
          .toList(),
      organizers: params.organizers,
      attendees: params.attendees,
    );
    final EventSearchResponseRemoteModel response =
        await _remoteDataSource.search(request);
    return response.results
        .map((SearchHitRemoteModel m) => m.toEntity())
        .toList();
  }
}
