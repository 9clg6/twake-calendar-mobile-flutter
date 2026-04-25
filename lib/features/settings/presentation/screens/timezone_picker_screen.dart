import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/features/settings/presentation/controllers/general_settings_controller.dart';

/// Searchable list of Olson timezones.
class TimezonePickerScreen extends ConsumerStatefulWidget {
  /// Creates a [TimezonePickerScreen].
  const TimezonePickerScreen({super.key});

  @override
  ConsumerState<TimezonePickerScreen> createState() =>
      _TimezonePickerScreenState();
}

class _TimezonePickerScreenState extends ConsumerState<TimezonePickerScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final List<String> all = tz.timeZoneDatabase.locations.keys.toList()..sort();
    final List<String> filtered = _query.isEmpty
        ? all
        : all
            .where((String name) =>
                name.toLowerCase().contains(_query.toLowerCase()))
            .toList();

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.settingsTimezone)),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: context.l10n.settingsTimezoneSearch,
                border: const OutlineInputBorder(),
              ),
              onChanged: (String v) => setState(() => _query = v),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (BuildContext c, int i) {
                final String name = filtered[i];
                return ListTile(
                  title: Text(name),
                  onTap: () async {
                    await ref
                        .read(generalSettingsControllerProvider.notifier)
                        .setTimezone(name);
                    if (context.mounted) Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
