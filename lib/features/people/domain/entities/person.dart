import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';

/// A person matched by the side-service search endpoint.
@freezed
abstract class PersonEntity with _$PersonEntity {
  /// Creates a [PersonEntity].
  const factory PersonEntity({
    required String id,
    required String displayName,
    required String email,
    @Default('user') String objectType,
  }) = _PersonEntity;
}
