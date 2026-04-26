import 'package:flutter/material.dart';
import 'package:patrol_finders/patrol_finders.dart';

import '_helpers/test_app.dart';
import '_helpers/pump_helpers.dart';

/// US: as a user opening the app I am redirected to login when not
/// authenticated, to the calendar layout when authenticated.
void main() {
  patrolWidgetTest(
    'logged-out user lands on the login screen',
    ($) async {
      await $.pumpWidget(await buildE2EApp(loggedIn: false));
      await pumpUntilSettled($);

      await $(FilledButton).waitUntilVisible();
    },
  );

  patrolWidgetTest(
    'logged-in user lands on the calendar layout (FAB visible)',
    ($) async {
      await $.pumpWidget(await buildE2EApp());
      await pumpUntilSettled($);

      await $(FloatingActionButton).waitUntilVisible();
    },
  );
}
