import 'package:twake_calendar_mobile/core/storage/database/twake_database.dart';
import 'package:twake_calendar_mobile/features/sync/data/daos/conflict_dao.dart';
import 'package:twake_calendar_mobile/features/sync/domain/entities/conflict.dart';
import 'package:twake_calendar_mobile/features/sync/domain/repositories/conflict_repository.dart';

/// Drift-backed [ConflictRepository].
final class ConflictRepositoryImpl implements ConflictRepository {
  /// Creates a [ConflictRepositoryImpl].
  const ConflictRepositoryImpl({required ConflictDao dao}) : _dao = dao;

  final ConflictDao _dao;

  @override
  Future<List<ConflictEntity>> list() async {
    final List<ConflictRow> rows = await _dao.selectAll();
    return rows.map(_toEntity).toList(growable: false);
  }

  @override
  Stream<int> watchCount() => _dao.watchCount();

  @override
  Future<int> record({
    required String eventUid,
    required String calId,
    required String localJcal,
    required String serverJcal,
  }) {
    final DateTime now = DateTime.now();
    return _dao.insertConflict(
      ConflictsTableCompanion.insert(
        eventUid: eventUid,
        calId: calId,
        localJcal: localJcal,
        serverJcal: serverJcal,
        occurredAt: now.millisecondsSinceEpoch,
      ),
    );
  }

  @override
  Future<void> resolve(int id) async {
    await _dao.deleteById(id);
  }

  ConflictEntity _toEntity(ConflictRow row) => ConflictEntity(
        id: row.id,
        eventUid: row.eventUid,
        calId: row.calId,
        localJcal: row.localJcal,
        serverJcal: row.serverJcal,
        occurredAt: DateTime.fromMillisecondsSinceEpoch(row.occurredAt),
      );
}
