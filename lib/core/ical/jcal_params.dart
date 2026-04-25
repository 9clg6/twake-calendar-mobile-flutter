/// Helpers for case-insensitive lookup in a jCal property params map.
///
/// Backend may send `tzid`, `TZID`, `Tzid`, etc. — RFC 5545 is case-insensitive
/// for parameter names.
abstract final class JCalParams {
  /// Returns the value of [paramName] in [params] regardless of key case.
  static dynamic get(Map<String, dynamic> params, String paramName) {
    final String lower = paramName.toLowerCase();
    for (final MapEntry<String, dynamic> entry in params.entries) {
      if (entry.key.toLowerCase() == lower) {
        return entry.value;
      }
    }
    return null;
  }

  /// Returns the `tzid` parameter as a String, or `null` if absent.
  static String? tzid(Map<String, dynamic> params) {
    final dynamic raw = get(params, 'tzid');
    return raw is String ? raw : null;
  }
}
