import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:twake_calendar_mobile/features/events/data/models/event_report.remote_model.dart';

part 'caldav_event_endpoint.g.dart';

/// CalDAV event endpoint.
///
/// Mirrors the web frontend (`EventDao.ts`). Custom verbs (REPORT, MOVE)
/// declared via the generic [Method] annotation since `retrofit` does not
/// ship dedicated annotations for them.
@RestApi()
abstract class CaldavEventEndpoint {
  /// Creates a [CaldavEventEndpoint].
  factory CaldavEventEndpoint(Dio dio) = _CaldavEventEndpoint;

  /// Time-range REPORT against a calendar collection.
  ///
  /// The body shape expected by esn-sabre is:
  /// `{"match": {"start": "<ISO>", "end": "<ISO>"}}`.
  @Method('REPORT', '/dav/calendars/{calId}.json')
  Future<CalendarReportRemoteModel> reportRange(
    @Path('calId') String calId,
    @Body() Map<String, dynamic> body,
  );

  /// Fetches a single event as raw jCal/JSON.
  @GET('/dav{path}')
  Future<dynamic> fetchEvent(@Path('path') String path);

  /// Creates or updates a single event. The body is a JSON string holding
  /// the jCal payload — passing it as a String avoids retrofit's default
  /// serializer trying to call `toJson()` on each list element.
  @Headers(<String, String>{'Content-Type': 'text/calendar; charset=utf-8'})
  @PUT('/dav{path}')
  Future<void> putEvent(
    @Path('path') String path,
    @Body() String jcalJson,
  );

  /// Deletes an event.
  @DELETE('/dav{path}')
  Future<void> deleteEvent(@Path('path') String path);

  /// Moves an event between calendars (CalDAV `MOVE`).
  ///
  /// `destination` must be the absolute URL of the target collection.
  @Method('MOVE', '/dav{path}')
  Future<void> moveEvent(
    @Path('path') String path,
    @Header('Destination') String destination,
  );
}
