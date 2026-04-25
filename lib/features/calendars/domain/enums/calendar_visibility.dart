/// Visibility of a calendar (private to the owner vs public-shareable).
enum CalendarVisibility {
  /// Private — only the owner sees it.
  privateVisibility,

  /// Public — shareable via secret link.
  publicVisibility;

  /// Builds a [CalendarVisibility] from the wire value.
  static CalendarVisibility fromWire(String? value) {
    return value == 'public'
        ? CalendarVisibility.publicVisibility
        : CalendarVisibility.privateVisibility;
  }
}
