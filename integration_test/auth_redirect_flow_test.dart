import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';

import '_helpers/test_app.dart';

/// US: as a user, when I open the app I am redirected to the login screen
/// if I'm not authenticated, and to the calendar layout if I am.
void main() {
  patrolWidgetTest(
    'logged-out user lands on the login screen',
    ($) async {
      await $.pumpWidgetAndSettle(buildTestApp(loggedIn: false));

      await $.waitUntilVisible($('Twake Calendar'));
      expect($('Confirm'), findsOneWidget);
    },
  );

  patrolWidgetTest(
    'logged-in user lands on the calendar layout',
    ($) async {
      await $.pumpWidgetAndSettle(buildTestApp());

      // The FAB on the calendar layout carries the localized "Create"
      // string.
      await $.waitUntilVisible($('Create'));
    },
  );
}
