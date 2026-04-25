import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_request.remote_model.freezed.dart';
part 'search_request.remote_model.g.dart';

/// Calendar identifier sent inside an event search query.
@freezed
abstract class SearchCalendarRefRemoteModel
    with _$SearchCalendarRefRemoteModel {
  /// Creates a [SearchCalendarRefRemoteModel].
  const factory SearchCalendarRefRemoteModel({
    required String calendarId,
    required String userId,
  }) = _SearchCalendarRefRemoteModel;

  /// Deserializes from JSON.
  factory SearchCalendarRefRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$SearchCalendarRefRemoteModelFromJson(json);
}

/// Body sent to `POST /calendar/api/events/search`.
@freezed
abstract class EventSearchRequestRemoteModel
    with _$EventSearchRequestRemoteModel {
  /// Creates an [EventSearchRequestRemoteModel].
  const factory EventSearchRequestRemoteModel({
    required String query,
    @Default(<SearchCalendarRefRemoteModel>[])
    List<SearchCalendarRefRemoteModel> calendars,
    @Default(<String>[]) List<String> organizers,
    @Default(<String>[]) List<String> attendees,
  }) = _EventSearchRequestRemoteModel;

  /// Deserializes from JSON.
  factory EventSearchRequestRemoteModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$EventSearchRequestRemoteModelFromJson(json);
}
