import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/features/calendar_view/domain/enums/calendar_view_kind.dart';

/// Controller for the active [CalendarViewKind].
///
/// Plain in-memory choice for now; persistence can be added later by
/// reading/writing through PreferencesStorage.
final class ViewKindController extends Notifier<CalendarViewKind> {
  @override
  CalendarViewKind build() => CalendarViewKind.month;

  /// Switches to [next].
  void switchTo(CalendarViewKind next) => state = next;
}

/// Provider for [ViewKindController].
final NotifierProvider<ViewKindController, CalendarViewKind>
    viewKindControllerProvider =
    NotifierProvider<ViewKindController, CalendarViewKind>(
  ViewKindController.new,
  name: 'viewKindControllerProvider',
);
