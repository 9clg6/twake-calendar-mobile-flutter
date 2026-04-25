import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_response.remote_model.freezed.dart';
part 'search_response.remote_model.g.dart';

/// Single hit returned by the side-service search endpoint.
@freezed
abstract class SearchHitRemoteModel with _$SearchHitRemoteModel {
  /// Creates a [SearchHitRemoteModel].
  const factory SearchHitRemoteModel({
    required String uid,
    String? summary,
    String? start,
    String? end,
    String? organizer,
    String? location,
  }) = _SearchHitRemoteModel;

  /// Deserializes from JSON.
  factory SearchHitRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$SearchHitRemoteModelFromJson(json);
}

/// Top-level response of `/calendar/api/events/search`.
@freezed
abstract class EventSearchResponseRemoteModel
    with _$EventSearchResponseRemoteModel {
  /// Creates an [EventSearchResponseRemoteModel].
  const factory EventSearchResponseRemoteModel({
    @Default(0) int total,
    @Default(<SearchHitRemoteModel>[]) List<SearchHitRemoteModel> results,
  }) = _EventSearchResponseRemoteModel;

  /// Deserializes from JSON.
  factory EventSearchResponseRemoteModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$EventSearchResponseRemoteModelFromJson(json);
}
