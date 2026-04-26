import 'package:flutter/material.dart';
import 'package:patrol_finders/patrol_finders.dart';

import '_helpers/test_app.dart';
import '_helpers/pump_helpers.dart';

/// US: as a user I can open the sidebar, see my calendar(s) and create a
/// new one via the FAB.
void main() {
  patrolWidgetTest('sidebar shows the mocked personal calendar', ($) async {
    await $.pumpWidget(await buildE2EApp());
    await pumpUntilSettled($);

    await $(Icons.list_outlined).tap();

    await $('My calendar').waitUntilVisible();
  });

  patrolWidgetTest('FAB on the sidebar opens the calendar form dialog', ($) async {
    await $.pumpWidget(await buildE2EApp());
    await pumpUntilSettled($);
    await $(Icons.list_outlined).tap();

    await $(FloatingActionButton).tap();

    // Dialog uses "Create" (actionsCreate) as its title in create mode.
    await $('Create').waitUntilVisible();
    await $('Color').waitUntilVisible();
  });

  patrolWidgetTest('cancelling the dialog returns to the sidebar', ($) async {
    await $.pumpWidget(await buildE2EApp());
    await pumpUntilSettled($);
    await $(Icons.list_outlined).tap();
    await $(FloatingActionButton).tap();

    await $('Cancel').tap();

    await $('My calendar').waitUntilVisible();
  });
}
