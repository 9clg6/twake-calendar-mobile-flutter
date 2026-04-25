import 'package:twake_calendar_mobile/core/errors/app_exception.dart';

/// Thrown when an authentication step (OIDC) fails.
final class AuthException extends AppException {
  /// Creates an [AuthException].
  const AuthException(super.message, {super.cause, super.stackTrace});
}
