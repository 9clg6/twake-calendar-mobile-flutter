import 'package:twake_calendar_mobile/shared/data/models/user.remote_model.dart';
import 'package:twake_calendar_mobile/shared/domain/entities/user.dart';

/// Mapper [UserRemoteModel] -> [UserEntity].
extension UserRemoteModelX on UserRemoteModel {
  /// Converts the JSON DTO into the domain entity.
  UserEntity toEntity() => UserEntity(
        openpaasId: id,
        email: preferredEmail ?? '',
        firstName: firstName,
        lastName: lastName,
        avatarUrl: avatarUrl,
      );
}
