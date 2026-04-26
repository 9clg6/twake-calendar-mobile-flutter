import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

/// Identifier of the channel used for in-app reminders mirroring iCalendar
/// VALARM triggers.
const String kReminderChannelId = 'twakecal.reminders';

/// Wrapper around [FlutterLocalNotificationsPlugin] used by the
/// [LocalReminderService] to schedule alarms client-side (works offline).
abstract interface class LocalNotificationsDataSource {
  /// Initializes the plugin (runs once at app start).
  Future<void> initialize();

  /// Schedules a notification for [scheduledAt] with the given [id], [title]
  /// and optional [body]. The timestamp is interpreted in the given
  /// [timezone] (Olson identifier, e.g. `Europe/Paris`).
  Future<void> schedule({
    required int id,
    required DateTime scheduledAt,
    required String title,
    required String timezone,
    String? body,
  });

  /// Cancels a previously scheduled notification.
  Future<void> cancel(int id);
}

/// Default implementation.
final class LocalNotificationsDataSourceImpl
    implements LocalNotificationsDataSource {
  /// Creates a [LocalNotificationsDataSourceImpl].
  LocalNotificationsDataSourceImpl({FlutterLocalNotificationsPlugin? plugin})
      : _plugin = plugin ?? FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin _plugin;

  @override
  Future<void> initialize() async {
    const InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
      ),
    );
    await _plugin.initialize(settings);
    await _plugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  @override
  Future<void> schedule({
    required int id,
    required DateTime scheduledAt,
    required String title,
    required String timezone,
    String? body,
  }) async {
    final tz.Location location = tz.getLocation(timezone);
    final tz.TZDateTime tzDate = tz.TZDateTime.from(scheduledAt, location);
    await _plugin.zonedSchedule(
      id,
      title,
      body,
      tzDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          kReminderChannelId,
          'Reminders',
          channelDescription: 'Calendar event reminders',
          importance: Importance.defaultImportance,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  @override
  Future<void> cancel(int id) => _plugin.cancel(id);
}
