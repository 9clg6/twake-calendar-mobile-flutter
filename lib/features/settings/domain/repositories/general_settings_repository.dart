import 'package:twake_calendar_mobile/features/settings/domain/entities/general_settings.dart';

/// Locally persisted general settings.
abstract interface class GeneralSettingsRepository {
  /// Returns the persisted settings, or [GeneralSettingsEntity.initial] if
  /// none.
  Future<GeneralSettingsEntity> load();

  /// Persists [settings].
  Future<void> save(GeneralSettingsEntity settings);
}
