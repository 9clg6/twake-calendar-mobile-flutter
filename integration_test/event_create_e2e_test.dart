import 'package:flutter/material.dart';
import 'package:patrol_finders/patrol_finders.dart';

import '_helpers/pump_helpers.dart';
import '_helpers/test_app.dart';

/// US: as a user I can open the create-event form, fill the title and save.
void main() {
  patrolWidgetTest('FAB opens an empty event form', ($) async {
    await $.pumpWidget(await buildE2EApp());
    await pumpUntilSettled($);

    await $(FloatingActionButton).tap();
    await pumpUntilSettled($);

    await $('Create event').waitUntilVisible();
    await $(TextField).first.waitUntilVisible();
  });

  patrolWidgetTest(
    'typing a title and tapping Save dismisses the form',
    ($) async {
      await $.pumpWidget(await buildE2EApp());
      await pumpUntilSettled($);

      await $(FloatingActionButton).tap();
      await pumpUntilSettled($);
      await $(TextField).first.enterText('My new meeting');
      await pumpUntilSettled($);
      // The save action is the AppBar IconButton with the check icon —
      // tap it via the IconButton type so we don't depend on the icon being
      // hit-testable when the soft keyboard is up.
      await $(IconButton).last.tap();
      await pumpUntilSettled($);

      await $(FloatingActionButton).waitUntilVisible();
    },
  );

  patrolWidgetTest('All-day toggle is interactive', ($) async {
    await $.pumpWidget(await buildE2EApp());
    await pumpUntilSettled($);
    await $(FloatingActionButton).tap();
    await pumpUntilSettled($);

    await $(SwitchListTile).waitUntilVisible();
    await $(SwitchListTile).tap();
    await $(SwitchListTile).tap();
  });
}
