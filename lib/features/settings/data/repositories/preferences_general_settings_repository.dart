import 'dart:convert';

import 'package:twake_calendar_mobile/core/storage/preferences_storage.dart';
import 'package:twake_calendar_mobile/features/settings/domain/entities/general_settings.dart';
import 'package:twake_calendar_mobile/features/settings/domain/repositories/general_settings_repository.dart';

/// [GeneralSettingsRepository] backed by [PreferencesStorage].
///
/// Stores everything as a single JSON blob to keep the read/write atomic.
final class PreferencesGeneralSettingsRepository
    implements GeneralSettingsRepository {
  /// Creates a [PreferencesGeneralSettingsRepository].
  const PreferencesGeneralSettingsRepository(this._storage);

  /// Storage key.
  static const String key = 'app.generalSettings';

  final PreferencesStorage _storage;

  @override
  Future<GeneralSettingsEntity> load() async {
    final String? raw = _storage.readString(key);
    if (raw == null) return GeneralSettingsEntity.initial();
    final Map<String, dynamic> json = jsonDecode(raw) as Map<String, dynamic>;
    return GeneralSettingsEntity(
      timezone: json['timezone'] as String?,
      hideDeclinedEvents: json['hideDeclinedEvents'] as bool? ?? false,
      displayWeekNumbers: json['displayWeekNumbers'] as bool? ?? true,
      alarmEmails: json['alarmEmails'] as bool? ?? false,
    );
  }

  @override
  Future<void> save(GeneralSettingsEntity settings) {
    final String raw = jsonEncode(<String, dynamic>{
      'timezone': settings.timezone,
      'hideDeclinedEvents': settings.hideDeclinedEvents,
      'displayWeekNumbers': settings.displayWeekNumbers,
      'alarmEmails': settings.alarmEmails,
    });
    return _storage.writeString(key, raw);
  }
}
