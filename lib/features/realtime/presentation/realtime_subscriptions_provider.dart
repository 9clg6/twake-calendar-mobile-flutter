import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/logging/log.dart';
import 'package:twake_calendar_mobile/core/websocket/twake_ws_client.dart';
import 'package:twake_calendar_mobile/core/websocket/twake_ws_client_provider.dart';
import 'package:twake_calendar_mobile/core/websocket/ws_state.dart';
import 'package:twake_calendar_mobile/features/calendar_view/presentation/controllers/month_view_controller.dart';
import 'package:twake_calendar_mobile/features/calendars/presentation/controllers/sidebar_controller.dart';
import 'package:twake_calendar_mobile/features/calendars/presentation/controllers/sidebar_state.dart';
import 'package:twake_calendar_mobile/features/realtime/domain/entities/ws_message.dart';
import 'package:twake_calendar_mobile/features/realtime/realtime_providers.dart';

/// Wires three things together:
///
/// 1. Sends `register` / `unregister` payloads through the WebSocket every
///    time the sidebar selection changes.
/// 2. Listens to inbound [WsMessage]s and invalidates the relevant
///    Riverpod providers (currently the month view) so the UI refreshes
///    automatically when the backend signals a change.
/// 3. Logs connection state transitions for diagnostics.
///
/// Watch this provider once during bootstrap so the subscriptions are kept
/// alive throughout the app lifetime.
final Provider<void> realtimeSubscriptionsProvider = Provider<void>(
  (Ref<void> ref) {
    final TwakeWsClient client = ref.watch(twakeWsClientProvider);
    final Log log = Log.named('RealtimeSubscriptions');

    Set<String> previous = <String>{};

    ref.listen<AsyncValue<SidebarState>>(
      sidebarControllerProvider,
      (AsyncValue<SidebarState>? p, AsyncValue<SidebarState> next) {
        final SidebarState? state = next.valueOrNull;
        if (state == null) return;
        if (client.currentState != WsConnectionState.connected) return;

        final Set<String> current = state.selectedCalendarIds;
        final Set<String> toAdd = current.difference(previous);
        final Set<String> toRemove = previous.difference(current);
        if (toAdd.isNotEmpty) client.register(toAdd.toList());
        if (toRemove.isNotEmpty) client.unregister(toRemove.toList());
        previous = current;
      },
    );

    ref.listen<AsyncValue<WsMessage>>(
      wsMessagesProvider,
      (AsyncValue<WsMessage>? prev, AsyncValue<WsMessage> next) {
        final WsMessage? message = next.valueOrNull;
        if (message == null) return;
        switch (message) {
          case WsCalendarChanged(:final String calendarUri):
            log.info(
              'WS: calendar changed at $calendarUri — invalidating month view',
            );
            ref.invalidate(monthViewControllerProvider);
          case WsRegistered(:final List<String> uris):
            log.info('WS: registered to ${uris.length} calendars');
          case WsUnregistered(:final List<String> uris):
            log.info('WS: unregistered from ${uris.length} calendars');
          case WsCalendarListUpdate():
            log.info('WS: calendar list update — invalidating sidebar');
            ref.invalidate(sidebarControllerProvider);
          case WsPong():
            break;
          case WsUnknown(:final Map<String, dynamic> payload):
            log.warning('WS: unknown payload $payload');
        }
      },
    );
  },
  name: 'realtimeSubscriptionsProvider',
);
