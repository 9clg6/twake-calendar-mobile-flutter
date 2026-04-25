import 'package:twake_calendar_mobile/features/search/data/models/search_response.remote_model.dart';
import 'package:twake_calendar_mobile/features/search/domain/entities/search_hit.dart';

/// Mapper [SearchHitRemoteModel] -> [SearchHitEntity].
extension SearchHitRemoteModelX on SearchHitRemoteModel {
  /// Converts to the domain entity.
  SearchHitEntity toEntity() => SearchHitEntity(
        uid: uid,
        summary: summary,
        start: start,
        end: end,
        organizer: organizer,
        location: location,
      );
}
