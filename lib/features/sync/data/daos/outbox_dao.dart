import 'package:drift/drift.dart';
import 'package:twake_calendar_mobile/core/storage/database/tables.dart';
import 'package:twake_calendar_mobile/core/storage/database/twake_database.dart';

part 'outbox_dao.g.dart';

/// Outbox queue DAO.
@DriftAccessor(tables: <Type>[OutboxTable])
class OutboxDao extends DatabaseAccessor<TwakeDatabase> with _$OutboxDaoMixin {
  /// Creates an [OutboxDao].
  OutboxDao(super.db);

  /// Returns every pending entry, ordered by creation date.
  Future<List<OutboxRow>> selectAllPending() {
    final SimpleSelectStatement<OutboxTable, OutboxRow> q = select(outboxTable)
      ..orderBy(<OrderingTerm Function(OutboxTable)>[
        (OutboxTable t) => OrderingTerm(expression: t.createdAt),
      ]);
    return q.get();
  }

  /// Watches the count of pending entries (for the badge).
  Stream<int> watchPendingCount() {
    final Selectable<int> q = customSelect(
      'SELECT COUNT(*) AS c FROM ${outboxTable.actualTableName}',
      readsFrom: <ResultSetImplementation<HasResultSet, dynamic>>{outboxTable},
    ).map((QueryRow row) => row.read<int>('c'));
    return q.watchSingle();
  }

  /// Inserts a new outbox entry.
  Future<int> insertEntry(OutboxTableCompanion entry) =>
      into(outboxTable).insert(entry);

  /// Removes an entry by [id].
  Future<int> deleteById(int id) =>
      (delete(outboxTable)..where((OutboxTable t) => t.id.equals(id))).go();

  /// Updates the failure fields of an entry.
  Future<int> markFailure({
    required int id,
    required String error,
    required DateTime nextRetryAt,
  }) {
    return (update(outboxTable)..where((OutboxTable t) => t.id.equals(id)))
        .write(
      OutboxTableCompanion(
        attempts: const Value<int>.absent(),
        lastError: Value<String?>(error),
        nextRetryAt:
            Value<int>(nextRetryAt.millisecondsSinceEpoch),
      ),
    );
  }
}
