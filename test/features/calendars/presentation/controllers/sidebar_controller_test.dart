import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:twake_calendar_mobile/features/calendars/calendars_providers.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/entities/calendar.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/entities/calendar_invite.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/enums/access_right.dart';
import 'package:twake_calendar_mobile/features/calendars/presentation/controllers/sidebar_controller.dart';
import 'package:twake_calendar_mobile/features/calendars/presentation/controllers/sidebar_state.dart';
import 'package:twake_calendar_mobile/shared/domain/entities/user.dart';

import '../../../../_helpers/mocks.dart';

const UserEntity _me = UserEntity(openpaasId: 'me', email: 'me@example.com');
const UserEntity _alice =
    UserEntity(openpaasId: 'alice', email: 'alice@example.com');

CalendarEntity _ownCalendar() => const CalendarEntity(
      id: 'me-1',
      link: '/calendars/me/me-1.json',
      name: 'Mine',
      owner: _me,
    );

CalendarEntity _sharedCalendar() => const CalendarEntity(
      id: 'alice-shared',
      link: '/calendars/alice/alice-shared.json',
      name: 'Shared',
      owner: _alice,
      invite: <CalendarInviteEntity>[
        CalendarInviteEntity(
          href: 'mailto:me@example.com',
          principal: 'urn:x-twake:principal:me',
          access: AccessRight.editor,
          inviteStatus: 1,
        ),
      ],
    );

CalendarEntity _delegatedCalendar() => const CalendarEntity(
      id: 'alice-delegated',
      link: '/calendars/alice/alice-delegated.json',
      name: 'Delegated',
      owner: _alice,
      delegated: true,
    );

ProviderContainer _containerWith(MockCalendarRepository repo) {
  final ProviderContainer container = ProviderContainer(
    overrides: <Override>[
      calendarRepositoryProvider.overrideWithValue(repo),
    ],
  );
  return container;
}

void main() {
  late MockCalendarRepository repo;

  setUp(() {
    repo = MockCalendarRepository();
  });

  group('SidebarController bucketing', () {
    test('places own calendar in myCalendars', () async {
      when(repo.fetchCalendars)
          .thenAnswer((_) async => <CalendarEntity>[_ownCalendar()]);
      final ProviderContainer container = _containerWith(repo);
      addTearDown(container.dispose);

      final SidebarState state =
          await container.read(sidebarControllerProvider.future);

      expect(state.myCalendars, hasLength(1));
    });

    test('places invited calendar in sharedCalendars', () async {
      when(repo.fetchCalendars)
          .thenAnswer((_) async => <CalendarEntity>[_sharedCalendar()]);
      final ProviderContainer container = _containerWith(repo);
      addTearDown(container.dispose);

      final SidebarState state =
          await container.read(sidebarControllerProvider.future);

      expect(state.sharedCalendars, hasLength(1));
    });

    test('places delegated calendar in delegatedCalendars', () async {
      when(repo.fetchCalendars)
          .thenAnswer((_) async => <CalendarEntity>[_delegatedCalendar()]);
      final ProviderContainer container = _containerWith(repo);
      addTearDown(container.dispose);

      final SidebarState state =
          await container.read(sidebarControllerProvider.future);

      expect(state.delegatedCalendars, hasLength(1));
    });

    test('selects every calendar by default', () async {
      when(repo.fetchCalendars).thenAnswer((_) async => <CalendarEntity>[
            _ownCalendar(),
            _sharedCalendar(),
            _delegatedCalendar(),
          ]);
      final ProviderContainer container = _containerWith(repo);
      addTearDown(container.dispose);

      final SidebarState state =
          await container.read(sidebarControllerProvider.future);

      expect(state.selectedCalendarIds, <String>{
        'me-1',
        'alice-shared',
        'alice-delegated',
      });
    });
  });

  group('toggleSelection', () {
    Future<ProviderContainer> hydratedContainer() async {
      when(repo.fetchCalendars)
          .thenAnswer((_) async => <CalendarEntity>[_ownCalendar()]);
      final ProviderContainer container = _containerWith(repo);
      addTearDown(container.dispose);
      await container.read(sidebarControllerProvider.future);
      return container;
    }

    test('removes id when previously selected', () async {
      final ProviderContainer container = await hydratedContainer();

      container.read(sidebarControllerProvider.notifier).toggleSelection('me-1');
      final SidebarState state =
          container.read(sidebarControllerProvider).valueOrNull!;

      expect(state.selectedCalendarIds, isEmpty);
    });

    test('re-adds id when previously deselected', () async {
      final ProviderContainer container = await hydratedContainer();

      container.read(sidebarControllerProvider.notifier)
        ..toggleSelection('me-1')
        ..toggleSelection('me-1');
      final SidebarState state =
          container.read(sidebarControllerProvider).valueOrNull!;

      expect(state.selectedCalendarIds, <String>{'me-1'});
    });
  });
}
