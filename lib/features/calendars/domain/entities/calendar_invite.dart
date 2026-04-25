import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/enums/access_right.dart';

part 'calendar_invite.freezed.dart';

/// Pending or accepted invite to share a calendar.
@freezed
abstract class CalendarInviteEntity with _$CalendarInviteEntity {
  /// Creates a [CalendarInviteEntity].
  const factory CalendarInviteEntity({
    required String href,
    required String principal,
    required AccessRight access,
    required int inviteStatus,
  }) = _CalendarInviteEntity;
}
