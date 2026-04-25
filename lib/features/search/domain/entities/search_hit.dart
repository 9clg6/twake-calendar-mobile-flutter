import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_hit.freezed.dart';

/// Hit returned by an event search.
@freezed
abstract class SearchHitEntity with _$SearchHitEntity {
  /// Creates a [SearchHitEntity].
  const factory SearchHitEntity({
    required String uid,
    String? summary,
    String? start,
    String? end,
    String? organizer,
    String? location,
  }) = _SearchHitEntity;
}
