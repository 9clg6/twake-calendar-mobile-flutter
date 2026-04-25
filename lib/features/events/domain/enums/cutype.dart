/// Calendar user type (iCalendar CUTYPE parameter).
enum CuType {
  /// Individual person — default.
  individual('INDIVIDUAL'),

  /// Group / mailing list.
  group('GROUP'),

  /// Resource (room, equipment).
  resource('RESOURCE'),

  /// Physical room.
  room('ROOM');

  const CuType(this.icalValue);

  /// Wire value (uppercase per RFC 5545).
  final String icalValue;

  /// Builds a [CuType] from its wire value, defaulting to [CuType.individual].
  static CuType fromIcal(String? value) {
    if (value == null) return CuType.individual;
    final String upper = value.toUpperCase();
    return values.firstWhere(
      (CuType c) => c.icalValue == upper,
      orElse: () => CuType.individual,
    );
  }
}
