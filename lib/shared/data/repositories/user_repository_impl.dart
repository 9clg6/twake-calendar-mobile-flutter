import 'package:twake_calendar_mobile/shared/data/datasources/user_remote_datasource.dart';
import 'package:twake_calendar_mobile/shared/data/mappers/user_mapper.dart';
import 'package:twake_calendar_mobile/shared/data/models/user.remote_model.dart';
import 'package:twake_calendar_mobile/shared/domain/entities/user.dart';
import 'package:twake_calendar_mobile/shared/domain/repositories/user_repository.dart';

/// Default [UserRepository] implementation.
///
/// Caches `fetchUser(id)` lookups in-memory to avoid spamming the side-
/// service when computing owners of multiple shared calendars.
final class UserRepositoryImpl implements UserRepository {
  /// Creates a [UserRepositoryImpl].
  UserRepositoryImpl({required UserRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  final UserRemoteDataSource _remoteDataSource;
  final Map<String, UserEntity> _cache = <String, UserEntity>{};

  @override
  Future<UserEntity> fetchCurrentUser() async {
    final UserRemoteModel raw = await _remoteDataSource.fetchCurrentUser();
    final UserEntity entity = raw.toEntity();
    _cache[entity.openpaasId] = entity;
    return entity;
  }

  @override
  Future<UserEntity> fetchUser(String id) async {
    final UserEntity? cached = _cache[id];
    if (cached != null) return cached;
    final UserEntity entity = (await _remoteDataSource.fetchUser(id)).toEntity();
    _cache[id] = entity;
    return entity;
  }
}
