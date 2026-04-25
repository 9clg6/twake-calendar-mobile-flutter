import 'package:freezed_annotation/freezed_annotation.dart';

part 'delegation_access.freezed.dart';

/// Granular permissions on a delegated calendar.
@freezed
abstract class DelegationAccessEntity with _$DelegationAccessEntity {
  /// Creates a [DelegationAccessEntity].
  const factory DelegationAccessEntity({
    @Default(false) bool freeBusy,
    @Default(false) bool read,
    @Default(false) bool write,
    @Default(false) bool writeProperties,
    @Default(false) bool all,
  }) = _DelegationAccessEntity;
}
