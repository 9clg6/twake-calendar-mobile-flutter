import 'package:twake_calendar_mobile/core/storage/database/twake_database.dart';
import 'package:twake_calendar_mobile/features/sync/data/daos/outbox_dao.dart';
import 'package:twake_calendar_mobile/features/sync/domain/entities/outbox_entry.dart';
import 'package:twake_calendar_mobile/features/sync/domain/enums/outbox_op_type.dart';
import 'package:twake_calendar_mobile/features/sync/domain/repositories/outbox_repository.dart';

/// Drift-backed [OutboxRepository].
final class OutboxRepositoryImpl implements OutboxRepository {
  /// Creates an [OutboxRepositoryImpl].
  const OutboxRepositoryImpl({required OutboxDao dao}) : _dao = dao;

  final OutboxDao _dao;

  @override
  Future<List<OutboxEntryEntity>> getPending() async {
    final List<OutboxRow> rows = await _dao.selectAllPending();
    return rows.map(_toEntity).toList(growable: false);
  }

  @override
  Stream<int> watchPendingCount() => _dao.watchPendingCount();

  @override
  Future<int> enqueue({
    required OutboxOpType opType,
    required String calId,
    required String eventUid,
    required String payload,
  }) {
    final DateTime now = DateTime.now();
    return _dao.insertEntry(
      OutboxTableCompanion.insert(
        opType: opType.wireValue,
        calId: calId,
        eventUid: eventUid,
        payload: payload,
        createdAt: now.millisecondsSinceEpoch,
      ),
    );
  }

  @override
  Future<void> remove(int id) async {
    await _dao.deleteById(id);
  }

  @override
  Future<void> markFailure({
    required int id,
    required String error,
    required DateTime nextRetryAt,
  }) async {
    await _dao.markFailure(id: id, error: error, nextRetryAt: nextRetryAt);
  }

  OutboxEntryEntity _toEntity(OutboxRow row) => OutboxEntryEntity(
        id: row.id,
        opType: OutboxOpType.fromWire(row.opType),
        calId: row.calId,
        eventUid: row.eventUid,
        payload: row.payload,
        createdAt: DateTime.fromMillisecondsSinceEpoch(row.createdAt),
        attempts: row.attempts,
        lastError: row.lastError,
        nextRetryAt: row.nextRetryAt > 0
            ? DateTime.fromMillisecondsSinceEpoch(row.nextRetryAt)
            : null,
      );
}
