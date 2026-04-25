import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';

import '_helpers/test_app.dart';

/// US: as a user, I can open the settings screen from the AppBar and
/// switch the app language.
void main() {
  patrolWidgetTest(
    'opening Settings reveals the language radio group',
    ($) async {
      await $.pumpWidgetAndSettle(buildTestApp());

      await $(Icons.settings_outlined).tap();

      expect($('Language'), findsOneWidget);
      expect($('English'), findsOneWidget);
      expect($('Français'), findsOneWidget);
    },
  );

  patrolWidgetTest(
    'switching to Français swaps the visible UI to French strings',
    ($) async {
      await $.pumpWidgetAndSettle(buildTestApp());
      await $(Icons.settings_outlined).tap();

      await $('Français').tap();

      // Localized "Settings" title should now be the French version.
      expect($('Paramètres'), findsOneWidget);
    },
  );
}
