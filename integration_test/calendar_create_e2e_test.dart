import 'package:flutter/material.dart';
import 'package:patrol_finders/patrol_finders.dart';

import '_helpers/pump_helpers.dart';
import '_helpers/test_app.dart';

/// US: as a user I can create a new calendar from the sidebar.
void main() {
  patrolWidgetTest(
    'filling the form and saving dismisses the dialog',
    ($) async {
      await $.pumpWidget(await buildE2EApp());
      await pumpUntilSettled($);
      await $(Icons.list_outlined).tap();
      await pumpUntilSettled($);
      await $(FloatingActionButton).tap();
      await pumpUntilSettled($);

      await $(TextField).enterText('Holidays');
      await pumpUntilSettled($);
      await $('Save').tap();
      await pumpUntilSettled($);

      // After save the dialog closes — we are back on the sidebar.
      await $('My calendar').waitUntilVisible();
    },
  );

  patrolWidgetTest('saving with empty name shows the validation error',
      ($) async {
    await $.pumpWidget(await buildE2EApp());
    await pumpUntilSettled($);
    await $(Icons.list_outlined).tap();
    await pumpUntilSettled($);
    await $(FloatingActionButton).tap();
    await pumpUntilSettled($);

    await $('Save').tap();
    await pumpUntilSettled($);

    // Dialog stays open — the Color section is still visible.
    await $('Color').waitUntilVisible();
  });
}
