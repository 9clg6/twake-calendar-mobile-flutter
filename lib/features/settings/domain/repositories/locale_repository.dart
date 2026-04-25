/// Persistence contract for the user-selected app locale.
abstract interface class LocaleRepository {
  /// Returns the persisted locale code (`en`, `fr`, ...) or null if none.
  Future<String?> getStoredLocale();

  /// Persists the [code] of the chosen locale.
  Future<void> saveLocale(String code);
}
