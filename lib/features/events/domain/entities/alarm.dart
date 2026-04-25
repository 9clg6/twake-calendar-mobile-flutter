import 'package:freezed_annotation/freezed_annotation.dart';

part 'alarm.freezed.dart';

/// Reminder attached to an event (iCalendar VALARM sub-component).
@freezed
abstract class AlarmEntity with _$AlarmEntity {
  /// Creates an [AlarmEntity].
  const factory AlarmEntity({
    required String trigger,
    @Default('DISPLAY') String action,
    String? description,
  }) = _AlarmEntity;
}
