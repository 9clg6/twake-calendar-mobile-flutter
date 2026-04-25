import 'package:freezed_annotation/freezed_annotation.dart';

part 'conflict.freezed.dart';

/// Sync conflict awaiting user resolution (412 Precondition Failed during
/// outbox flush, ETag mismatch).
@freezed
abstract class ConflictEntity with _$ConflictEntity {
  /// Creates a [ConflictEntity].
  const factory ConflictEntity({
    required int id,
    required String eventUid,
    required String calId,
    required String localJcal,
    required String serverJcal,
    required DateTime occurredAt,
  }) = _ConflictEntity;
}
