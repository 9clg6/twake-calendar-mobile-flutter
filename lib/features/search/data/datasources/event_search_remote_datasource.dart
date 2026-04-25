import 'package:twake_calendar_mobile/features/search/data/endpoints/event_search_endpoint.dart';
import 'package:twake_calendar_mobile/features/search/data/models/search_request.remote_model.dart';
import 'package:twake_calendar_mobile/features/search/data/models/search_response.remote_model.dart';

/// Side-service event search remote data source.
abstract interface class EventSearchRemoteDataSource {
  /// Searches events matching [request].
  Future<EventSearchResponseRemoteModel> search(
    EventSearchRequestRemoteModel request,
  );
}

/// Default implementation backed by [EventSearchEndpoint].
final class EventSearchRemoteDataSourceImpl
    implements EventSearchRemoteDataSource {
  /// Creates an [EventSearchRemoteDataSourceImpl].
  const EventSearchRemoteDataSourceImpl({required EventSearchEndpoint endpoint})
      : _endpoint = endpoint;

  final EventSearchEndpoint _endpoint;

  @override
  Future<EventSearchResponseRemoteModel> search(
    EventSearchRequestRemoteModel request,
  ) =>
      _endpoint.search(request);
}
