import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.remote_model.freezed.dart';
part 'user.remote_model.g.dart';

/// JSON shape returned by the side-service `GET /api/user` endpoint.
@freezed
abstract class UserRemoteModel with _$UserRemoteModel {
  /// Creates a [UserRemoteModel].
  const factory UserRemoteModel({
    required String id,
    @JsonKey(name: 'preferredEmail') String? preferredEmail,
    @JsonKey(name: 'firstname') String? firstName,
    @JsonKey(name: 'lastname') String? lastName,
    @JsonKey(name: 'avatarUrl') String? avatarUrl,
  }) = _UserRemoteModel;

  /// Deserializes from JSON.
  factory UserRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$UserRemoteModelFromJson(json);
}
