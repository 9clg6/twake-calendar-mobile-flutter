import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
    Locale('ru'),
    Locale('vi'),
  ];

  /// Application name
  ///
  /// In en, this message translates to:
  /// **'Twake Calendar'**
  String get appName;

  /// Sidebar section: user's own calendars
  ///
  /// In en, this message translates to:
  /// **'My calendars'**
  String get calendarPersonal;

  /// No description provided for @calendarShared.
  ///
  /// In en, this message translates to:
  /// **'Shared calendars'**
  String get calendarShared;

  /// No description provided for @calendarDelegated.
  ///
  /// In en, this message translates to:
  /// **'Delegated calendars'**
  String get calendarDelegated;

  /// No description provided for @calendarSubscribed.
  ///
  /// In en, this message translates to:
  /// **'Subscribed calendars'**
  String get calendarSubscribed;

  /// No description provided for @calendarDefaultName.
  ///
  /// In en, this message translates to:
  /// **'My calendar'**
  String get calendarDefaultName;

  /// No description provided for @calendarColor.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get calendarColor;

  /// No description provided for @calendarVisibilityPrivate.
  ///
  /// In en, this message translates to:
  /// **'Private'**
  String get calendarVisibilityPrivate;

  /// No description provided for @calendarVisibilityPublic.
  ///
  /// In en, this message translates to:
  /// **'Public'**
  String get calendarVisibilityPublic;

  /// No description provided for @calendarExport.
  ///
  /// In en, this message translates to:
  /// **'Export calendar'**
  String get calendarExport;

  /// No description provided for @calendarImport.
  ///
  /// In en, this message translates to:
  /// **'Import calendar'**
  String get calendarImport;

  /// No description provided for @calendarDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete calendar'**
  String get calendarDelete;

  /// No description provided for @calendarDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete this calendar? This cannot be undone.'**
  String get calendarDeleteConfirm;

  /// No description provided for @calendarShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get calendarShare;

  /// No description provided for @calendarSettings.
  ///
  /// In en, this message translates to:
  /// **'Calendar settings'**
  String get calendarSettings;

  /// No description provided for @calendarAccessLevelView.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get calendarAccessLevelView;

  /// No description provided for @calendarAccessLevelEditor.
  ///
  /// In en, this message translates to:
  /// **'Editor'**
  String get calendarAccessLevelEditor;

  /// No description provided for @calendarAccessLevelAdmin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get calendarAccessLevelAdmin;

  /// No description provided for @actionsSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get actionsSave;

  /// No description provided for @actionsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get actionsCancel;

  /// No description provided for @actionsDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get actionsDelete;

  /// No description provided for @actionsConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get actionsConfirm;

  /// No description provided for @actionsModify.
  ///
  /// In en, this message translates to:
  /// **'Modify'**
  String get actionsModify;

  /// No description provided for @actionsCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get actionsCreate;

  /// No description provided for @actionsRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get actionsRetry;

  /// No description provided for @actionsClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get actionsClose;

  /// No description provided for @actionsBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get actionsBack;

  /// No description provided for @viewMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get viewMonth;

  /// No description provided for @viewWeek.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get viewWeek;

  /// No description provided for @viewDay.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get viewDay;

  /// No description provided for @viewAgenda.
  ///
  /// In en, this message translates to:
  /// **'Agenda'**
  String get viewAgenda;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @eventCreate.
  ///
  /// In en, this message translates to:
  /// **'Create event'**
  String get eventCreate;

  /// No description provided for @eventUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update event'**
  String get eventUpdate;

  /// No description provided for @eventTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get eventTitle;

  /// No description provided for @eventTitleHint.
  ///
  /// In en, this message translates to:
  /// **'Event title'**
  String get eventTitleHint;

  /// No description provided for @eventLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get eventLocation;

  /// No description provided for @eventDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get eventDescription;

  /// No description provided for @eventStart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get eventStart;

  /// No description provided for @eventEnd.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get eventEnd;

  /// No description provided for @eventAllDay.
  ///
  /// In en, this message translates to:
  /// **'All day'**
  String get eventAllDay;

  /// No description provided for @eventTimezone.
  ///
  /// In en, this message translates to:
  /// **'Timezone'**
  String get eventTimezone;

  /// No description provided for @eventOrganizer.
  ///
  /// In en, this message translates to:
  /// **'Organizer'**
  String get eventOrganizer;

  /// No description provided for @eventAttendees.
  ///
  /// In en, this message translates to:
  /// **'Attendees'**
  String get eventAttendees;

  /// No description provided for @eventVideoConference.
  ///
  /// In en, this message translates to:
  /// **'Video conference'**
  String get eventVideoConference;

  /// No description provided for @eventVisibility.
  ///
  /// In en, this message translates to:
  /// **'Visibility'**
  String get eventVisibility;

  /// No description provided for @eventNotification.
  ///
  /// In en, this message translates to:
  /// **'Reminder'**
  String get eventNotification;

  /// No description provided for @eventRepeat.
  ///
  /// In en, this message translates to:
  /// **'Repeat'**
  String get eventRepeat;

  /// No description provided for @eventDoesNotRepeat.
  ///
  /// In en, this message translates to:
  /// **'Doesn\'t repeat'**
  String get eventDoesNotRepeat;

  /// No description provided for @eventRepeatEvery.
  ///
  /// In en, this message translates to:
  /// **'Repeat every'**
  String get eventRepeatEvery;

  /// No description provided for @eventRepeatDays.
  ///
  /// In en, this message translates to:
  /// **'day(s)'**
  String get eventRepeatDays;

  /// No description provided for @eventRepeatWeeks.
  ///
  /// In en, this message translates to:
  /// **'week(s)'**
  String get eventRepeatWeeks;

  /// No description provided for @eventRepeatMonths.
  ///
  /// In en, this message translates to:
  /// **'month(s)'**
  String get eventRepeatMonths;

  /// No description provided for @eventRepeatYears.
  ///
  /// In en, this message translates to:
  /// **'year(s)'**
  String get eventRepeatYears;

  /// No description provided for @eventRepeatOn.
  ///
  /// In en, this message translates to:
  /// **'Repeat on:'**
  String get eventRepeatOn;

  /// No description provided for @eventRepeatEndNever.
  ///
  /// In en, this message translates to:
  /// **'Never'**
  String get eventRepeatEndNever;

  /// No description provided for @eventRepeatEndAfter.
  ///
  /// In en, this message translates to:
  /// **'After'**
  String get eventRepeatEndAfter;

  /// No description provided for @eventRepeatEndOn.
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get eventRepeatEndOn;

  /// No description provided for @eventStatusBusy.
  ///
  /// In en, this message translates to:
  /// **'Busy'**
  String get eventStatusBusy;

  /// No description provided for @eventStatusFree.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get eventStatusFree;

  /// No description provided for @eventClassPublic.
  ///
  /// In en, this message translates to:
  /// **'Public'**
  String get eventClassPublic;

  /// No description provided for @eventClassPrivate.
  ///
  /// In en, this message translates to:
  /// **'Private'**
  String get eventClassPrivate;

  /// No description provided for @eventClassConfidential.
  ///
  /// In en, this message translates to:
  /// **'Confidential'**
  String get eventClassConfidential;

  /// No description provided for @eventRsvpAccept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get eventRsvpAccept;

  /// No description provided for @eventRsvpDecline.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get eventRsvpDecline;

  /// No description provided for @eventRsvpTentative.
  ///
  /// In en, this message translates to:
  /// **'Maybe'**
  String get eventRsvpTentative;

  /// No description provided for @eventRsvpCounter.
  ///
  /// In en, this message translates to:
  /// **'Propose new time'**
  String get eventRsvpCounter;

  /// No description provided for @eventDeleteThisOnly.
  ///
  /// In en, this message translates to:
  /// **'This event only'**
  String get eventDeleteThisOnly;

  /// No description provided for @eventDeleteAllEvents.
  ///
  /// In en, this message translates to:
  /// **'All events in the series'**
  String get eventDeleteAllEvents;

  /// No description provided for @eventDeleteThisAndFollowing.
  ///
  /// In en, this message translates to:
  /// **'This and following events'**
  String get eventDeleteThisAndFollowing;

  /// No description provided for @freeBusyBusy.
  ///
  /// In en, this message translates to:
  /// **'This person is busy'**
  String get freeBusyBusy;

  /// No description provided for @freeBusyBusyOwner.
  ///
  /// In en, this message translates to:
  /// **'You have another event at this time'**
  String get freeBusyBusyOwner;

  /// No description provided for @freeBusyFree.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get freeBusyFree;

  /// No description provided for @freeBusyContact.
  ///
  /// In en, this message translates to:
  /// **'Looking up availability…'**
  String get freeBusyContact;

  /// No description provided for @searchTitle.
  ///
  /// In en, this message translates to:
  /// **'Search results'**
  String get searchTitle;

  /// No description provided for @searchKeywordsLabel.
  ///
  /// In en, this message translates to:
  /// **'Keywords'**
  String get searchKeywordsLabel;

  /// No description provided for @searchKeywordsHint.
  ///
  /// In en, this message translates to:
  /// **'Enter keywords'**
  String get searchKeywordsHint;

  /// No description provided for @searchInAll.
  ///
  /// In en, this message translates to:
  /// **'All calendars'**
  String get searchInAll;

  /// No description provided for @searchInMine.
  ///
  /// In en, this message translates to:
  /// **'My calendars'**
  String get searchInMine;

  /// No description provided for @searchInShared.
  ///
  /// In en, this message translates to:
  /// **'Shared calendars'**
  String get searchInShared;

  /// No description provided for @searchOrganizers.
  ///
  /// In en, this message translates to:
  /// **'Organizers'**
  String get searchOrganizers;

  /// No description provided for @searchAttendees.
  ///
  /// In en, this message translates to:
  /// **'Attendees'**
  String get searchAttendees;

  /// No description provided for @searchEmpty.
  ///
  /// In en, this message translates to:
  /// **'No events found'**
  String get searchEmpty;

  /// No description provided for @searchEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Try adjusting your filters or search terms.'**
  String get searchEmptyHint;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsTimezone.
  ///
  /// In en, this message translates to:
  /// **'Timezone'**
  String get settingsTimezone;

  /// No description provided for @settingsHideDeclinedEvents.
  ///
  /// In en, this message translates to:
  /// **'Hide declined events'**
  String get settingsHideDeclinedEvents;

  /// No description provided for @settingsDisplayWeekNumbers.
  ///
  /// In en, this message translates to:
  /// **'Display week numbers'**
  String get settingsDisplayWeekNumbers;

  /// No description provided for @settingsBusinessHours.
  ///
  /// In en, this message translates to:
  /// **'Business hours'**
  String get settingsBusinessHours;

  /// No description provided for @settingsWorkingDays.
  ///
  /// In en, this message translates to:
  /// **'Working days'**
  String get settingsWorkingDays;

  /// No description provided for @settingsAlarmEmails.
  ///
  /// In en, this message translates to:
  /// **'Email reminders'**
  String get settingsAlarmEmails;

  /// No description provided for @settingsTimezoneSearch.
  ///
  /// In en, this message translates to:
  /// **'Search timezone…'**
  String get settingsTimezoneSearch;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get errorTitle;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occurred'**
  String get errorUnknown;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'Network error. Check your connection.'**
  String get errorNetwork;

  /// No description provided for @errorAuth.
  ///
  /// In en, this message translates to:
  /// **'Authentication required. Please sign in again.'**
  String get errorAuth;

  /// No description provided for @splashLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading…'**
  String get splashLoading;

  /// No description provided for @loginCallbackLoading.
  ///
  /// In en, this message translates to:
  /// **'Signing you in…'**
  String get loginCallbackLoading;

  /// No description provided for @wsClosedUnexpectedly.
  ///
  /// In en, this message translates to:
  /// **'Connection closed unexpectedly'**
  String get wsClosedUnexpectedly;

  /// No description provided for @wsReconnected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get wsReconnected;

  /// No description provided for @wsBrowserOnline.
  ///
  /// In en, this message translates to:
  /// **'Back online'**
  String get wsBrowserOnline;

  /// No description provided for @wsBrowserOffline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get wsBrowserOffline;

  /// No description provided for @syncConflictsTitle.
  ///
  /// In en, this message translates to:
  /// **'Conflicts to resolve'**
  String get syncConflictsTitle;

  /// No description provided for @syncConflictsBadge.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 conflict} other{{count} conflicts}}'**
  String syncConflictsBadge(int count);

  /// No description provided for @syncKeepLocal.
  ///
  /// In en, this message translates to:
  /// **'Keep my version'**
  String get syncKeepLocal;

  /// No description provided for @syncKeepServer.
  ///
  /// In en, this message translates to:
  /// **'Keep server version'**
  String get syncKeepServer;

  /// No description provided for @syncMerge.
  ///
  /// In en, this message translates to:
  /// **'Merge manually'**
  String get syncMerge;

  /// No description provided for @greeting.
  ///
  /// In en, this message translates to:
  /// **'Hello {name}'**
  String greeting(String name);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr', 'ru', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
    case 'ru':
      return AppLocalizationsRu();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
