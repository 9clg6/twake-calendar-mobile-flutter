import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/storage/database/twake_database_provider.dart';
import 'package:twake_calendar_mobile/features/sync/data/daos/conflict_dao.dart';
import 'package:twake_calendar_mobile/features/sync/data/daos/outbox_dao.dart';
import 'package:twake_calendar_mobile/features/sync/data/repositories/conflict_repository_impl.dart';
import 'package:twake_calendar_mobile/features/sync/data/repositories/outbox_repository_impl.dart';
import 'package:twake_calendar_mobile/features/sync/domain/repositories/conflict_repository.dart';
import 'package:twake_calendar_mobile/features/sync/domain/repositories/outbox_repository.dart';

/// Outbox repository provider.
final Provider<OutboxRepository> outboxRepositoryProvider =
    Provider<OutboxRepository>(
  (Ref<OutboxRepository> ref) => OutboxRepositoryImpl(
    dao: OutboxDao(ref.watch(twakeDatabaseProvider)),
  ),
  name: 'outboxRepositoryProvider',
);

/// Conflict repository provider.
final Provider<ConflictRepository> conflictRepositoryProvider =
    Provider<ConflictRepository>(
  (Ref<ConflictRepository> ref) => ConflictRepositoryImpl(
    dao: ConflictDao(ref.watch(twakeDatabaseProvider)),
  ),
  name: 'conflictRepositoryProvider',
);

/// Stream of the conflict count, used by the badge.
final StreamProvider<int> conflictCountProvider = StreamProvider<int>(
  (Ref<AsyncValue<int>> ref) =>
      ref.watch(conflictRepositoryProvider).watchCount(),
  name: 'conflictCountProvider',
);

/// Stream of the outbox pending count.
final StreamProvider<int> outboxPendingCountProvider = StreamProvider<int>(
  (Ref<AsyncValue<int>> ref) =>
      ref.watch(outboxRepositoryProvider).watchPendingCount(),
  name: 'outboxPendingCountProvider',
);
