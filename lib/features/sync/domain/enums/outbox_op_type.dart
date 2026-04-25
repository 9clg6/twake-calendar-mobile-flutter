/// Operation type stored in the outbox queue.
enum OutboxOpType {
  /// Create or update an event (CalDAV PUT with jCal body).
  put('put'),

  /// Delete an event (CalDAV DELETE).
  delete('delete'),

  /// Move an event between calendars (CalDAV MOVE).
  move('move'),

  /// Counter-proposal (iTIP COUNTER).
  counter('counter'),

  /// Update participation status only (RSVP).
  partstat('partstat');

  const OutboxOpType(this.wireValue);

  /// Wire value persisted in the database.
  final String wireValue;

  /// Builds an [OutboxOpType] from its wire value.
  static OutboxOpType fromWire(String value) => values.firstWhere(
        (OutboxOpType op) => op.wireValue == value,
        orElse: () => OutboxOpType.put,
      );
}
