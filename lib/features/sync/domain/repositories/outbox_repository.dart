import 'package:twake_calendar_mobile/features/sync/domain/entities/outbox_entry.dart';
import 'package:twake_calendar_mobile/features/sync/domain/enums/outbox_op_type.dart';

/// Outbox queue repository.
///
/// Holds pending mutations that could not reach the backend (offline,
/// transient error). The [SyncCoordinator] flushes the queue in FIFO order
/// when connectivity returns.
abstract interface class OutboxRepository {
  /// Returns every pending entry, ordered by creation date (FIFO).
  Future<List<OutboxEntryEntity>> getPending();

  /// Streams the count of pending entries (used to drive a badge).
  Stream<int> watchPendingCount();

  /// Enqueues a mutation, returning the assigned id.
  Future<int> enqueue({
    required OutboxOpType opType,
    required String calId,
    required String eventUid,
    required String payload,
  });

  /// Removes the entry with [id] (after a successful flush).
  Future<void> remove(int id);

  /// Updates the failure metadata for an entry that could not be flushed.
  Future<void> markFailure({
    required int id,
    required String error,
    required DateTime nextRetryAt,
  });
}
