import 'package:twake_calendar_mobile/shared/domain/entities/user.dart';

/// Contract for accessing user data (current + by id).
abstract interface class UserRepository {
  /// Returns the currently authenticated user.
  Future<UserEntity> fetchCurrentUser();

  /// Returns a user by id, with light caching to avoid hitting the server
  /// repeatedly for owners of shared calendars.
  Future<UserEntity> fetchUser(String id);
}
