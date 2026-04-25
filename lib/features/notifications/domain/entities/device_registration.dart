import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_registration.freezed.dart';

/// Mobile device registration sent to the side-service `/api/devices`
/// endpoint so push notifications can be routed.
@freezed
abstract class DeviceRegistrationEntity with _$DeviceRegistrationEntity {
  /// Creates a [DeviceRegistrationEntity].
  const factory DeviceRegistrationEntity({
    required String fcmToken,
    required String platform,
    String? deviceId,
    String? locale,
  }) = _DeviceRegistrationEntity;
}
