import 'package:flutter_test/flutter_test.dart';
import 'package:twake_calendar_mobile/features/notifications/domain/services/local_reminder_service.dart';

void main() {
  group('parseIcalDuration', () {
    test('-PT15M -> -15 minutes', () {
      expect(parseIcalDuration('-PT15M'), const Duration(minutes: -15));
    });

    test('-PT1H -> -1 hour', () {
      expect(parseIcalDuration('-PT1H'), const Duration(hours: -1));
    });

    test('-P1D -> -1 day', () {
      expect(parseIcalDuration('-P1D'), const Duration(days: -1));
    });

    test('PT45M -> +45 minutes', () {
      expect(parseIcalDuration('PT45M'), const Duration(minutes: 45));
    });

    test('-P1DT2H30M', () {
      expect(
        parseIcalDuration('-P1DT2H30M'),
        -const Duration(days: 1, hours: 2, minutes: 30),
      );
    });

    test('returns null on malformed input', () {
      expect(parseIcalDuration('not-a-duration'), isNull);
    });
  });
}
