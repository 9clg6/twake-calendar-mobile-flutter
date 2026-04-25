import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:twake_calendar_mobile/features/sync/domain/entities/outbox_entry.dart';
import 'package:twake_calendar_mobile/features/sync/domain/enums/outbox_op_type.dart';
import 'package:twake_calendar_mobile/features/sync/domain/services/sync_coordinator_service.dart';

import '../../../../_helpers/mocks.dart';

class _FakeConnectivity extends Fake implements Connectivity {
  final StreamController<List<ConnectivityResult>> _controller =
      StreamController<List<ConnectivityResult>>.broadcast();

  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      _controller.stream;

  void emit(List<ConnectivityResult> results) =>
      _controller.add(results);
}

OutboxEntryEntity buildEntry({
  int id = 1,
  OutboxOpType opType = OutboxOpType.put,
  String payload = '',
  int attempts = 0,
}) {
  return OutboxEntryEntity(
    id: id,
    opType: opType,
    calId: 'cal',
    eventUid: 'uid',
    payload: payload,
    attempts: attempts,
    createdAt: DateTime.utc(2026),
  );
}

DioException dio412() => DioException(
      requestOptions: RequestOptions(),
      response: Response<Object>(
        requestOptions: RequestOptions(),
        statusCode: 412,
        data: 'server-jcal',
      ),
    );

DioException dio500() => DioException(
      requestOptions: RequestOptions(),
      response: Response<Object>(
        requestOptions: RequestOptions(),
        statusCode: 500,
      ),
      message: 'server error',
    );

void main() {
  late MockOutboxRepository outbox;
  late MockConflictRepository conflicts;
  late MockCaldavEventRemoteDataSource caldav;
  late _FakeConnectivity connectivity;
  late SyncCoordinatorService coordinator;

  setUpAll(registerCommonFallbacks);

  setUp(() {
    outbox = MockOutboxRepository();
    conflicts = MockConflictRepository();
    caldav = MockCaldavEventRemoteDataSource();
    connectivity = _FakeConnectivity();
    coordinator = SyncCoordinatorService(
      outboxRepository: outbox,
      conflictRepository: conflicts,
      eventRemoteDataSource: caldav,
      connectivity: connectivity,
    );
  });

  group('flush — successful PUT', () {
    setUp(() {
      when(outbox.getPending).thenAnswer((_) async => <OutboxEntryEntity>[
            buildEntry(
              payload: jsonEncode(<String, dynamic>{
                'url': '/dav/x.ics',
                'jcal': <dynamic>[],
              }),
            ),
          ]);
      when(() => caldav.putEvent(
            eventPath: any(named: 'eventPath'),
            jcal: any(named: 'jcal'),
          )).thenAnswer((_) async {});
      when(() => outbox.remove(any())).thenAnswer((_) async {});
    });

    test('forwards the URL to the data source', () async {
      await coordinator.flush();

      verify(() => caldav.putEvent(
            eventPath: '/dav/x.ics',
            jcal: any(named: 'jcal'),
          )).called(1);
    });

    test('removes the entry from the outbox on success', () async {
      await coordinator.flush();

      verify(() => outbox.remove(1)).called(1);
    });
  });

  group('flush — DELETE op', () {
    test('forwards the payload as the event path', () async {
      when(outbox.getPending).thenAnswer((_) async => <OutboxEntryEntity>[
            buildEntry(opType: OutboxOpType.delete, payload: '/dav/x.ics'),
          ]);
      when(() => caldav.deleteEvent(any())).thenAnswer((_) async {});
      when(() => outbox.remove(any())).thenAnswer((_) async {});

      await coordinator.flush();

      verify(() => caldav.deleteEvent('/dav/x.ics')).called(1);
    });
  });

  group('flush — 412 conflict', () {
    setUp(() {
      when(outbox.getPending).thenAnswer((_) async => <OutboxEntryEntity>[
            buildEntry(payload: 'local-jcal'),
          ]);
      when(() => caldav.putEvent(
            eventPath: any(named: 'eventPath'),
            jcal: any(named: 'jcal'),
          )).thenThrow(dio412());
      when(() => conflicts.record(
            eventUid: any(named: 'eventUid'),
            calId: any(named: 'calId'),
            localJcal: any(named: 'localJcal'),
            serverJcal: any(named: 'serverJcal'),
          )).thenAnswer((_) async => 99);
      when(() => outbox.remove(any())).thenAnswer((_) async {});
    });

    test('records the conflict with localJcal from the outbox payload',
        () async {
      // Payload must be JSON for the put branch — adjust the entry here.
      when(outbox.getPending).thenAnswer((_) async => <OutboxEntryEntity>[
            buildEntry(
              payload: jsonEncode(<String, dynamic>{
                'url': '/dav/x.ics',
                'jcal': <dynamic>[],
              }),
            ),
          ]);

      await coordinator.flush();

      verify(() => conflicts.record(
            eventUid: 'uid',
            calId: 'cal',
            localJcal: any(named: 'localJcal'),
            serverJcal: any(named: 'serverJcal'),
          )).called(1);
    });

    test('removes the entry from the outbox after recording the conflict',
        () async {
      when(outbox.getPending).thenAnswer((_) async => <OutboxEntryEntity>[
            buildEntry(
              payload: jsonEncode(<String, dynamic>{
                'url': '/dav/x.ics',
                'jcal': <dynamic>[],
              }),
            ),
          ]);

      await coordinator.flush();

      verify(() => outbox.remove(1)).called(1);
    });
  });

  group('flush — non-412 failure', () {
    setUp(() {
      when(outbox.getPending).thenAnswer((_) async => <OutboxEntryEntity>[
            buildEntry(
              payload: jsonEncode(<String, dynamic>{
                'url': '/dav/x.ics',
                'jcal': <dynamic>[],
              }),
            ),
          ]);
      when(() => caldav.putEvent(
            eventPath: any(named: 'eventPath'),
            jcal: any(named: 'jcal'),
          )).thenThrow(dio500());
      when(() => outbox.markFailure(
            id: any(named: 'id'),
            error: any(named: 'error'),
            nextRetryAt: any(named: 'nextRetryAt'),
          )).thenAnswer((_) async {});
    });

    test('schedules a retry via outbox.markFailure', () async {
      await coordinator.flush();

      verify(() => outbox.markFailure(
            id: 1,
            error: any(named: 'error'),
            nextRetryAt: any(named: 'nextRetryAt'),
          )).called(1);
    });

    test('does not remove the entry from the outbox', () async {
      await coordinator.flush();

      verifyNever(() => outbox.remove(any()));
    });

    test('does not record a conflict', () async {
      await coordinator.flush();

      verifyNever(() => conflicts.record(
            eventUid: any(named: 'eventUid'),
            calId: any(named: 'calId'),
            localJcal: any(named: 'localJcal'),
            serverJcal: any(named: 'serverJcal'),
          ));
    });
  });

  group('start', () {
    test('flushes once at start', () async {
      when(outbox.getPending).thenAnswer((_) async => <OutboxEntryEntity>[]);

      await coordinator.start();

      verify(outbox.getPending).called(1);
      await coordinator.stop();
    });

    test('flushes again when connectivity becomes available', () async {
      int callCount = 0;
      when(outbox.getPending).thenAnswer((_) async {
        callCount += 1;
        return const <OutboxEntryEntity>[];
      });

      await coordinator.start();
      connectivity.emit(<ConnectivityResult>[ConnectivityResult.wifi]);
      // Allow the broadcast to be processed.
      await Future<void>.delayed(Duration.zero);

      expect(callCount, greaterThanOrEqualTo(2));
      await coordinator.stop();
    });

    test('does not flush on a `none` connectivity event', () async {
      int callCount = 0;
      when(outbox.getPending).thenAnswer((_) async {
        callCount += 1;
        return const <OutboxEntryEntity>[];
      });

      await coordinator.start();
      connectivity.emit(<ConnectivityResult>[ConnectivityResult.none]);
      await Future<void>.delayed(Duration.zero);

      // Initial flush counted, no extra one for `none`.
      expect(callCount, 1);
      await coordinator.stop();
    });
  });
}
