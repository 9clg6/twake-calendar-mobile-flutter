import 'package:freezed_annotation/freezed_annotation.dart';

part 'people_search_request.remote_model.freezed.dart';
part 'people_search_request.remote_model.g.dart';

/// Request body for `POST /api/people/search`.
@freezed
abstract class PeopleSearchRequestRemoteModel
    with _$PeopleSearchRequestRemoteModel {
  /// Creates a [PeopleSearchRequestRemoteModel].
  const factory PeopleSearchRequestRemoteModel({
    required String q,
    @Default(10) int limit,
    @Default(<String>['user', 'contact']) List<String> objectTypes,
  }) = _PeopleSearchRequestRemoteModel;

  /// Deserializes from JSON.
  factory PeopleSearchRequestRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$PeopleSearchRequestRemoteModelFromJson(json);
}
