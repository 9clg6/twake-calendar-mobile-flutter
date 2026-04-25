import 'package:twake_calendar_mobile/core/errors/app_exception.dart';

/// Thrown when a CalDAV protocol error occurs (sync token expired, ACL
/// rejection, malformed multistatus, etc.).
final class CaldavException extends AppException {
  /// Creates a [CaldavException].
  const CaldavException(super.message, {super.cause, super.stackTrace});
}
