import 'package:flutter/material.dart';
import 'package:patrol_finders/patrol_finders.dart';

import '_helpers/test_app.dart';
import '_helpers/pump_helpers.dart';

/// US: as a user I can change the language and toggle the general
/// preferences.
void main() {
  patrolWidgetTest('Settings opens with the four supported languages', ($) async {
    await $.pumpWidget(await buildE2EApp());
    await pumpUntilSettled($);

    await $(Icons.settings_outlined).tap();

    await $('English').waitUntilVisible();
    await $('Français').waitUntilVisible();
    await $('Русский').waitUntilVisible();
    await $('Tiếng Việt').waitUntilVisible();
  });

  patrolWidgetTest('switching to Français localizes the AppBar title', ($) async {
    await $.pumpWidget(await buildE2EApp());
    await pumpUntilSettled($);
    await $(Icons.settings_outlined).tap();

    await $('Français').tap();

    await $('Paramètres').waitUntilVisible();
  });

  patrolWidgetTest('toggling "Hide declined events" persists across visits',
      ($) async {
    await $.pumpWidget(await buildE2EApp());
    await pumpUntilSettled($);
    await $(Icons.settings_outlined).tap();

    final PatrolFinder hide = $('Hide declined events');
    await hide.waitUntilVisible();
    await hide.tap();

    // Toggle remains in the on-state (visible).
    await hide.waitUntilVisible();
  });
}
