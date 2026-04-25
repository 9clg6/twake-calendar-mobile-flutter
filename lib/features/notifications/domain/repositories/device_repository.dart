import 'package:twake_calendar_mobile/features/notifications/domain/entities/device_registration.dart';

/// Repository registering / unregistering the device with the backend so
/// push notifications can be routed.
///
/// Backend endpoint TBD — see analysis/00-decisions/01-technical-decisions.md
/// §6.1 (the side-service push endpoint does not exist yet, so this lives
/// behind a feature flag for the PoC).
abstract interface class DeviceRepository {
  /// Registers [device] for push notifications.
  Future<void> registerDevice(DeviceRegistrationEntity device);

  /// Unregisters the device by its FCM token.
  Future<void> unregisterDevice(String fcmToken);
}
