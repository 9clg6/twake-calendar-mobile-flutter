/// Whether the event blocks the user's free/busy slot.
enum Transparency {
  /// Slot is busy.
  opaque('OPAQUE'),

  /// Slot remains free.
  transparent('TRANSPARENT');

  const Transparency(this.icalValue);

  /// Wire value.
  final String icalValue;

  /// Builds a [Transparency] from its wire value.
  static Transparency fromIcal(String? value) {
    if (value == null) return Transparency.opaque;
    return value.toUpperCase() == 'TRANSPARENT'
        ? Transparency.transparent
        : Transparency.opaque;
  }
}
