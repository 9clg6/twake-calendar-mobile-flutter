import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/extensions/build_context_x.dart';
import 'package:twake_calendar_mobile/features/calendars/presentation/controllers/sidebar_controller.dart';
import 'package:twake_calendar_mobile/features/calendars/presentation/controllers/sidebar_state.dart';
import 'package:twake_calendar_mobile/features/calendars/presentation/widgets/calendar_section.dart';
import 'package:twake_calendar_mobile/foundation/routing/app_router.dart';

/// Sidebar listing the user's calendars, grouped by section.
class SidebarScreen extends ConsumerWidget {
  /// Creates a [SidebarScreen].
  const SidebarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<SidebarState> async =
        ref.watch(sidebarControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.calendarPersonal),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: context.l10n.settingsTitle,
            onPressed: () => const SettingsRoute().push<void>(context),
          ),
        ],
      ),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (Object e, StackTrace _) => Center(
          child: Text(
            context.l10n.errorUnknown,
            style: context.textTheme.bodyLarge,
          ),
        ),
        data: (SidebarState state) => RefreshIndicator(
          onRefresh: () =>
              ref.read(sidebarControllerProvider.notifier).refresh(),
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 12),
            children: <Widget>[
              CalendarSection(
                title: context.l10n.calendarPersonal,
                calendars: state.myCalendars,
                selectedIds: state.selectedCalendarIds,
                onToggle: (String id) => ref
                    .read(sidebarControllerProvider.notifier)
                    .toggleSelection(id),
              ),
              CalendarSection(
                title: context.l10n.calendarShared,
                calendars: state.sharedCalendars,
                selectedIds: state.selectedCalendarIds,
                onToggle: (String id) => ref
                    .read(sidebarControllerProvider.notifier)
                    .toggleSelection(id),
              ),
              CalendarSection(
                title: context.l10n.calendarDelegated,
                calendars: state.delegatedCalendars,
                selectedIds: state.selectedCalendarIds,
                onToggle: (String id) => ref
                    .read(sidebarControllerProvider.notifier)
                    .toggleSelection(id),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
