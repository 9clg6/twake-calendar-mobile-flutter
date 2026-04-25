import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/features/notifications/data/datasources/local_notifications_datasource.dart';
import 'package:twake_calendar_mobile/features/notifications/domain/services/local_reminder_service.dart';

/// Local notifications data source (singleton — initialize once at boot).
final Provider<LocalNotificationsDataSource> localNotificationsDataSourceProvider =
    Provider<LocalNotificationsDataSource>(
  (Ref<LocalNotificationsDataSource> ref) =>
      LocalNotificationsDataSourceImpl(),
  name: 'localNotificationsDataSourceProvider',
);

/// One-shot initialization of the local notifications plugin.
final FutureProvider<void> localNotificationsInitProvider =
    FutureProvider<void>(
  (Ref<AsyncValue<void>> ref) =>
      ref.watch(localNotificationsDataSourceProvider).initialize(),
  name: 'localNotificationsInitProvider',
);

/// Local reminder service.
final Provider<LocalReminderService> localReminderServiceProvider =
    Provider<LocalReminderService>(
  (Ref<LocalReminderService> ref) => LocalReminderService(
    notifications: ref.watch(localNotificationsDataSourceProvider),
  ),
  name: 'localReminderServiceProvider',
);
