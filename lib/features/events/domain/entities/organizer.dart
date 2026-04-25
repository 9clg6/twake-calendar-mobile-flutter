import 'package:freezed_annotation/freezed_annotation.dart';

part 'organizer.freezed.dart';

/// Organizer of an event (iCalendar ORGANIZER property).
///
/// The address is stored without the `mailto:` prefix; the codec re-adds it
/// when serializing to jCal.
@freezed
abstract class OrganizerEntity with _$OrganizerEntity {
  /// Creates an [OrganizerEntity].
  const factory OrganizerEntity({
    required String calAddress,
    @Default('') String cn,
  }) = _OrganizerEntity;
}
