import 'package:flutter_test/flutter_test.dart';
import 'package:twake_calendar_mobile/features/calendars/data/mappers/calendar_mapper.dart';
import 'package:twake_calendar_mobile/features/calendars/data/models/calendar.remote_model.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/entities/calendar.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/enums/calendar_visibility.dart';
import 'package:twake_calendar_mobile/shared/domain/entities/user.dart';

void main() {
  group('CalendarRemoteModel.toEntity', () {
    const UserEntity owner = UserEntity(
      openpaasId: 'owner-id',
      email: 'owner@example.com',
    );

    test('maps the basic properties', () {
      const CalendarRemoteModel raw = CalendarRemoteModel(
        id: 'cal-1',
        name: 'Personal',
        color: '#F67E35',
        description: 'My events',
        links: <String, CalDavLinkRemoteModel>{
          'self': CalDavLinkRemoteModel(
              href: '/calendars/owner-id/cal-1.json'),
        },
      );
      final CalendarEntity entity = raw.toEntity(owner: owner);
      expect(entity.id, 'cal-1');
      expect(entity.name, 'Personal');
      expect(entity.colorLight, '#F67E35');
      expect(entity.colorDark, '#F67E35');
      expect(entity.description, 'My events');
      expect(entity.link, '/calendars/owner-id/cal-1.json');
      expect(entity.owner, owner);
      expect(entity.visibility, CalendarVisibility.privateVisibility);
    });

    test('falls back to empty link when self is missing', () {
      const CalendarRemoteModel raw = CalendarRemoteModel(
        id: 'cal-2',
        name: 'No-link',
      );
      final CalendarEntity entity = raw.toEntity(owner: owner);
      expect(entity.link, '');
    });
  });
}
