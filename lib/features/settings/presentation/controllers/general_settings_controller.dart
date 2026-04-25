import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/storage/preferences_storage.dart';
import 'package:twake_calendar_mobile/core/storage/preferences_storage_provider.dart';
import 'package:twake_calendar_mobile/features/settings/data/repositories/preferences_general_settings_repository.dart';
import 'package:twake_calendar_mobile/features/settings/domain/entities/general_settings.dart';
import 'package:twake_calendar_mobile/features/settings/domain/repositories/general_settings_repository.dart';

/// Provides the [GeneralSettingsRepository] backed by shared_preferences.
final FutureProvider<GeneralSettingsRepository>
    generalSettingsRepositoryProvider =
    FutureProvider<GeneralSettingsRepository>(
  (Ref<AsyncValue<GeneralSettingsRepository>> ref) async {
    final PreferencesStorage storage =
        await ref.watch(preferencesStorageProvider.future);
    return PreferencesGeneralSettingsRepository(storage);
  },
  name: 'generalSettingsRepositoryProvider',
);

/// Controller exposing the current [GeneralSettingsEntity] and update
/// helpers used by the settings screen.
final class GeneralSettingsController
    extends AsyncNotifier<GeneralSettingsEntity> {
  late GeneralSettingsRepository _repository;

  @override
  Future<GeneralSettingsEntity> build() async {
    _repository = await ref.watch(generalSettingsRepositoryProvider.future);
    return _repository.load();
  }

  Future<void> setTimezone(String? value) async {
    await _patch((GeneralSettingsEntity s) => s.copyWith(timezone: value));
  }

  Future<void> setHideDeclinedEvents(bool value) =>
      _patch((GeneralSettingsEntity s) =>
          s.copyWith(hideDeclinedEvents: value));

  Future<void> setDisplayWeekNumbers(bool value) =>
      _patch((GeneralSettingsEntity s) =>
          s.copyWith(displayWeekNumbers: value));

  Future<void> setAlarmEmails(bool value) =>
      _patch((GeneralSettingsEntity s) => s.copyWith(alarmEmails: value));

  Future<void> _patch(
    GeneralSettingsEntity Function(GeneralSettingsEntity) mutator,
  ) async {
    final GeneralSettingsEntity current =
        state.valueOrNull ?? GeneralSettingsEntity.initial();
    final GeneralSettingsEntity next = mutator(current);
    state = AsyncData<GeneralSettingsEntity>(next);
    await _repository.save(next);
  }
}

/// Provider for [GeneralSettingsController].
final AsyncNotifierProvider<GeneralSettingsController, GeneralSettingsEntity>
    generalSettingsControllerProvider =
    AsyncNotifierProvider<GeneralSettingsController, GeneralSettingsEntity>(
  GeneralSettingsController.new,
  name: 'generalSettingsControllerProvider',
);
