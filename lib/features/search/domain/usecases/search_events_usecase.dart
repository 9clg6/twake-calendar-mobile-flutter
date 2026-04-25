import 'package:twake_calendar_mobile/core/interfaces/future_usecase.dart';
import 'package:twake_calendar_mobile/features/search/domain/entities/search_hit.dart';
import 'package:twake_calendar_mobile/features/search/domain/params/search_events_params.dart';
import 'package:twake_calendar_mobile/features/search/domain/repositories/event_search_repository.dart';

/// Searches events matching the supplied [SearchEventsParams].
final class SearchEventsUseCase
    extends FutureUseCaseWithParams<List<SearchHitEntity>, SearchEventsParams> {
  /// Creates a [SearchEventsUseCase].
  SearchEventsUseCase({required EventSearchRepository repository})
      : _repository = repository;

  final EventSearchRepository _repository;

  @override
  Future<List<SearchHitEntity>> invoke(SearchEventsParams params) =>
      _repository.search(params);
}
