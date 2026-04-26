import 'package:flutter/material.dart';
import 'package:patrol_finders/patrol_finders.dart';

import '_helpers/pump_helpers.dart';
import '_helpers/test_app.dart';

/// US: as a user I can search a contact and add them as an attendee.
void main() {
  patrolWidgetTest(
    'typing in the attendee search shows the mocked contact',
    ($) async {
      await $.pumpWidget(await buildE2EApp());
      await pumpUntilSettled($);
      await $(FloatingActionButton).tap();
      await pumpUntilSettled($);

      // The form has multiple TextFields — the attendee search is the
      // second one (after the title). Scroll if needed and type.
      final PatrolFinder attendees = $(TextField).at(1);
      await attendees.scrollTo();
      await attendees.enterText('ali');
      await pumpUntilSettled($);

      await $('Alice Martin').waitUntilVisible();
    },
  );

  patrolWidgetTest('tapping a suggestion adds an attendee chip', ($) async {
    await $.pumpWidget(await buildE2EApp());
    await pumpUntilSettled($);
    await $(FloatingActionButton).tap();
    await pumpUntilSettled($);

    final PatrolFinder attendees = $(TextField).at(1);
    await attendees.scrollTo();
    await attendees.enterText('ali');
    await pumpUntilSettled($);
    await $('Alice Martin').tap();
    await pumpUntilSettled($);

    await $(InputChip).waitUntilVisible();
  });
}
