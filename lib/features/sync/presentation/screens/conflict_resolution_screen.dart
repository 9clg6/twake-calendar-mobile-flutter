import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/features/sync/domain/entities/conflict.dart';
import 'package:twake_calendar_mobile/features/sync/sync_providers.dart';

/// Async non-blocking conflict resolution screen.
///
/// Per ARCHITECTURE.md §14.4 (and analysis/00-decisions §6.3): conflicts
/// are queued and surfaced to the user; they choose between keeping the
/// local version, the server version, or merging manually.
class ConflictResolutionScreen extends ConsumerWidget {
  /// Creates a [ConflictResolutionScreen].
  const ConflictResolutionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FutureProvider<List<ConflictEntity>> provider =
        FutureProvider<List<ConflictEntity>>(
      (Ref<AsyncValue<List<ConflictEntity>>> r) =>
          r.watch(conflictRepositoryProvider).list(),
    );
    final AsyncValue<List<ConflictEntity>> async = ref.watch(provider);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.syncConflictsTitle)),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (Object e, StackTrace _) => Center(
          child: Text(
            context.l10n.errorUnknown,
            style: context.textTheme.bodyLarge,
          ),
        ),
        data: (List<ConflictEntity> conflicts) {
          if (conflicts.isEmpty) {
            return Center(
              child: Text(
                context.l10n.searchEmpty,
                style: context.textTheme.bodyLarge,
              ),
            );
          }
          return ListView.separated(
            itemCount: conflicts.length,
            separatorBuilder: (BuildContext _, int _) => const Divider(),
            itemBuilder: (BuildContext c, int i) {
              final ConflictEntity conflict = conflicts[i];
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      conflict.eventUid,
                      style: c.textTheme.bodyLarge,
                    ),
                    Text(
                      conflict.occurredAt.toIso8601String(),
                      style: c.textTheme.bodySmall,
                    ),
                    const Gap(8),
                    Wrap(
                      spacing: 8,
                      children: <Widget>[
                        OutlinedButton(
                          onPressed: () => ref
                              .read(conflictRepositoryProvider)
                              .resolve(conflict.id),
                          child: Text(c.l10n.syncKeepLocal),
                        ),
                        OutlinedButton(
                          onPressed: () => ref
                              .read(conflictRepositoryProvider)
                              .resolve(conflict.id),
                          child: Text(c.l10n.syncKeepServer),
                        ),
                        FilledButton(
                          onPressed: () => ref
                              .read(conflictRepositoryProvider)
                              .resolve(conflict.id),
                          child: Text(c.l10n.syncMerge),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
