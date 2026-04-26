import 'package:flutter/material.dart';
import 'package:patrol_finders/patrol_finders.dart';

import '_helpers/pump_helpers.dart';
import '_helpers/test_app.dart';

/// US: as a user I can switch between Month / Week / Day views.
void main() {
  patrolWidgetTest('PopupMenu lists Month / Week / Day', ($) async {
    await $.pumpWidget(await buildE2EApp());
    await pumpUntilSettled($);

    await $(Icons.calendar_view_month).tap();
    await pumpUntilSettled($);

    await $('Month').waitUntilVisible();
    await $('Week').waitUntilVisible();
    await $('Day').waitUntilVisible();
  });

  patrolWidgetTest(
    'selecting Week reveals the time-grid day labels',
    ($) async {
      await $.pumpWidget(await buildE2EApp());
      await pumpUntilSettled($);

      await $(Icons.calendar_view_month).tap();
      await pumpUntilSettled($);
      await $('Week').tap();
      await pumpUntilSettled($);

      // Week column headers contain "Mon …" and "Sun …" (weekday + day-num).
      await $(RegExp(r'^Mon \d')).waitUntilVisible();
      await $(RegExp(r'^Sun \d')).waitUntilVisible();
    },
  );

  patrolWidgetTest('selecting Day shows a time grid', ($) async {
    await $.pumpWidget(await buildE2EApp());
    await pumpUntilSettled($);

    await $(Icons.calendar_view_month).tap();
    await pumpUntilSettled($);
    await $('Day').tap();
    await pumpUntilSettled($);

    await $('00:00').waitUntilVisible();
  });
}
