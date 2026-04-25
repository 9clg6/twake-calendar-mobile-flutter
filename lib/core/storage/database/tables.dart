import 'package:drift/drift.dart';

/// Calendars cached locally for offline reads.
///
/// `syncToken` enables incremental REPORT requests (only fetch what changed
/// since the last sync). `lastFetchedAt` is the wall-clock timestamp at
/// which we last successfully refreshed this calendar.
@DataClassName('CalendarRow')
class CalendarsTable extends Table {
  /// Primary key — calendar id (server-assigned).
  TextColumn get id => text()();

  /// CalDAV link relative to the side-service base.
  TextColumn get link => text()();

  /// Display name.
  TextColumn get name => text()();

  /// Owner ID (cross-references shared/UserEntity).
  TextColumn get ownerId => text()();

  /// Hex color for the light theme, including the `#` prefix.
  TextColumn get colorLight => text().nullable()();

  /// Hex color for the dark theme.
  TextColumn get colorDark => text().nullable()();

  /// Free-form description.
  TextColumn get description => text().nullable()();

  /// Whether this calendar is delegated.
  BoolColumn get delegated => boolean().withDefault(const Constant<bool>(false))();

  /// Sync token returned by the server on the last successful REPORT.
  TextColumn get syncToken => text().nullable()();

  /// Last successful refresh timestamp (millis since epoch).
  IntColumn get lastFetchedAt => integer().nullable()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

/// Events cached locally. The full jCal master and any overrides are stored
/// as raw JSON to round-trip back to the backend without losing
/// passthroughProps.
@DataClassName('EventRow')
class EventsTable extends Table {
  /// Composite primary key part — event uid (with optional `/recurrenceId`
  /// suffix for occurrence overrides, mirroring the entity).
  TextColumn get uid => text()();

  /// Calendar id this event belongs to.
  TextColumn get calId => text()();

  /// CalDAV URL for the event.
  TextColumn get url => text()();

  /// Optional ETag for optimistic concurrency.
  TextColumn get etag => text().nullable()();

  /// jCal master serialized as JSON.
  TextColumn get jcalMaster => text()();

  /// jCal overrides serialized as JSON array (empty array when none).
  TextColumn get jcalOverridesJson =>
      text().withDefault(const Constant<String>('[]'))();

  /// DTSTART (ISO 8601) — used for time-range queries.
  TextColumn get dtstart => text()();

  /// DTEND (ISO 8601), nullable for instantaneous events.
  TextColumn get dtend => text().nullable()();

  /// iCalendar STATUS or null.
  TextColumn get status => text().nullable()();

  /// Whether the row is dirty and pending a flush via the outbox.
  BoolColumn get isDirty =>
      boolean().withDefault(const Constant<bool>(false))();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{uid, calId};
}

/// Mutation queued while offline (PUT/DELETE/MOVE/COUNTER).
@DataClassName('OutboxRow')
class OutboxTable extends Table {
  /// Auto-incrementing identifier.
  IntColumn get id => integer().autoIncrement()();

  /// Operation type (`put`, `delete`, `move`, `counter`, `partstat`).
  TextColumn get opType => text()();

  /// Calendar id targeted by the mutation.
  TextColumn get calId => text()();

  /// Event uid targeted by the mutation.
  TextColumn get eventUid => text()();

  /// Operation payload serialized as JSON.
  TextColumn get payload => text()();

  /// Number of failed attempts so far.
  IntColumn get attempts => integer().withDefault(const Constant<int>(0))();

  /// Last error message captured during a flush attempt.
  TextColumn get lastError => text().nullable()();

  /// Insertion timestamp (millis since epoch).
  IntColumn get createdAt => integer()();

  /// Earliest timestamp at which the next flush should be attempted.
  IntColumn get nextRetryAt =>
      integer().withDefault(const Constant<int>(0))();
}

/// Conflicts pending user resolution (412 ETag mismatches that occur during
/// outbox flush).
@DataClassName('ConflictRow')
class ConflictsTable extends Table {
  /// Auto-incrementing identifier.
  IntColumn get id => integer().autoIncrement()();

  /// Event uid in conflict.
  TextColumn get eventUid => text()();

  /// Calendar id.
  TextColumn get calId => text()();

  /// Local version (jCal serialized as JSON).
  TextColumn get localJcal => text()();

  /// Server version (jCal serialized as JSON).
  TextColumn get serverJcal => text()();

  /// Insertion timestamp.
  IntColumn get occurredAt => integer()();
}

/// Generic key-value sync metadata (last full sync timestamp, last WS ping
/// success, etc.).
@DataClassName('SyncMetaRow')
class SyncMetaTable extends Table {
  /// Metadata key (e.g. `lastFullSyncAt`).
  TextColumn get key => text()();

  /// Stored value as a string (callers parse as needed).
  TextColumn get value => text()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{key};
}
