/// Helpers for jCal date / date-time string formatting.
abstract final class JCalValueFormat {
  /// All-day regex (RFC 5545 DATE: `YYYYMMDD` or jCal `YYYY-MM-DD`).
  static final RegExp allDayPattern =
      RegExp(r'^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])$');

  /// Returns true if [value] looks like an all-day jCal date.
  static bool isAllDayValue(String value) => allDayPattern.hasMatch(value);

  /// Returns true if [value] ends with `Z` (UTC indicator).
  static bool isUtcValue(String value) => value.endsWith('Z');

  /// Formats [date] in the jCal `date-time` shape: `YYYY-MM-DDTHH:mm:ss`,
  /// without trailing `Z` (timezone is carried by the `tzid` parameter).
  static String dateTime(DateTime date) {
    final String iso = date.toIso8601String();
    // `YYYY-MM-DDTHH:mm:ss.sssZ` -> `YYYY-MM-DDTHH:mm:ss`
    final String stripped = iso.contains('.')
        ? iso.substring(0, iso.indexOf('.'))
        : iso.endsWith('Z')
            ? iso.substring(0, iso.length - 1)
            : iso;
    return stripped;
  }

  /// Formats [date] as `YYYY-MM-DD` (all-day).
  static String dateOnly(DateTime date) =>
      '${date.year.toString().padLeft(4, '0')}-'
      '${date.month.toString().padLeft(2, '0')}-'
      '${date.day.toString().padLeft(2, '0')}';
}
