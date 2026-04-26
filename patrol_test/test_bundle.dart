// HAND-WRITTEN BUNDLE — patrol_cli's auto-generator produces broken imports
// when the project sits in a path containing dashes (workaround documented
// in commit message). Keep this file in sync with files under integration_test/.
// ignore_for_file: type=lint, invalid_use_of_internal_member

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol/src/platform/contracts/contracts.dart';
import 'package:test_api/src/backend/invoker.dart';

import '../integration_test/attendees_e2e_test.dart' as attendees;
import '../integration_test/auth_redirect_e2e_test.dart' as auth_redirect;
import '../integration_test/event_create_e2e_test.dart' as event_create;
import '../integration_test/recurrence_e2e_test.dart' as recurrence;
import '../integration_test/search_e2e_test.dart' as search;
import '../integration_test/settings_e2e_test.dart' as settings;
import '../integration_test/sidebar_e2e_test.dart' as sidebar;
import '../integration_test/view_switch_e2e_test.dart' as view_switch;

Future<void> main() async {
  final platformAutomator = PlatformAutomator(
    config: PlatformAutomatorConfig.defaultConfig(),
  );
  await platformAutomator.initialize();
  final binding = PatrolBinding.ensureInitialized(platformAutomator);
  final testExplorationCompleter = Completer<DartGroupEntry>();

  test('patrol_test_explorer', () {
    final topLevelGroup = Invoker.current!.liveTest.groups.first;
    final dartTestGroup = createDartTestGroup(
      topLevelGroup,
      tags: null,
      excludeTags: null,
    );
    testExplorationCompleter.complete(dartTestGroup);
    print('patrol_test_explorer: obtained Dart-side test hierarchy:');
    reportGroupStructure(dartTestGroup);
  });

  group('integration_test.attendees_e2e_test', attendees.main);
  group('integration_test.auth_redirect_e2e_test', auth_redirect.main);
  group('integration_test.event_create_e2e_test', event_create.main);
  group('integration_test.recurrence_e2e_test', recurrence.main);
  group('integration_test.search_e2e_test', search.main);
  group('integration_test.settings_e2e_test', settings.main);
  group('integration_test.sidebar_e2e_test', sidebar.main);
  group('integration_test.view_switch_e2e_test', view_switch.main);

  final dartTestGroup = await testExplorationCompleter.future;
  final appService = PatrolAppService(topLevelDartTestGroup: dartTestGroup);
  binding.patrolAppService = appService;
  await runAppService(appService);

  await platformAutomator.markPatrolAppServiceReady();

  await appService.testExecutionCompleted;
}
