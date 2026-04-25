import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:twake_calendar_mobile/features/search/data/models/search_request.remote_model.dart';
import 'package:twake_calendar_mobile/features/search/data/models/search_response.remote_model.dart';

part 'event_search_endpoint.g.dart';

/// Side-service event search endpoint.
@RestApi()
abstract class EventSearchEndpoint {
  /// Creates an [EventSearchEndpoint].
  factory EventSearchEndpoint(Dio dio) = _EventSearchEndpoint;

  /// Searches events matching [request].
  ///
  /// `limit` and `offset` mirror the hard-coded values used by the web
  /// frontend (`limit=30&offset=0`).
  @POST('/calendar/api/events/search')
  Future<EventSearchResponseRemoteModel> search(
    @Body() EventSearchRequestRemoteModel request, {
    @Query('limit') int limit = 30,
    @Query('offset') int offset = 0,
  });
}
