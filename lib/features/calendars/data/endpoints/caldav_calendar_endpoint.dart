import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:twake_calendar_mobile/features/calendars/data/models/calendar.remote_model.dart';

part 'caldav_calendar_endpoint.g.dart';

/// CalDAV endpoint for calendar collection operations.
///
/// Mirrors the web frontend's `CalendarApi.ts`. Standard verbs use the
/// dedicated [GET]/[POST]/[DELETE] annotations; WebDAV verbs (REPORT,
/// PROPPATCH, ACL) are declared via the generic [Method] annotation
/// since `retrofit` does not ship dedicated annotations for them.
@RestApi()
abstract class CaldavCalendarEndpoint {
  /// Creates a [CaldavCalendarEndpoint].
  factory CaldavCalendarEndpoint(Dio dio) = _CaldavCalendarEndpoint;

  /// Lists every calendar accessible to [userId].
  @GET('/dav/calendars/{userId}.json')
  Future<CalendarListRemoteModel> listCalendars(
    @Path('userId') String userId,
    @Queries() Map<String, dynamic> scope,
  );

  /// Time-range REPORT against a calendar (returns events whose DTSTART
  /// falls inside `[start, end]`).
  @Method('REPORT', '/dav/calendars/{calId}.json')
  Future<dynamic> reportRange(
    @Path('calId') String calId,
    @Body() Map<String, dynamic> body,
  );

  /// Updates the calendar properties (name, description, color).
  @Method('PROPPATCH', '/dav{calLink}')
  Future<void> proppatchCalendar(
    @Path('calLink') String calLink,
    @Body() Map<String, dynamic> body,
  );

  /// Updates the public ACL (`free-busy`, `read`, `read-write`, ...).
  @Method('ACL', '/dav{calLink}')
  Future<void> aclCalendar(
    @Path('calLink') String calLink,
    @Body() Map<String, dynamic> body,
  );

  /// Deletes a calendar.
  @DELETE('/dav{calLink}')
  Future<void> deleteCalendar(@Path('calLink') String calLink);

  /// Creates a new personal calendar.
  @POST('/dav/calendars/{userId}.json')
  Future<dynamic> createCalendar(
    @Path('userId') String userId,
    @Body() Map<String, dynamic> body,
  );
}
