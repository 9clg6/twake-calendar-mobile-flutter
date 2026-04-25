import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';

import '_helpers/test_app.dart';

/// US: as a user, I can switch between Month / Week / Day views from the
/// AppBar PopupMenuButton.
void main() {
  patrolWidgetTest(
    'opening the view-kind menu shows the three modes',
    ($) async {
      await $.pumpWidgetAndSettle(buildTestApp());

      // The view-kind icon button uses calendar_view_month by default.
      await $(Icons.calendar_view_month).tap();

      expect($('Month'), findsOneWidget);
      expect($('Week'), findsOneWidget);
      expect($('Day'), findsOneWidget);
    },
  );

  patrolWidgetTest(
    'switching to Week view replaces the body with a TimeGridView',
    ($) async {
      await $.pumpWidgetAndSettle(buildTestApp());

      await $(Icons.calendar_view_month).tap();
      await $('Week').tap();

      // Week view has 7 day-letter labels along the top of the grid.
      expect($('Mon'), findsOneWidget);
      expect($('Sun'), findsOneWidget);
    },
  );
}
