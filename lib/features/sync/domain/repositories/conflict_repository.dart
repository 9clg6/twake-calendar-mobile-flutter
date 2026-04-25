import 'package:twake_calendar_mobile/features/sync/domain/entities/conflict.dart';

/// Conflict queue repository.
///
/// Pending conflicts are surfaced to the user via the
/// `conflict_resolution_screen.dart` (cf. ARCHITECTURE.md §14.4 — async
/// non-blocking resolution).
abstract interface class ConflictRepository {
  /// Returns every unresolved conflict.
  Future<List<ConflictEntity>> list();

  /// Stream of the unresolved-conflict count for the badge.
  Stream<int> watchCount();

  /// Records a new conflict.
  Future<int> record({
    required String eventUid,
    required String calId,
    required String localJcal,
    required String serverJcal,
  });

  /// Removes the conflict with [id] (after the user resolved it).
  Future<void> resolve(int id);
}
