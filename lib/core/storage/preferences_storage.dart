import 'package:shared_preferences/shared_preferences.dart';

/// Thin wrapper around [SharedPreferences] used to persist non-sensitive
/// settings (selected language, selected timezone, selected calendar ids).
final class PreferencesStorage {
  /// Creates a [PreferencesStorage] backed by [_prefs].
  PreferencesStorage(this._prefs);

  /// Asynchronous factory loading the underlying [SharedPreferences].
  static Future<PreferencesStorage> load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return PreferencesStorage(prefs);
  }

  final SharedPreferences _prefs;

  /// Reads a string value.
  String? readString(String key) => _prefs.getString(key);

  /// Writes a string value.
  Future<void> writeString(String key, String value) =>
      _prefs.setString(key, value);

  /// Removes the entry under [key].
  Future<void> remove(String key) => _prefs.remove(key);
}
