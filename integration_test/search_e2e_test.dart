import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';

import '_helpers/pump_helpers.dart';
import '_helpers/test_app.dart';

/// US: as a user I can search events and see the mocked match.
void main() {
  patrolWidgetTest('search screen surfaces the mocked hit', ($) async {
    await $.pumpWidget(await buildE2EApp());
    await pumpUntilSettled($);

    await $(Icons.search).tap();
    await pumpUntilSettled($);
    await $(TextField).enterText('mock');
    // The search controller fires only on submit (Enter key) — emulate it.
    await $.tester.testTextInput.receiveAction(TextInputAction.done);
    await pumpUntilSettled($);

    await $('Mock match').waitUntilVisible();
  });

  patrolWidgetTest('empty input shows the empty-state message', ($) async {
    await $.pumpWidget(await buildE2EApp());
    await pumpUntilSettled($);

    await $(Icons.search).tap();
    await pumpUntilSettled($);

    await $('No events found').waitUntilVisible();
  });
}
