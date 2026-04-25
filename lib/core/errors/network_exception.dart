import 'package:twake_calendar_mobile/core/errors/app_exception.dart';

/// Thrown when an HTTP/network operation fails.
final class NetworkException extends AppException {
  /// Creates a [NetworkException].
  const NetworkException(
    super.message, {
    this.statusCode,
    super.cause,
    super.stackTrace,
  });

  /// HTTP status code if available (null on connection errors).
  final int? statusCode;

  /// Whether the failure stems from a missing or expired authentication.
  bool get isUnauthorized => statusCode == 401;

  /// Whether the failure stems from an ETag/sync-token conflict.
  bool get isConflict => statusCode == 412 || statusCode == 409;
}
