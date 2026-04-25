import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/features/settings/presentation/controllers/locale_controller.dart';

/// Settings home — for now exposes only the language picker.
class SettingsHomeScreen extends ConsumerWidget {
  /// Creates a [SettingsHomeScreen].
  const SettingsHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Locale?> async = ref.watch(localeControllerProvider);
    final Locale? activeLocale = async.valueOrNull;

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.settingsTitle)),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              context.l10n.settingsLanguage,
              style: context.textTheme.bodyLarge,
            ),
            dense: true,
          ),
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
