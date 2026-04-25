/// RRULE frequency.
enum RepeatFreq {
  /// Daily recurrence.
  daily('DAILY'),

  /// Weekly recurrence.
  weekly('WEEKLY'),

  /// Monthly recurrence.
  monthly('MONTHLY'),

  /// Yearly recurrence.
  yearly('YEARLY');

  const RepeatFreq(this.icalValue);

  /// Wire value (UPPERCASE in jCal — lowercase in domain entity).
  final String icalValue;

  /// Builds a [RepeatFreq] from its wire value (case-insensitive).
  static RepeatFreq? fromIcal(String? value) {
    if (value == null) return null;
    final String upper = value.toUpperCase();
    return values.firstWhere(
      (RepeatFreq f) => f.icalValue == upper,
      orElse: () => RepeatFreq.daily,
    );
  }
}
