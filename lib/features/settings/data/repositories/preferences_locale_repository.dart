import 'package:twake_calendar_mobile/core/storage/preferences_storage.dart';
import 'package:twake_calendar_mobile/features/settings/domain/repositories/locale_repository.dart';

/// [LocaleRepository] backed by [PreferencesStorage].
final class PreferencesLocaleRepository implements LocaleRepository {
  /// Creates a [PreferencesLocaleRepository].
  const PreferencesLocaleRepository(this._storage);

  /// Storage key for the app locale.
  static const String key = 'app.locale';

  final PreferencesStorage _storage;

  @override
  Future<String?> getStoredLocale() async => _storage.readString(key);

  @override
  Future<void> saveLocale(String code) => _storage.writeString(key, code);
}
