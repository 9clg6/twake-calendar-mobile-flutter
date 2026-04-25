/// Role of an attendee in an event (iCalendar ROLE parameter).
enum AttendeeRole {
  /// Meeting chair (organizer or co-organizer).
  chair('CHAIR'),

  /// Required participant — default.
  reqParticipant('REQ-PARTICIPANT'),

  /// Optional participant.
  optParticipant('OPT-PARTICIPANT'),

  /// Information only (no expected participation).
  nonParticipant('NON-PARTICIPANT');

  const AttendeeRole(this.icalValue);

  /// Wire value used by the backend (uppercase per RFC 5545).
  final String icalValue;

  /// Builds an [AttendeeRole] from its iCalendar wire value, defaulting to
  /// [AttendeeRole.reqParticipant].
  static AttendeeRole fromIcal(String? value) {
    if (value == null) return AttendeeRole.reqParticipant;
    final String upper = value.toUpperCase();
    return values.firstWhere(
      (AttendeeRole r) => r.icalValue == upper,
      orElse: () => AttendeeRole.reqParticipant,
    );
  }
}
