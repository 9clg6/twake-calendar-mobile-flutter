/// State of the [TwakeWsClient] connection.
enum WsConnectionState {
  /// No active socket — initial state or after a logout.
  disconnected,

  /// Currently connecting (ticket fetch + handshake).
  connecting,

  /// Socket is open and ready to register/unregister.
  connected,

  /// Connection lost; a reconnection attempt is scheduled.
  reconnecting,
}
