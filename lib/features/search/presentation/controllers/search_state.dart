import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twake_calendar_mobile/features/search/domain/entities/search_hit.dart';

part 'search_state.freezed.dart';

/// State of the search screen.
@freezed
abstract class SearchState with _$SearchState {
  /// Creates a [SearchState].
  const factory SearchState({
    @Default('') String query,
    @Default(<SearchHitEntity>[]) List<SearchHitEntity> results,
    @Default(false) bool isLoading,
    String? error,
  }) = _SearchState;

  /// Empty initial state.
  factory SearchState.initial() => const SearchState();
}
