import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/config/app_config_provider.dart';
import 'package:twake_calendar_mobile/core/network/dio_client_provider.dart';
import 'package:twake_calendar_mobile/core/websocket/twake_ws_client.dart';

/// Singleton [TwakeWsClient].
///
/// `keepAlive: true` because the connection must outlive any single screen.
/// The kernel triggers `connect()` once authentication succeeds.
final Provider<TwakeWsClient> twakeWsClientProvider = Provider<TwakeWsClient>(
  (Ref<TwakeWsClient> ref) {
    final TwakeWsClient client = TwakeWsClient(
      config: ref.watch(appConfigProvider),
      dio: ref.watch(dioClientProvider).dio,
    );
    ref.onDispose(client.dispose);
    return client;
  },
  name: 'twakeWsClientProvider',
);
