import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';
import 'package:twake_calendar_mobile/core/network/retry_policy.dart';

void main() {
  group('RetryPolicy', () {
    test('first attempt stays inside [initial * .5, initial * 1.5]', () {
      const RetryPolicy policy = RetryPolicy();
      final math.Random rng = math.Random(0);
      for (int i = 0; i < 50; i++) {
        final Duration d = policy.delayFor(0, random: rng);
        expect(d.inMilliseconds, greaterThanOrEqualTo(500));
        expect(d.inMilliseconds, lessThanOrEqualTo(1500));
      }
    });

    test('caps at maxDelay', () {
      const RetryPolicy policy = RetryPolicy(
        initialDelay: Duration(seconds: 1),
        maxDelay: Duration(seconds: 5),
      );
      final math.Random rng = math.Random(42);
      for (int attempt = 10; attempt < 20; attempt++) {
        final Duration d = policy.delayFor(attempt, random: rng);
        expect(d.inMilliseconds, lessThanOrEqualTo(5000));
      }
    });

    test('grows monotonically (in expectation)', () {
      const RetryPolicy policy = RetryPolicy();
      // Use a deterministic random so the test isn't flaky.
      final math.Random rng = math.Random(0);
      Duration previousMin = Duration.zero;
      for (int attempt = 0; attempt < 6; attempt++) {
        final int initialMs = 1000;
        final int expected =
            math.min(120000, (initialMs * math.pow(2, attempt)).toInt());
        final Duration d = policy.delayFor(attempt, random: rng);
        expect(d.inMilliseconds, lessThanOrEqualTo((expected * 1.5).toInt()));
        if (attempt > 0) {
          expect(
            d.inMilliseconds,
            greaterThanOrEqualTo(previousMin.inMilliseconds ~/ 2),
          );
        }
        previousMin = d;
      }
    });
  });
}
