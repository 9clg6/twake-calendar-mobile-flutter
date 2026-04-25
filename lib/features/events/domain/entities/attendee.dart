import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/attendee_role.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/cutype.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/partstat.dart';

part 'attendee.freezed.dart';

/// Attendee of an event (iCalendar ATTENDEE property).
@freezed
abstract class AttendeeEntity with _$AttendeeEntity {
  /// Creates an [AttendeeEntity].
  const factory AttendeeEntity({
    required String calAddress,
    @Default(Partstat.needsAction) Partstat partstat,
    @Default(AttendeeRole.reqParticipant) AttendeeRole role,
    @Default(CuType.individual) CuType cutype,
    @Default(false) bool rsvp,
    @Default('') String cn,
  }) = _AttendeeEntity;
}
