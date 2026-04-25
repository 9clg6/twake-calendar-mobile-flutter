import 'package:dio/dio.dart' show Dio;
import 'package:retrofit/retrofit.dart';
import 'package:twake_calendar_mobile/features/people/data/models/people_search_request.remote_model.dart';
import 'package:twake_calendar_mobile/features/people/data/models/people_search_response.remote_model.dart';

part 'people_search_endpoint.g.dart';

/// Side-service people search endpoint.
@RestApi()
abstract class PeopleSearchEndpoint {
  /// Creates a [PeopleSearchEndpoint].
  factory PeopleSearchEndpoint(Dio dio) = _PeopleSearchEndpoint;

  /// Searches users + contacts matching [request.q].
  @POST('/api/people/search')
  Future<List<PeopleHitRemoteModel>> search(
    @Body() PeopleSearchRequestRemoteModel request,
  );
}
