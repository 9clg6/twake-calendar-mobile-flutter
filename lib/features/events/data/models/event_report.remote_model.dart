import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_report.remote_model.freezed.dart';
part 'event_report.remote_model.g.dart';

/// Single item returned inside a calendar REPORT response.
///
/// `data` carries the raw jCal (a nested list of dynamics that the [JCalCodec]
/// then turns into a `CalendarEventEntity`). `etag` is preserved for
/// optimistic concurrency on subsequent PUT/DELETE.
@freezed
abstract class CalendarItemRemoteModel with _$CalendarItemRemoteModel {
  /// Creates a [CalendarItemRemoteModel].
  const factory CalendarItemRemoteModel({
    String? etag,
    int? status,
    @JsonKey(name: 'data') required List<dynamic> data,
  }) = _CalendarItemRemoteModel;

  /// Deserializes from JSON.
  factory CalendarItemRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$CalendarItemRemoteModelFromJson(json);
}

/// `_embedded` block of the REPORT response.
@freezed
abstract class CalendarReportEmbeddedRemoteModel
    with _$CalendarReportEmbeddedRemoteModel {
  /// Creates a [CalendarReportEmbeddedRemoteModel].
  const factory CalendarReportEmbeddedRemoteModel({
    @JsonKey(name: 'dav:item')
    @Default(<CalendarItemRemoteModel>[])
    List<CalendarItemRemoteModel> items,
    @JsonKey(name: 'sync-token') String? syncToken,
  }) = _CalendarReportEmbeddedRemoteModel;

  /// Deserializes from JSON.
  factory CalendarReportEmbeddedRemoteModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CalendarReportEmbeddedRemoteModelFromJson(json);
}

/// Top-level REPORT response.
@freezed
abstract class CalendarReportRemoteModel with _$CalendarReportRemoteModel {
  /// Creates a [CalendarReportRemoteModel].
  const factory CalendarReportRemoteModel({
    @JsonKey(name: '_embedded')
    required CalendarReportEmbeddedRemoteModel embedded,
  }) = _CalendarReportRemoteModel;

  /// Deserializes from JSON.
  factory CalendarReportRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$CalendarReportRemoteModelFromJson(json);
}
