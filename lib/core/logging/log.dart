import 'dart:developer' as developer;

/// Severity levels for application logs.
enum LogLevel {
  /// Debugging only — never enabled in production.
  debug,

  /// Informational events.
  info,

  /// Recoverable issues.
  warning,

  /// Errors that disrupt a flow but don't crash the app.
  error,
}

/// Lightweight named logger.
///
/// Single entry point for application logs (cf. GUIDELINES §2.4.7). Production
/// builds should redirect [LogLevel.warning] and above to a remote sink (e.g.
/// Sentry) by configuring [Log.sink].
final class Log {
  Log._(this._tag);

  /// Creates a logger for [tag] (typically the class name).
  factory Log.named(String tag) => Log._(tag);

  final String _tag;

  /// Optional sink invoked for every log entry. Defaults to no-op.
  static void Function(LogLevel level, String tag, String message,
      {Object? error, StackTrace? stackTrace}) sink = _devSink;

  static void _devSink(
    LogLevel level,
    String tag,
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    developer.log(
      message,
      name: tag,
      level: _osLogLevel(level),
      error: error,
      stackTrace: stackTrace,
    );
  }

  static int _osLogLevel(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return 500;
      case LogLevel.info:
        return 800;
      case LogLevel.warning:
        return 900;
      case LogLevel.error:
        return 1000;
    }
  }

  /// Logs a debug message.
  void debug(String message) => sink(LogLevel.debug, _tag, message);

  /// Logs an informational message.
  void info(String message) => sink(LogLevel.info, _tag, message);

  /// Logs a warning.
  void warning(String message, [Object? error, StackTrace? stackTrace]) =>
      sink(LogLevel.warning, _tag, message,
          error: error, stackTrace: stackTrace);

  /// Logs an error.
  void error(String message, [Object? error, StackTrace? stackTrace]) =>
      sink(LogLevel.error, _tag, message,
          error: error, stackTrace: stackTrace);
}
