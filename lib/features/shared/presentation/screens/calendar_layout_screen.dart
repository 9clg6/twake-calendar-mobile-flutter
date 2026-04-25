import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';

/// Placeholder for the main calendar layout (menubar + sidebar + view).
///
/// To be replaced by the real shell once `features/calendar_view/` lands.
class CalendarLayoutScreen extends ConsumerWidget {
  /// Creates a [CalendarLayoutScreen].
  const CalendarLayoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.appName)),
      body: Center(
        child: Text(
          context.l10n.appName,
          style: context.textTheme.headlineMedium,
        ),
      ),
    );
  }
}
