import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twake_calendar_mobile/features/sync/domain/enums/outbox_op_type.dart';

part 'outbox_entry.freezed.dart';

/// Pending mutation queued offline, ready to be replayed when connectivity
/// returns.
@freezed
abstract class OutboxEntryEntity with _$OutboxEntryEntity {
  /// Creates an [OutboxEntryEntity].
  const factory OutboxEntryEntity({
    required int id,
    required OutboxOpType opType,
    required String calId,
    required String eventUid,
    required String payload,
    required DateTime createdAt,
    @Default(0) int attempts,
    String? lastError,
    DateTime? nextRetryAt,
  }) = _OutboxEntryEntity;
}
