import 'package:freezed_annotation/freezed_annotation.dart';

part 'people_search_response.remote_model.freezed.dart';
part 'people_search_response.remote_model.g.dart';

/// Single name returned by people search.
@freezed
abstract class PeopleNameRemoteModel with _$PeopleNameRemoteModel {
  /// Creates a [PeopleNameRemoteModel].
  const factory PeopleNameRemoteModel({String? displayName}) =
      _PeopleNameRemoteModel;

  /// Deserializes from JSON.
  factory PeopleNameRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$PeopleNameRemoteModelFromJson(json);
}

/// Single email entry returned by people search.
@freezed
abstract class PeopleEmailRemoteModel with _$PeopleEmailRemoteModel {
  /// Creates a [PeopleEmailRemoteModel].
  const factory PeopleEmailRemoteModel({String? value}) =
      _PeopleEmailRemoteModel;

  /// Deserializes from JSON.
  factory PeopleEmailRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$PeopleEmailRemoteModelFromJson(json);
}

/// Hit returned by `POST /api/people/search`.
@freezed
abstract class PeopleHitRemoteModel with _$PeopleHitRemoteModel {
  /// Creates a [PeopleHitRemoteModel].
  const factory PeopleHitRemoteModel({
    required String id,
    String? objectType,
    @Default(<PeopleNameRemoteModel>[]) List<PeopleNameRemoteModel> names,
    @JsonKey(name: 'emailAddresses')
    @Default(<PeopleEmailRemoteModel>[])
    List<PeopleEmailRemoteModel> emails,
  }) = _PeopleHitRemoteModel;

  /// Deserializes from JSON.
  factory PeopleHitRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$PeopleHitRemoteModelFromJson(json);
}
