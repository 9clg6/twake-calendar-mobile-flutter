import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// Authenticated user, as exposed by the side-service `/api/user` endpoint
/// and used across calendars / events / settings features.
@freezed
abstract class UserEntity with _$UserEntity {
  /// Creates a [UserEntity].
  const factory UserEntity({
    required String openpaasId,
    required String email,
    String? firstName,
    String? lastName,
    String? language,
    String? timezone,
    String? avatarUrl,
  }) = _UserEntity;
}
