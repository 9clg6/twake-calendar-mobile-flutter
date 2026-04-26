import 'dart:convert';

import 'package:dio/dio.dart';

/// Dio interceptor that returns canned responses for every backend
/// endpoint hit during the E2E suite. Lets the app run against a real
/// runtime without depending on esn-sabre / twake-calendar-side-service.
class MockBackendInterceptor extends Interceptor {
  /// Creates a [MockBackendInterceptor].
  MockBackendInterceptor();

  /// Recorded mutations — exposed so tests can assert what was called.
  final List<Map<String, Object?>> recordedRequests =
      <Map<String, Object?>>[];

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    recordedRequests.add(<String, Object?>{
      'method': options.method,
      'path': options.path,
    });

    // /ws/ticket
    if (options.path.endsWith('/ws/ticket') &&
        options.method.toUpperCase() == 'POST') {
      return handler.resolve(_json(options, <String, dynamic>{
        'value': 'mock-ticket',
        'validUntil': DateTime.now()
            .add(const Duration(hours: 1))
            .toIso8601String(),
      }));
    }

    // /api/user
    if (options.path.endsWith('/api/user') &&
        options.method.toUpperCase() == 'GET') {
      return handler.resolve(_json(options, <String, dynamic>{
        'id': 'me',
        'preferredEmail': 'me@example.com',
        'firstname': 'Demo',
        'lastname': 'User',
      }));
    }

    // /dav/calendars/{userId}.json (GET = list)
    if (options.path.startsWith('/dav/calendars/') &&
        options.path.endsWith('.json') &&
        options.method.toUpperCase() == 'GET') {
      return handler.resolve(_json(options, <String, dynamic>{
        '_embedded': <String, dynamic>{
          'dav:calendar': <Map<String, dynamic>>[
            <String, dynamic>{
              'id': 'me-personal',
              'dav:name': 'My calendar',
              'apple:color': '#F67E35',
              'caldav:description': null,
              '_links': <String, dynamic>{
                'self': <String, dynamic>{
                  'href': '/calendars/me/me-personal.json',
                },
              },
            },
          ],
        },
      }));
    }

    // /dav/calendars/{calId}.json (REPORT = events range)
    if (options.path.startsWith('/dav/calendars/') &&
        options.path.endsWith('.json') &&
        options.method.toUpperCase() == 'REPORT') {
      return handler.resolve(_json(options, <String, dynamic>{
        '_embedded': <String, dynamic>{
          'dav:item': <Map<String, dynamic>>[],
          'sync-token': 'urn:uuid:mock',
        },
      }));
    }

    // PUT /dav/...ics (event create / update)
    if (options.path.startsWith('/dav/') &&
        options.method.toUpperCase() == 'PUT') {
      return handler.resolve(Response<dynamic>(
        requestOptions: options,
        statusCode: 201,
      ));
    }

    // DELETE /dav/...
    if (options.path.startsWith('/dav/') &&
        options.method.toUpperCase() == 'DELETE') {
      return handler.resolve(Response<dynamic>(
        requestOptions: options,
        statusCode: 204,
      ));
    }

    // POST /dav/calendars/{userId}.json (create calendar)
    if (options.path.startsWith('/dav/calendars/') &&
        options.method.toUpperCase() == 'POST') {
      return handler.resolve(_json(options, <String, dynamic>{
        'id': 'created',
      }, status: 201));
    }

    // PROPPATCH /dav/...
    if (options.method.toUpperCase() == 'PROPPATCH' &&
        options.path.startsWith('/dav/')) {
      return handler.resolve(Response<dynamic>(
        requestOptions: options,
        statusCode: 200,
      ));
    }

    // POST /api/people/search
    if (options.path.endsWith('/api/people/search') &&
        options.method.toUpperCase() == 'POST') {
      return handler.resolve(_json(options, <Map<String, dynamic>>[
        <String, dynamic>{
          'id': 'alice',
          'objectType': 'user',
          'names': <Map<String, dynamic>>[
            <String, dynamic>{'displayName': 'Alice Martin'},
          ],
          'emailAddresses': <Map<String, dynamic>>[
            <String, dynamic>{'value': 'alice@example.com'},
          ],
        },
      ]));
    }

    // POST /calendar/api/events/search
    if (options.path.contains('/calendar/api/events/search') &&
        options.method.toUpperCase() == 'POST') {
      return handler.resolve(_json(options, <String, dynamic>{
        'total': 1,
        'results': <Map<String, dynamic>>[
          <String, dynamic>{
            'uid': 'mock-1',
            'summary': 'Mock match',
            'start': '2026-04-26T10:00:00',
          },
        ],
      }));
    }

    handler.resolve(_json(options, <String, dynamic>{}, status: 200));
  }

  Response<dynamic> _json(
    RequestOptions options,
    Object body, {
    int status = 200,
  }) {
    return Response<dynamic>(
      requestOptions: options,
      statusCode: status,
      data: body is String ? jsonDecode(body) : body,
    );
  }
}
