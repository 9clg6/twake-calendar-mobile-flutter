import 'package:twake_calendar_mobile/core/errors/app_exception.dart';

/// Thrown when parsing or building a jCal/iCalendar payload fails.
final class IcalException extends AppException {
  /// Creates an [IcalException].
  const IcalException(super.message, {super.cause, super.stackTrace});
}
