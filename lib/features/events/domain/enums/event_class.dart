/// Privacy classification of an event.
enum EventClass {
  /// Visible to all attendees and shared calendars.
  publicClass('PUBLIC'),

  /// Visible only to the owner; details masked elsewhere.
  privateClass('PRIVATE'),

  /// Hybrid — visible time slot but masked content.
  confidential('CONFIDENTIAL');

  const EventClass(this.icalValue);

  /// Wire value (uppercase).
  final String icalValue;

  /// Builds an [EventClass] from its wire value.
  static EventClass fromIcal(String? value) {
    if (value == null) return EventClass.publicClass;
    final String upper = value.toUpperCase();
    return values.firstWhere(
      (EventClass c) => c.icalValue == upper,
      orElse: () => EventClass.publicClass,
    );
  }
}
