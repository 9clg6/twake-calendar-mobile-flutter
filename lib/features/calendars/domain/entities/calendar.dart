import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/entities/calendar_invite.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/entities/delegation_access.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/enums/calendar_visibility.dart';
import 'package:twake_calendar_mobile/shared/domain/entities/user.dart';

part 'calendar.freezed.dart';

/// Calendar (personal, shared, delegated, or subscribed).
///
/// Mirrors the `Calendar` interface of the web frontend
/// (`twake-calendar-frontend/src/features/Calendars/CalendarTypes.ts`).
@freezed
abstract class CalendarEntity with _$CalendarEntity {
  /// Creates a [CalendarEntity].
  const factory CalendarEntity({
    required String id,
    required String link,
    required String name,
    required UserEntity owner,
    @Default(CalendarVisibility.privateVisibility) CalendarVisibility visibility,
    @Default(false) bool delegated,
    String? description,
    String? colorLight,
    String? colorDark,
    DelegationAccessEntity? access,
    String? syncToken,
    @Default(<CalendarInviteEntity>[]) List<CalendarInviteEntity> invite,
  }) = _CalendarEntity;
}
