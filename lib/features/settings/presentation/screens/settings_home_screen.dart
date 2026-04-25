import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/features/auth/presentation/controllers/auth_controller.dart';
import 'package:twake_calendar_mobile/features/settings/domain/entities/general_settings.dart';
import 'package:twake_calendar_mobile/features/settings/presentation/controllers/general_settings_controller.dart';
import 'package:twake_calendar_mobile/features/settings/presentation/controllers/locale_controller.dart';
import 'package:twake_calendar_mobile/features/settings/presentation/screens/timezone_picker_screen.dart';

/// Full settings home — language picker + timezone + general toggles.
class SettingsHomeScreen extends ConsumerWidget {
  /// Creates a [SettingsHomeScreen].
  const SettingsHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Locale?> localeAsync =
        ref.watch(localeControllerProvider);
    final Locale? activeLocale = localeAsync.valueOrNull;

    final AsyncValue<GeneralSettingsEntity> generalAsync =
        ref.watch(generalSettingsControllerProvider);
    final GeneralSettingsEntity general =
        generalAsync.valueOrNull ?? GeneralSettingsEntity.initial();
    final GeneralSettingsController generalController =
        ref.read(generalSettingsControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.settingsTitle)),
      body: ListView(
        children: <Widget>[
          _SectionHeader(label: context.l10n.settingsLanguage),
          RadioGroup<String>(
            groupValue: activeLocale?.languageCode,
            onChanged: (String? code) {
              if (code == null) return;
              ref
                  .read(localeControllerProvider.notifier)
                  .changeLocale(Locale(code));
            },
            child: Column(
              children: <Widget>[
                for (final Locale locale in supportedLocales)
                  RadioListTile<String>(
                    value: locale.languageCode,
                    title: Text(_languageLabel(locale)),
                  ),
              ],
            ),
          ),
          const Divider(),
          _SectionHeader(label: context.l10n.settingsTimezone),
          ListTile(
            leading: const Icon(Icons.public),
            title: Text(general.timezone ?? '—'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).push<void>(
              MaterialPageRoute<void>(
                builder: (_) => const TimezonePickerScreen(),
              ),
            ),
          ),
          const Divider(),
          SwitchListTile(
            title: Text(context.l10n.settingsHideDeclinedEvents),
            value: general.hideDeclinedEvents,
            onChanged: generalController.setHideDeclinedEvents,
          ),
          SwitchListTile(
            title: Text(context.l10n.settingsDisplayWeekNumbers),
            value: general.displayWeekNumbers,
            onChanged: generalController.setDisplayWeekNumbers,
          ),
          SwitchListTile(
            title: Text(context.l10n.settingsAlarmEmails),
            value: general.alarmEmails,
            onChanged: generalController.setAlarmEmails,
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: context.colorScheme.error),
            title: Text(context.l10n.errorAuth),
            onTap: () =>
                ref.read(authControllerProvider.notifier).signOut(),
          ),
        ],
      ),
    );
  }

  String _languageLabel(Locale locale) {
    switch (locale.languageCode) {
      case 'fr':
        return 'Français';
      case 'ru':
        return 'Русский';
      case 'vi':
        return 'Tiếng Việt';
      case 'en':
      default:
        return 'English';
    }
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Text(
        label,
        style: context.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: context.colorScheme.primary,
        ),
      ),
    );
  }
}
