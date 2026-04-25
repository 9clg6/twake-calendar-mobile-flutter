/// iTIP STATUS of an event.
enum EventStatus {
  /// The event is confirmed.
  confirmed('CONFIRMED'),

  /// The event is tentative (not yet confirmed by the organizer).
  tentative('TENTATIVE'),

  /// The event has been cancelled by the organizer.
  cancelled('CANCELLED');

  const EventStatus(this.icalValue);

  /// Wire value (uppercase).
  final String icalValue;

  /// Builds an [EventStatus] from its wire value.
  static EventStatus? fromIcal(String? value) {
    if (value == null) return null;
    final String upper = value.toUpperCase();
    return values.firstWhere(
      (EventStatus s) => s.icalValue == upper,
      orElse: () => EventStatus.confirmed,
    );
  }
}
