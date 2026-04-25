import 'package:twake_calendar_mobile/shared/data/endpoints/user_endpoint.dart';
import 'package:twake_calendar_mobile/shared/data/models/user.remote_model.dart';

/// Side-service user data source.
abstract interface class UserRemoteDataSource {
  /// Fetches the current authenticated user.
  Future<UserRemoteModel> fetchCurrentUser();

  /// Fetches a user by id.
  Future<UserRemoteModel> fetchUser(String id);
}

/// Default implementation backed by [UserEndpoint].
final class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  /// Creates a [UserRemoteDataSourceImpl].
  const UserRemoteDataSourceImpl({required UserEndpoint endpoint})
      : _endpoint = endpoint;

  final UserEndpoint _endpoint;

  @override
  Future<UserRemoteModel> fetchCurrentUser() => _endpoint.getCurrentUser();

  @override
  Future<UserRemoteModel> fetchUser(String id) => _endpoint.getUser(id);
}
