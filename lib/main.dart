import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:twake_calendar_mobile/features/auth/auth_providers.dart';
import 'package:twake_calendar_mobile/features/calendars/calendars_providers.dart';
import 'package:twake_calendar_mobile/features/events/data/repositories/ics_feed_event_repository.dart';
import 'package:twake_calendar_mobile/features/events/domain/repositories/event_repository.dart';
import 'package:twake_calendar_mobile/features/events/events_providers.dart';
import 'package:twake_calendar_mobile/foundation/app/demo_mode.dart';
import 'package:twake_calendar_mobile/foundation/app/twake_calendar_app.dart';
import 'package:twake_calendar_mobile/foundation/providers/kernel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Timezone DB is needed for scheduling local notifications, regardless
  // of demo mode (the kernel only initializes it in production mode).
  tz_data.initializeTimeZones();
  final List<Override> overrides = <Override>[
    if (kDemoMode) ...<Override>[
      authRepositoryProvider.overrideWithValue(InMemoryAuthRepository()),
      useFakeCalendarRepositoryProvider.overrideWithValue(true),
      useFakeEventRepositoryProvider.overrideWithValue(true),
      // Demo mode reads its events from the public Linagora ICS feed —
      // we override the event repo so the calendar shows real data while
      // staying offline-friendly (cached after the first fetch).
      eventRepositoryProvider.overrideWith(
        (Ref<EventRepository> ref) =>
            IcsFeedEventRepository(feedUrl: kDemoIcsFeedUrl),
      ),
    ],
  ];
  final ProviderContainer container =
      ProviderContainer(overrides: overrides);
  // Attach Dio interceptors before any HTTP request fires (skipped in
  // demo mode — no network call is made).
  if (!kDemoMode) {
    unawaited(container.read(kernelProvider.future));
  }
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const TwakeCalendarApp(),
    ),
  );
}

void unawaited(Future<void> future) {
  // ignore: discarded_futures
  future.ignore();
}
