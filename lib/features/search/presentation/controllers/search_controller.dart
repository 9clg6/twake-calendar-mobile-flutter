import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/interfaces/result_state.dart';
import 'package:twake_calendar_mobile/features/search/domain/entities/search_hit.dart';
import 'package:twake_calendar_mobile/features/search/domain/params/search_events_params.dart';
import 'package:twake_calendar_mobile/features/search/domain/usecases/search_events_usecase.dart';
import 'package:twake_calendar_mobile/features/search/presentation/controllers/search_state.dart';
import 'package:twake_calendar_mobile/features/search/search_providers.dart';

/// Search controller for events.
final class EventSearchController extends Notifier<SearchState> {
  @override
  SearchState build() => SearchState.initial();

  /// Updates the query without firing a search.
  void onQueryChanged(String value) =>
      state = state.copyWith(query: value, error: null);

  /// Fires the search using the current query.
  Future<void> submit() async {
    final String query = state.query.trim();
    if (query.isEmpty) {
      state = state.copyWith(results: <SearchHitEntity>[], error: null);
      return;
    }
    state = state.copyWith(isLoading: true, error: null);
    try {
      final SearchEventsUseCase useCase =
          await ref.read(searchEventsUseCaseProvider.future);
      final ResultState<List<SearchHitEntity>> result =
          await useCase.execute(SearchEventsParams(query: query));
      result.when(
        success: (List<SearchHitEntity> hits) => state = state.copyWith(
          results: hits,
          isLoading: false,
        ),
        failure: (Exception e) => state = state.copyWith(
          isLoading: false,
          error: e.toString(),
        ),
      );
    } on Exception catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

/// Provider for [EventSearchController].
final NotifierProvider<EventSearchController, SearchState>
    eventSearchControllerProvider =
    NotifierProvider<EventSearchController, SearchState>(
  EventSearchController.new,
  name: 'eventSearchControllerProvider',
);
