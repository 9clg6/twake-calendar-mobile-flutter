import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar.remote_model.freezed.dart';
part 'calendar.remote_model.g.dart';

/// HAL link returned by the side-service.
@freezed
abstract class CalDavLinkRemoteModel with _$CalDavLinkRemoteModel {
  /// Creates a [CalDavLinkRemoteModel].
  const factory CalDavLinkRemoteModel({String? href}) =
      _CalDavLinkRemoteModel;

  /// Deserializes from JSON.
  factory CalDavLinkRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$CalDavLinkRemoteModelFromJson(json);
}

/// Single calendar entry.
@freezed
abstract class CalendarRemoteModel with _$CalendarRemoteModel {
  /// Creates a [CalendarRemoteModel].
  const factory CalendarRemoteModel({
    required String id,
    @JsonKey(name: 'dav:name') required String name,
    @JsonKey(name: 'apple:color') String? color,
    @JsonKey(name: 'caldav:description') String? description,
    @JsonKey(name: '_links')
    @Default(<String, CalDavLinkRemoteModel>{})
    Map<String, CalDavLinkRemoteModel> links,
  }) = _CalendarRemoteModel;

  /// Deserializes from JSON.
  factory CalendarRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$CalendarRemoteModelFromJson(json);
}

/// Wrapper for the embedded list returned by `/dav/calendars/{user}.json`.
@freezed
abstract class CalendarListEmbeddedRemoteModel
    with _$CalendarListEmbeddedRemoteModel {
  /// Creates a [CalendarListEmbeddedRemoteModel].
  const factory CalendarListEmbeddedRemoteModel({
    @JsonKey(name: 'dav:calendar')
    @Default(<CalendarRemoteModel>[])
    List<CalendarRemoteModel> calendars,
  }) = _CalendarListEmbeddedRemoteModel;

  /// Deserializes from JSON.
  factory CalendarListEmbeddedRemoteModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CalendarListEmbeddedRemoteModelFromJson(json);
}

/// Top-level response returned by the calendar list endpoint.
@freezed
abstract class CalendarListRemoteModel with _$CalendarListRemoteModel {
  /// Creates a [CalendarListRemoteModel].
  const factory CalendarListRemoteModel({
    @JsonKey(name: '_embedded')
    required CalendarListEmbeddedRemoteModel embedded,
  }) = _CalendarListRemoteModel;

  /// Deserializes from JSON.
  factory CalendarListRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$CalendarListRemoteModelFromJson(json);
}
