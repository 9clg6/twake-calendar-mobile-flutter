import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:twake_calendar_mobile/core/network/auth_interceptor.dart';
import 'package:twake_calendar_mobile/core/network/dio_client.dart';
import 'package:twake_calendar_mobile/core/network/dio_client_provider.dart';
import 'package:twake_calendar_mobile/core/network/ws_alive_interceptor.dart';
import 'package:twake_calendar_mobile/core/websocket/twake_ws_client.dart';
import 'package:twake_calendar_mobile/core/websocket/twake_ws_client_provider.dart';
import 'package:twake_calendar_mobile/core/websocket/ws_state.dart';
import 'package:twake_calendar_mobile/features/auth/auth_providers.dart';
import 'package:twake_calendar_mobile/features/auth/domain/entities/auth_token.dart';
import 'package:twake_calendar_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:twake_calendar_mobile/features/auth/presentation/controllers/auth_controller.dart';
import 'package:twake_calendar_mobile/features/notifications/notifications_providers.dart';
import 'package:twake_calendar_mobile/features/realtime/presentation/realtime_subscriptions_provider.dart';
import 'package:twake_calendar_mobile/features/realtime/realtime_providers.dart';
import 'package:twake_calendar_mobile/features/sync/domain/services/sync_coordinator_service.dart';
import 'package:twake_calendar_mobile/features/sync/sync_providers.dart';

/// One-shot bootstrap provider attaching the authentication + WS-alive
/// interceptors to the singleton [DioClient], starting the realtime
/// bridge, and initializing the timezone database + the local
/// notifications plugin.
///
/// Watch this provider once at app start (e.g. inside `main.dart` after
/// runApp, or during the splash screen) so HTTP requests carry a Bearer
/// token, mutations are gated on the WebSocket being alive, the realtime
/// bridge keeps the WS in sync with the auth state, and reminders can be
/// scheduled with the right tz offsets.
final FutureProvider<void> kernelProvider = FutureProvider<void>(
  (Ref<AsyncValue<void>> ref) async {
    final DioClient client = ref.watch(dioClientProvider);
    final AuthRepository authRepository = ref.watch(authRepositoryProvider);
    final TwakeWsClient wsClient = ref.watch(twakeWsClientProvider);

    tz_data.initializeTimeZones();
    await ref.watch(localNotificationsInitProvider.future);

    client.attach(
      AuthInterceptor(
        tokenProvider: () async {
          final AuthTokenEntity? current =
              await authRepository.currentToken();
          return current?.accessToken;
        },
        onUnauthorized: () async {
          await ref.read(authControllerProvider.notifier).signOut();
        },
      ),
    );

    client.attach(
      WsAliveInterceptor(
        asserter: () async {
          if (wsClient.currentState != WsConnectionState.connected) {
            await wsClient.connect();
          }
        },
      ),
    );

    // Make sure the realtime bridge is materialized so it starts listening
    // to authControllerProvider transitions.
    ref.watch(realtimeBridgeProvider);
    // Activate the WS subscriptions (sidebar selection -> register, inbound
    // messages -> provider invalidation).
    ref.watch(realtimeSubscriptionsProvider);

    // Boot the sync coordinator: flushes the outbox once and listens to
    // connectivity changes for subsequent retries.
    final SyncCoordinatorService coordinator =
        ref.watch(syncCoordinatorProvider);
    await coordinator.start();
  },
  name: 'kernelProvider',
);
