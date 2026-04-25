/// Participation status of an attendee on an event (iCalendar PARTSTAT).
enum Partstat {
  /// No response yet — default for newly invited attendees.
  needsAction('NEEDS-ACTION'),

  /// Attendee accepted the invitation.
  accepted('ACCEPTED'),

  /// Attendee declined the invitation.
  declined('DECLINED'),

  /// Attendee tentatively accepted (maybe).
  tentative('TENTATIVE'),

  /// Attendee delegated their participation to another person.
  delegated('DELEGATED'),

  /// Attendee marked their participation as completed (todo-style events).
  completed('COMPLETED');

  const Partstat(this.icalValue);

  /// Wire value used by the backend (uppercase per RFC 5545).
  final String icalValue;

  /// Builds a [Partstat] from its iCalendar wire value, defaulting to
  /// [Partstat.needsAction] for unknown inputs.
  static Partstat fromIcal(String? value) {
    if (value == null) return Partstat.needsAction;
    final String upper = value.toUpperCase();
    return values.firstWhere(
      (Partstat p) => p.icalValue == upper,
      orElse: () => Partstat.needsAction,
    );
  }

  /// Whether the attendee actively responded.
  bool get hasResponded =>
      this == Partstat.accepted ||
      this == Partstat.declined ||
      this == Partstat.tentative;
}
