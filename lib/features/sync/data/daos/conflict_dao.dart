import 'package:drift/drift.dart';
import 'package:twake_calendar_mobile/core/storage/database/tables.dart';
import 'package:twake_calendar_mobile/core/storage/database/twake_database.dart';

part 'conflict_dao.g.dart';

/// Conflicts DAO.
@DriftAccessor(tables: <Type>[ConflictsTable])
class ConflictDao extends DatabaseAccessor<TwakeDatabase>
    with _$ConflictDaoMixin {
  /// Creates a [ConflictDao].
  ConflictDao(super.db);

  /// Returns every unresolved conflict.
  Future<List<ConflictRow>> selectAll() => select(conflictsTable).get();

  /// Watches the conflict count.
  Stream<int> watchCount() {
    final Selectable<int> q = customSelect(
      'SELECT COUNT(*) AS c FROM ${conflictsTable.actualTableName}',
      readsFrom: <ResultSetImplementation<HasResultSet, dynamic>>{
        conflictsTable,
      },
    ).map((QueryRow row) => row.read<int>('c'));
    return q.watchSingle();
  }

  /// Inserts a new conflict.
  Future<int> insertConflict(ConflictsTableCompanion entry) =>
      into(conflictsTable).insert(entry);

  /// Removes a conflict by [id].
  Future<int> deleteById(int id) =>
      (delete(conflictsTable)..where((ConflictsTable t) => t.id.equals(id)))
          .go();
}
