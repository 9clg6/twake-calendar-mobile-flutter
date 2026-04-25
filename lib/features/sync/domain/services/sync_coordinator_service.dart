import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:twake_calendar_mobile/core/logging/log.dart';
import 'package:twake_calendar_mobile/core/network/retry_policy.dart';
import 'package:twake_calendar_mobile/features/events/data/datasources/caldav_event_remote_datasource.dart';
import 'package:twake_calendar_mobile/features/sync/domain/entities/outbox_entry.dart';
import 'package:twake_calendar_mobile/features/sync/domain/enums/outbox_op_type.dart';
import 'package:twake_calendar_mobile/features/sync/domain/repositories/conflict_repository.dart';
import 'package:twake_calendar_mobile/features/sync/domain/repositories/outbox_repository.dart';

/// Drives the outbox flush loop:
///
/// - Listens to [Connectivity.onConnectivityChanged] (and triggers a flush
///   on every recovery).
/// - Runs the queue in FIFO order. Each entry is dispatched to the
///   matching CalDAV mutation. On 412 the entry is moved to the conflict
///   queue and removed from the outbox. Other failures bump `attempts`
///   and schedule a retry through [RetryPolicy].
/// - Runs at most one flush at a time (a `_flushing` mutex).
final class SyncCoordinatorService {
  /// Creates a [SyncCoordinatorService].
  SyncCoordinatorService({
    required OutboxRepository outboxRepository,
    required ConflictRepository conflictRepository,
    required CaldavEventRemoteDataSource eventRemoteDataSource,
    Connectivity? connectivity,
    RetryPolicy retryPolicy = const RetryPolicy(),
  })  : _outboxRepository = outboxRepository,
        _conflictRepository = conflictRepository,
        _eventRemoteDataSource = eventRemoteDataSource,
        _connectivity = connectivity ?? Connectivity(),
        _retryPolicy = retryPolicy;

  final OutboxRepository _outboxRepository;
  final ConflictRepository _conflictRepository;
  final CaldavEventRemoteDataSource _eventRemoteDataSource;
  final Connectivity _connectivity;
  final RetryPolicy _retryPolicy;

  final Log _log = Log.named('SyncCoordinator');
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  bool _flushing = false;

  /// Starts the coordinator: flushes once and then on every connectivity
  /// recovery.
  Future<void> start() async {
    await flush();
    _subscription ??= _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      if (results.any((ConnectivityResult r) => r != ConnectivityResult.none)) {
        flush();
      }
    });
  }

  /// Stops the coordinator and cancels the connectivity subscription.
  Future<void> stop() async {
    await _subscription?.cancel();
    _subscription = null;
  }

  /// Attempts to flush every pending outbox entry once.
  Future<void> flush() async {
    if (_flushing) return;
    _flushing = true;
    try {
      final List<OutboxEntryEntity> pending =
          await _outboxRepository.getPending();
      for (final OutboxEntryEntity entry in pending) {
        await _flushOne(entry);
      }
    } finally {
      _flushing = false;
    }
  }

  Future<void> _flushOne(OutboxEntryEntity entry) async {
    try {
      switch (entry.opType) {
        case OutboxOpType.put:
          final Map<String, dynamic> payload =
              jsonDecode(entry.payload) as Map<String, dynamic>;
          final String url = payload['url'] as String;
          final List<dynamic> jcal = payload['jcal'] as List<dynamic>;
          await _eventRemoteDataSource.putEvent(
            eventPath: url,
            jcal: jcal,
          );
        case OutboxOpType.delete:
          await _eventRemoteDataSource.deleteEvent(entry.payload);
        case OutboxOpType.move:
          final Map<String, dynamic> payload =
              jsonDecode(entry.payload) as Map<String, dynamic>;
          await _eventRemoteDataSource.moveEvent(
            fromPath: payload['from'] as String,
            toUrl: payload['to'] as String,
          );
        case OutboxOpType.counter:
        case OutboxOpType.partstat:
          // PUT-with-modified-attendee path: the payload mirrors a `put`
          // entry. No iTIP-specific handling yet.
          final Map<String, dynamic> payload =
              jsonDecode(entry.payload) as Map<String, dynamic>;
          final String url = payload['url'] as String;
          final List<dynamic> jcal = payload['jcal'] as List<dynamic>;
          await _eventRemoteDataSource.putEvent(
            eventPath: url,
            jcal: jcal,
          );
      }
      await _outboxRepository.remove(entry.id);
      _log.info('Flushed outbox #${entry.id} (${entry.opType.wireValue})');
    } on DioException catch (e) {
      if (e.response?.statusCode == 412) {
        _log.warning('Conflict on outbox #${entry.id} — moving to queue');
        await _conflictRepository.record(
          eventUid: entry.eventUid,
          calId: entry.calId,
          localJcal: entry.payload,
          serverJcal: e.response?.data?.toString() ?? '',
        );
        await _outboxRepository.remove(entry.id);
      } else {
        await _markFailure(entry, e.message ?? '${e.response?.statusCode}');
      }
    } on Exception catch (e) {
      await _markFailure(entry, e.toString());
    }
  }

  Future<void> _markFailure(OutboxEntryEntity entry, String error) async {
    final Duration delay =
        _retryPolicy.delayFor(entry.attempts.clamp(0, 9));
    await _outboxRepository.markFailure(
      id: entry.id,
      error: error,
      nextRetryAt: DateTime.now().add(delay),
    );
    _log.warning(
      'Outbox #${entry.id} failed (attempt ${entry.attempts + 1}): $error '
      '— retry in ${delay.inSeconds}s',
    );
  }
}
