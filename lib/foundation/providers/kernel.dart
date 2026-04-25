import 'package:flutter_riverpod/flutter_riverpod.dart';
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
import 'package:twake_calendar_mobile/features/realtime/presentation/realtime_subscriptions_provider.dart';
import 'package:twake_calendar_mobile/features/realtime/realtime_providers.dart';

/// One-shot bootstrap provider attaching the authentication + WS-alive
/// interceptors to the singleton [DioClient] and starting the realtime
/// bridge.
///
/// Watch this provider once at app start (e.g. inside `main.dart` after
/// runApp, or during the splash screen) so HTTP requests carry a Bearer
/// token, mutations are gated on the WebSocket being alive, and the
/// realtime bridge keeps the WS in sync with the auth state.
final FutureProvider<void> kernelProvider = FutureProvider<void>(
  (Ref<AsyncValue<void>> ref) async {
    final DioClient client = ref.watch(dioClientProvider);
    final AuthRepository authRepository = ref.watch(authRepositoryProvider);
    final TwakeWsClient wsClient = ref.watch(twakeWsClientProvider);

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
  },
  name: 'kernelProvider',
);
