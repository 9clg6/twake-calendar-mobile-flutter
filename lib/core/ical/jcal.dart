/// Type alias for jCal payloads — nested arrays per RFC 7265.
typedef JCal = List<dynamic>;

/// Type alias for a jCal property (`[name, params, type, value]`).
typedef JCalProperty = List<dynamic>;

/// Type alias for a jCal component (`[name, propertiesArray, subComponentsArray]`).
typedef JCalComponent = List<dynamic>;

/// Constants for the jCal format used by esn-sabre.
abstract final class JCalConstants {
  /// jCal version property value.
  static const String version = '2.0';

  /// jCal product identifier — must match the web frontend output.
  static const String prodid = '-//OpenPaaS//OpenPaaS//EN';

  /// Set of property names handled explicitly when parsing a VEVENT.
  ///
  /// Anything else lands in `passthroughProps` to be re-emitted at build time
  /// (see `core/ical/jcal_codec.dart`).
  static const Set<String> knownVeventProps = <String>{
    'uid',
    'transp',
    'dtstart',
    'dtend',
    'class',
    'x-openpaas-videoconference',
    'summary',
    'description',
    'location',
    'organizer',
    'attendee',
    'dtstamp',
    'sequence',
    'recurrence-id',
    'exdate',
    'status',
    'duration',
    'rrule',
  };
}
