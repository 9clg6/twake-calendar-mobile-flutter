import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/repeat_freq.dart';

part 'repetition.freezed.dart';

/// Recurrence rule of an event (RRULE).
///
/// Mutually exclusive: [count] XOR [until]. The codec normalizes whichever is
/// set when serializing.
@freezed
abstract class RepetitionEntity with _$RepetitionEntity {
  /// Creates a [RepetitionEntity].
  const factory RepetitionEntity({
    required RepeatFreq freq,
    @Default(1) int interval,
    @Default(<String>[]) List<String> byday,
    int? count,
    String? until,
  }) = _RepetitionEntity;
}
