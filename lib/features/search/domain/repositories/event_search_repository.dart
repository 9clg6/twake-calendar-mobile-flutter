import 'package:twake_calendar_mobile/features/search/domain/entities/search_hit.dart';
import 'package:twake_calendar_mobile/features/search/domain/params/search_events_params.dart';

/// Contract for searching events.
abstract interface class EventSearchRepository {
  /// Returns up to 30 hits for [params].
  Future<List<SearchHitEntity>> search(SearchEventsParams params);
}
