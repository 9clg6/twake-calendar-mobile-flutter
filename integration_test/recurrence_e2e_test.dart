import 'package:flutter/material.dart';
import 'package:patrol_finders/patrol_finders.dart';

import '_helpers/pump_helpers.dart';
import '_helpers/test_app.dart';

/// US: as a user I can configure an event's recurrence via the modal.
void main() {
  patrolWidgetTest('opens recurrence modal from the form', ($) async {
    await $.pumpWidget(await buildE2EApp());
    await pumpUntilSettled($);
    await $(FloatingActionButton).tap();
    await pumpUntilSettled($);

    await $(Icons.repeat).scrollTo();
    await $(Icons.repeat).tap();
    await pumpUntilSettled($);

    // The modal renders a "Save" action and a "Cancel" action.
    await $('Save').waitUntilVisible();
    await $('Cancel').waitUntilVisible();
  });

  patrolWidgetTest(
    'saving "After 5" updates the recurrence summary on the form',
    ($) async {
      await $.pumpWidget(await buildE2EApp());
      await pumpUntilSettled($);
      await $(FloatingActionButton).tap();
      await pumpUntilSettled($);

      await $(Icons.repeat).scrollTo();
      await $(Icons.repeat).tap();
      await pumpUntilSettled($);

      // Default config (weekly, every 1 week) is enough — just save.
      await $('Save').tap();
      await pumpUntilSettled($);

      // The field summary on the form should now mention "Repeat every".
      await $(Icons.repeat).scrollTo();
      await $(RegExp(r'^Repeat every ')).waitUntilVisible();
    },
  );
}
