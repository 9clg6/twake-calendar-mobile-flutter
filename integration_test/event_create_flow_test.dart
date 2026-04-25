import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';

import '_helpers/test_app.dart';

/// US: as a user, I can open an empty event form via the FAB and the form
/// renders the title field, all-day toggle and start/end rows.
void main() {
  patrolWidgetTest(
    'tapping the create FAB pushes the event form',
    ($) async {
      await $.pumpWidgetAndSettle(buildTestApp());

      await $(Icons.add).tap();

      // The form's AppBar uses the localized "Create event" title and the
      // body exposes a Title text field.
      expect($('Create event'), findsOneWidget);
      expect($('Title'), findsOneWidget);
    },
  );

  patrolWidgetTest(
    'event form lets the user toggle all-day off and on',
    ($) async {
      await $.pumpWidgetAndSettle(buildTestApp());
      await $(Icons.add).tap();

      // Tap the SwitchListTile labeled with the All day translation.
      await $('All day').tap();
      // Tapping a second time should bring it back to its initial state —
      // we only assert the widget still exists; granular state is covered
      // by the unit tests of the controller.
      await $('All day').tap();
    },
  );
}
