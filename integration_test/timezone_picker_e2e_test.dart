import 'package:flutter/material.dart';
import 'package:patrol_finders/patrol_finders.dart';

import '_helpers/pump_helpers.dart';
import '_helpers/test_app.dart';

/// US: as a user I can browse timezones and search them.
void main() {
  patrolWidgetTest('settings timezone row opens the picker', ($) async {
    await $.pumpWidget(await buildE2EApp());
    await pumpUntilSettled($);
    await $(Icons.settings_outlined).tap();
    await pumpUntilSettled($);

    await $(Icons.public).tap();
    await pumpUntilSettled($);

    await $('Timezone').waitUntilVisible();
    await $(Icons.search).waitUntilVisible();
  });

  patrolWidgetTest('searching narrows the timezone list', ($) async {
    await $.pumpWidget(await buildE2EApp());
    await pumpUntilSettled($);
    await $(Icons.settings_outlined).tap();
    await pumpUntilSettled($);
    await $(Icons.public).tap();
    await pumpUntilSettled($);

    await $(TextField).enterText('Paris');
    await pumpUntilSettled($);

    await $('Europe/Paris').waitUntilVisible();
  });
}
