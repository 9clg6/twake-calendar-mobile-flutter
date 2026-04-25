import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_events_params.freezed.dart';

/// Parameters for the event search use case.
@freezed
abstract class SearchEventsParams with _$SearchEventsParams {
  /// Creates a [SearchEventsParams].
  const factory SearchEventsParams({
    required String query,
    @Default(<String>[]) List<String> calendarIds,
    @Default(<String>[]) List<String> organizers,
    @Default(<String>[]) List<String> attendees,
  }) = _SearchEventsParams;
}
