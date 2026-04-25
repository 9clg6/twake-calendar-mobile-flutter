import 'dart:ui' show Locale;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/storage/preferences_storage.dart';
import 'package:twake_calendar_mobile/core/storage/preferences_storage_provider.dart';
import 'package:twake_calendar_mobile/features/settings/data/repositories/preferences_locale_repository.dart';
import 'package:twake_calendar_mobile/features/settings/domain/repositories/locale_repository.dart';
import 'package:twake_calendar_mobile/l10n/app_localizations.dart';

/// Provides the [LocaleRepository] backed by shared_preferences.
final FutureProvider<LocaleRepository> localeRepositoryProvider =
    FutureProvider<LocaleRepository>(
  (Ref<AsyncValue<LocaleRepository>> ref) async {
    final PreferencesStorage storage =
        await ref.watch(preferencesStorageProvider.future);
    return PreferencesLocaleRepository(storage);
  },
  name: 'localeRepositoryProvider',
);

/// Controller exposing the active app [Locale]. Returns `null` while loading
/// to let MaterialApp.router fall back to the platform locale.
final class LocaleController extends AsyncNotifier<Locale?> {
  late LocaleRepository _repository;

  @override
  Future<Locale?> build() async {
    _repository = await ref.watch(localeRepositoryProvider.future);
    final String? code = await _repository.getStoredLocale();
    return code == null ? null : Locale(code);
  }

  /// Switches the app to [locale] and persists it.
  Future<void> changeLocale(Locale locale) async {
    state = AsyncData<Locale?>(locale);
    await _repository.saveLocale(locale.languageCode);
  }
}

/// Provider for [LocaleController].
final AsyncNotifierProvider<LocaleController, Locale?>
    localeControllerProvider =
    AsyncNotifierProvider<LocaleController, Locale?>(
  LocaleController.new,
  name: 'localeControllerProvider',
);

/// Languages exposed in the settings screen.
List<Locale> get supportedLocales => AppLocalizations.supportedLocales;
