import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:twake_calendar_mobile/features/calendars/calendars_providers.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/entities/calendar.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/entities/calendar_invite.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/enums/access_right.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/repositories/calendar_repository.dart';
import 'package:twake_calendar_mobile/features/calendars/presentation/controllers/sidebar_controller.dart';
import 'package:twake_calendar_mobile/features/calendars/presentation/controllers/sidebar_state.dart';
import 'package:twake_calendar_mobile/shared/domain/entities/user.dart';

class _StubCalendarRepository implements CalendarRepository {
  _StubCalendarRepository(this._calendars);

  final List<CalendarEntity> _calendars;

  @override
  Future<List<CalendarEntity>> fetchCalendars() async => _calendars;

  @override
  Future<void> createCalendar({
    required String id,
    required String name,
    String? description,
    String? color,
  }) async {}

  @override
  Future<void> deleteCalendar(String calendarLink) async {}

  @override
  Future<void> updateCalendar({
    required String calendarLink,
    String? name,
    String? description,
    String? color,
  }) async {}
}

void main() {
  group('SidebarController', () {
    const UserEntity me = UserEntity(openpaasId: 'me', email: 'me@example.com');
    const UserEntity alice =
        UserEntity(openpaasId: 'alice', email: 'alice@example.com');

    Future<SidebarState> hydrate(List<CalendarEntity> calendars) async {
      final ProviderContainer container = ProviderContainer(
        overrides: <Override>[
          calendarRepositoryProvider
              .overrideWithValue(_StubCalendarRepository(calendars)),
        ],
      );
      addTearDown(container.dispose);
      return container.read(sidebarControllerProvider.future);
    }

    test('buckets calendars into mine / shared / delegated', () async {
      final SidebarState state = await hydrate(<CalendarEntity>[
        const CalendarEntity(
          id: 'me-1',
          link: '/calendars/me/me-1.json',
          name: 'Mine',
          owner: me,
        ),
        const CalendarEntity(
          id: 'alice-shared',
          link: '/calendars/alice/alice-shared.json',
          name: 'Shared',
          owner: alice,
          invite: <CalendarInviteEntity>[
            CalendarInviteEntity(
              href: 'mailto:me@example.com',
              principal: 'urn:x-twake:principal:me',
              access: AccessRight.editor,
              inviteStatus: 1,
            ),
          ],
        ),
        const CalendarEntity(
          id: 'alice-delegated',
          link: '/calendars/alice/alice-delegated.json',
          name: 'Delegated',
          owner: alice,
          delegated: true,
        ),
      ]);

      expect(state.myCalendars, hasLength(1));
      expect(state.myCalendars.single.id, 'me-1');
      expect(state.sharedCalendars, hasLength(1));
      expect(state.sharedCalendars.single.id, 'alice-shared');
      expect(state.delegatedCalendars, hasLength(1));
      expect(state.delegatedCalendars.single.id, 'alice-delegated');
      expect(state.selectedCalendarIds, <String>{
        'me-1',
        'alice-shared',
        'alice-delegated',
      });
    });

    test('toggleSelection adds and removes ids', () async {
      final ProviderContainer container = ProviderContainer(
        overrides: <Override>[
          calendarRepositoryProvider.overrideWithValue(
            _StubCalendarRepository(<CalendarEntity>[
              const CalendarEntity(
                id: 'me-1',
                link: '/calendars/me/me-1.json',
                name: 'Mine',
                owner: me,
              ),
            ]),
          ),
        ],
      );
      addTearDown(container.dispose);
      await container.read(sidebarControllerProvider.future);

      container.read(sidebarControllerProvider.notifier).toggleSelection('me-1');
      expect(
        container.read(sidebarControllerProvider).valueOrNull!.selectedCalendarIds,
        isEmpty,
      );

      container.read(sidebarControllerProvider.notifier).toggleSelection('me-1');
      expect(
        container.read(sidebarControllerProvider).valueOrNull!.selectedCalendarIds,
        <String>{'me-1'},
      );
    });
  });
}
