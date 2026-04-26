import 'package:patrol_finders/patrol_finders.dart';

/// Pumps frames until the tree visibly stops changing, without relying on
/// `pumpAndSettle` (which never returns when a `CircularProgressIndicator`
/// is on screen — common while the splash screen waits for auth hydration).
Future<void> pumpUntilSettled(
  PatrolTester $, {
  int frames = 30,
  Duration step = const Duration(milliseconds: 100),
}) async {
  for (int i = 0; i < frames; i++) {
    await $.pump(step);
  }
}
