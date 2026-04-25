import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_settings.freezed.dart';

/// Subset of user settings exposed by the General settings screen.
///
/// Backed by the side-service `/api/configurations` endpoint, mirroring
/// the keys consumed by the web frontend (`linagora.esn.calendar` +
/// `core` modules).
@freezed
abstract class GeneralSettingsEntity with _$GeneralSettingsEntity {
  /// Creates a [GeneralSettingsEntity].
  const factory GeneralSettingsEntity({
    String? timezone,
    @Default(false) bool hideDeclinedEvents,
    @Default(true) bool displayWeekNumbers,
    @Default(false) bool alarmEmails,
  }) = _GeneralSettingsEntity;

  /// Default values shown while the real settings are loading.
  factory GeneralSettingsEntity.initial() => const GeneralSettingsEntity();
}
