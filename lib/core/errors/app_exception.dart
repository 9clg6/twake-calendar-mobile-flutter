/// Root of all custom exceptions thrown by the application.
///
/// Concrete subclasses should be `final` and live in `lib/core/errors/`.
abstract class AppException implements Exception {
  /// Creates an [AppException].
  const AppException(this.message, {this.cause, this.stackTrace});

  /// Human readable message (English, never user-facing — see localization).
  final String message;

  /// Optional underlying cause.
  final Object? cause;

  /// Optional stack trace captured at the throw site.
  final StackTrace? stackTrace;

  @override
  String toString() =>
      '$runtimeType: $message${cause != null ? ' (cause: $cause)' : ''}';
}
