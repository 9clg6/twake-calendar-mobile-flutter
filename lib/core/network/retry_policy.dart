import 'dart:math' as math;

/// Default retry config — mirrors the web frontend (`ky.extend({ retry: ...
/// })`): 10 attempts max, exponential backoff with jitter, capped at 2 min.
class RetryPolicy {
  /// Creates a [RetryPolicy].
  const RetryPolicy({
    this.maxAttempts = 10,
    this.initialDelay = const Duration(seconds: 1),
    this.maxDelay = const Duration(minutes: 2),
  });

  /// Max attempts before giving up.
  final int maxAttempts;

  /// Initial backoff delay.
  final Duration initialDelay;

  /// Hard cap on backoff delay.
  final Duration maxDelay;

  /// Returns the delay before retry [attempt] (0-indexed) using exponential
  /// backoff with full jitter.
  Duration delayFor(int attempt, {math.Random? random}) {
    final math.Random rng = random ?? math.Random();
    final int initialMs = initialDelay.inMilliseconds;
    final int maxMs = maxDelay.inMilliseconds;
    final double exp = math.pow(2, attempt).toDouble();
    final double base = math.min(maxMs.toDouble(), initialMs * exp);
    final double jittered = base * (0.5 + rng.nextDouble());
    final int clamped = jittered.clamp(0, maxMs.toDouble()).toInt();
    return Duration(milliseconds: clamped);
  }
}
