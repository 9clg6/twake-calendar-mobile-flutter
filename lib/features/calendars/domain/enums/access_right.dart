/// Access right granted to an attendee on a shared calendar.
enum AccessRight {
  /// View only — read free/busy + event details.
  view(2),

  /// Editor — view + create/edit/delete events.
  editor(3),

  /// Admin — view + edit + manage sharing.
  admin(5);

  const AccessRight(this.wireValue);

  /// Wire value used by the backend.
  final int wireValue;

  /// Builds an [AccessRight] from its wire value.
  static AccessRight? fromWire(int? value) {
    if (value == null) return null;
    return values.firstWhere(
      (AccessRight r) => r.wireValue == value,
      orElse: () => AccessRight.view,
    );
  }
}
