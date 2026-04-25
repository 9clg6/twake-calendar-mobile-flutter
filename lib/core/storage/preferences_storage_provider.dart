import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/storage/preferences_storage.dart';

/// Singleton provider for [PreferencesStorage].
final FutureProvider<PreferencesStorage> preferencesStorageProvider =
    FutureProvider<PreferencesStorage>(
  (Ref<AsyncValue<PreferencesStorage>> ref) =>
      PreferencesStorage.load(),
  name: 'preferencesStorageProvider',
);
