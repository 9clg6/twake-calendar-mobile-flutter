import 'package:twake_calendar_mobile/features/calendars/data/models/calendar.remote_model.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/entities/calendar.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/enums/calendar_visibility.dart';
import 'package:twake_calendar_mobile/shared/domain/entities/user.dart';

/// Mapper [CalendarRemoteModel] -> [CalendarEntity].
extension CalendarRemoteModelX on CalendarRemoteModel {
  /// Builds the domain entity. The owner has to be supplied by the caller
  /// because the calendar list response only contains an URL pointing back
  /// to the user resource.
  CalendarEntity toEntity({required UserEntity owner}) => CalendarEntity(
        id: id,
        link: links['self']?.href ?? '',
        name: name,
        owner: owner,
        visibility: CalendarVisibility.privateVisibility,
        description: description,
        colorLight: color,
        colorDark: color,
      );
}
