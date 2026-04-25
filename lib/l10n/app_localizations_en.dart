// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Twake Calendar';

  @override
  String get calendarPersonal => 'My calendars';

  @override
  String get calendarShared => 'Shared calendars';

  @override
  String get calendarDelegated => 'Delegated calendars';

  @override
  String get calendarSubscribed => 'Subscribed calendars';

  @override
  String get calendarDefaultName => 'My calendar';

  @override
  String get calendarColor => 'Color';

  @override
  String get calendarVisibilityPrivate => 'Private';

  @override
  String get calendarVisibilityPublic => 'Public';

  @override
  String get calendarExport => 'Export calendar';

  @override
  String get calendarImport => 'Import calendar';

  @override
  String get calendarDelete => 'Delete calendar';

  @override
  String get calendarDeleteConfirm =>
      'Delete this calendar? This cannot be undone.';

  @override
  String get calendarShare => 'Share';

  @override
  String get calendarSettings => 'Calendar settings';

  @override
  String get calendarAccessLevelView => 'View';

  @override
  String get calendarAccessLevelEditor => 'Editor';

  @override
  String get calendarAccessLevelAdmin => 'Admin';

  @override
  String get actionsSave => 'Save';

  @override
  String get actionsCancel => 'Cancel';

  @override
  String get actionsDelete => 'Delete';

  @override
  String get actionsConfirm => 'Confirm';

  @override
  String get actionsModify => 'Modify';

  @override
  String get actionsCreate => 'Create';

  @override
  String get actionsRetry => 'Retry';

  @override
  String get actionsClose => 'Close';

  @override
  String get actionsBack => 'Back';

  @override
  String get viewMonth => 'Month';

  @override
  String get viewWeek => 'Week';

  @override
  String get viewDay => 'Day';

  @override
  String get viewAgenda => 'Agenda';

  @override
  String get today => 'Today';

  @override
  String get eventCreate => 'Create event';

  @override
  String get eventUpdate => 'Update event';

  @override
  String get eventTitle => 'Title';

  @override
  String get eventTitleHint => 'Event title';

  @override
  String get eventLocation => 'Location';

  @override
  String get eventDescription => 'Description';

  @override
  String get eventStart => 'Start';

  @override
  String get eventEnd => 'End';

  @override
  String get eventAllDay => 'All day';

  @override
  String get eventTimezone => 'Timezone';

  @override
  String get eventOrganizer => 'Organizer';

  @override
  String get eventAttendees => 'Attendees';

  @override
  String get eventVideoConference => 'Video conference';

  @override
  String get eventVisibility => 'Visibility';

  @override
  String get eventNotification => 'Reminder';

  @override
  String get eventRepeat => 'Repeat';

  @override
  String get eventDoesNotRepeat => 'Doesn\'t repeat';

  @override
  String get eventRepeatEvery => 'Repeat every';

  @override
  String get eventRepeatDays => 'day(s)';

  @override
  String get eventRepeatWeeks => 'week(s)';

  @override
  String get eventRepeatMonths => 'month(s)';

  @override
  String get eventRepeatYears => 'year(s)';

  @override
  String get eventRepeatOn => 'Repeat on:';

  @override
  String get eventRepeatEndNever => 'Never';

  @override
  String get eventRepeatEndAfter => 'After';

  @override
  String get eventRepeatEndOn => 'On';

  @override
  String get eventStatusBusy => 'Busy';

  @override
  String get eventStatusFree => 'Free';

  @override
  String get eventClassPublic => 'Public';

  @override
  String get eventClassPrivate => 'Private';

  @override
  String get eventClassConfidential => 'Confidential';

  @override
  String get eventRsvpAccept => 'Accept';

  @override
  String get eventRsvpDecline => 'Decline';

  @override
  String get eventRsvpTentative => 'Maybe';

  @override
  String get eventRsvpCounter => 'Propose new time';

  @override
  String get eventDeleteThisOnly => 'This event only';

  @override
  String get eventDeleteAllEvents => 'All events in the series';

  @override
  String get eventDeleteThisAndFollowing => 'This and following events';

  @override
  String get freeBusyBusy => 'This person is busy';

  @override
  String get freeBusyBusyOwner => 'You have another event at this time';

  @override
  String get freeBusyFree => 'Available';

  @override
  String get freeBusyContact => 'Looking up availability…';

  @override
  String get searchTitle => 'Search results';

  @override
  String get searchKeywordsLabel => 'Keywords';

  @override
  String get searchKeywordsHint => 'Enter keywords';

  @override
  String get searchInAll => 'All calendars';

  @override
  String get searchInMine => 'My calendars';

  @override
  String get searchInShared => 'Shared calendars';

  @override
  String get searchOrganizers => 'Organizers';

  @override
  String get searchAttendees => 'Attendees';

  @override
  String get searchEmpty => 'No events found';

  @override
  String get searchEmptyHint => 'Try adjusting your filters or search terms.';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsTimezone => 'Timezone';

  @override
  String get settingsHideDeclinedEvents => 'Hide declined events';

  @override
  String get settingsDisplayWeekNumbers => 'Display week numbers';

  @override
  String get settingsBusinessHours => 'Business hours';

  @override
  String get settingsWorkingDays => 'Working days';

  @override
  String get settingsAlarmEmails => 'Email reminders';

  @override
  String get settingsTimezoneSearch => 'Search timezone…';

  @override
  String get errorTitle => 'Error';

  @override
  String get errorUnknown => 'An unknown error occurred';

  @override
  String get errorNetwork => 'Network error. Check your connection.';

  @override
  String get errorAuth => 'Authentication required. Please sign in again.';

  @override
  String get splashLoading => 'Loading…';

  @override
  String get loginCallbackLoading => 'Signing you in…';

  @override
  String get wsClosedUnexpectedly => 'Connection closed unexpectedly';

  @override
  String get wsReconnected => 'Connected';

  @override
  String get wsBrowserOnline => 'Back online';

  @override
  String get wsBrowserOffline => 'Offline';

  @override
  String get syncConflictsTitle => 'Conflicts to resolve';

  @override
  String syncConflictsBadge(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count conflicts',
      one: '1 conflict',
    );
    return '$_temp0';
  }

  @override
  String get syncKeepLocal => 'Keep my version';

  @override
  String get syncKeepServer => 'Keep server version';

  @override
  String get syncMerge => 'Merge manually';

  @override
  String greeting(String name) {
    return 'Hello $name';
  }
}
