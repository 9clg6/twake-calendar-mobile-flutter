import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:twake_calendar_mobile/shared/data/models/user.remote_model.dart';

part 'user_endpoint.g.dart';

/// Side-service user endpoint.
@RestApi()
abstract class UserEndpoint {
  /// Creates a [UserEndpoint].
  factory UserEndpoint(Dio dio) = _UserEndpoint;

  /// Returns the currently authenticated user (and their configurations).
  @GET('/api/user')
  Future<UserRemoteModel> getCurrentUser();

  /// Returns a user by their OpenPaaS id.
  @GET('/api/users/{id}')
  Future<UserRemoteModel> getUser(@Path('id') String id);
}
