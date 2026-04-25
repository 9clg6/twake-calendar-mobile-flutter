import 'package:dio/dio.dart';

/// Asserts the WebSocket is alive before any mutation request.
typedef WsAliveAsserter = Future<void> Function();

const Set<String> _kMutatingMethods = <String>{
  'POST',
  'PUT',
  'PATCH',
  'DELETE',
  'MOVE',
  'PROPPATCH',
  'ACL',
};

/// Dio interceptor that mirrors the web frontend behaviour
/// (`assertWebSocketAlive` before any mutation).
///
/// Without an active WebSocket, the side-service can desync with the CalDAV
/// store; refusing the mutation is preferable to leaving the user with a
/// stale view.
final class WsAliveInterceptor extends Interceptor {
  /// Creates a [WsAliveInterceptor].
  WsAliveInterceptor({required WsAliveAsserter asserter}) : _asserter = asserter;

  final WsAliveAsserter _asserter;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_kMutatingMethods.contains(options.method.toUpperCase())) {
      await _asserter();
    }
    handler.next(options);
  }
}
