import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:twake_calendar_mobile/core/storage/database/tables.dart';
import 'package:twake_calendar_mobile/features/sync/data/daos/conflict_dao.dart';
import 'package:twake_calendar_mobile/features/sync/data/daos/outbox_dao.dart';

part 'twake_database.g.dart';

/// Drift-backed local database used for offline reads and the outbox.
///
/// Single SQLite file; schema migrations are linear (`schemaVersion` bumped
/// on each table change). DAOs are registered here so each feature can
/// access its own queries without touching the database internals.
@DriftDatabase(
  tables: <Type>[
    CalendarsTable,
    EventsTable,
    OutboxTable,
    ConflictsTable,
    SyncMetaTable,
  ],
  daos: <Type>[
    OutboxDao,
    ConflictDao,
  ],
)
class TwakeDatabase extends _$TwakeDatabase {
  /// Creates a [TwakeDatabase] backed by the file produced by
  /// [_openConnection].
  TwakeDatabase() : super(_openConnection());

  /// Test-friendly constructor accepting a custom executor.
  TwakeDatabase.forExecutor(super.executor);

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final File file = File(p.join(dir.path, 'twake_calendar.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
