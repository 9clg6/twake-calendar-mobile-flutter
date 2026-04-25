import 'package:twake_calendar_mobile/features/people/data/endpoints/people_search_endpoint.dart';
import 'package:twake_calendar_mobile/features/people/data/models/people_search_request.remote_model.dart';
import 'package:twake_calendar_mobile/features/people/data/models/people_search_response.remote_model.dart';
import 'package:twake_calendar_mobile/features/people/domain/entities/person.dart';
import 'package:twake_calendar_mobile/features/people/domain/repositories/people_repository.dart';

/// Side-service backed [PeopleRepository].
final class PeopleRepositoryImpl implements PeopleRepository {
  /// Creates a [PeopleRepositoryImpl].
  const PeopleRepositoryImpl({required PeopleSearchEndpoint endpoint})
      : _endpoint = endpoint;

  final PeopleSearchEndpoint _endpoint;

  @override
  Future<List<PersonEntity>> search(String query) async {
    if (query.trim().isEmpty) return const <PersonEntity>[];
    final List<PeopleHitRemoteModel> hits = await _endpoint.search(
      PeopleSearchRequestRemoteModel(q: query),
    );
    return hits.map(_toEntity).toList(growable: false);
  }

  PersonEntity _toEntity(PeopleHitRemoteModel hit) {
    final String displayName = hit.names
            .map((PeopleNameRemoteModel n) => n.displayName)
            .firstWhere(
              (String? n) => n != null && n.isNotEmpty,
              orElse: () => null,
            ) ??
        '';
    final String email = hit.emails
            .map((PeopleEmailRemoteModel e) => e.value)
            .firstWhere(
              (String? v) => v != null && v.isNotEmpty,
              orElse: () => null,
            ) ??
        '';
    return PersonEntity(
      id: hit.id,
      displayName: displayName.isEmpty ? email : displayName,
      email: email,
      objectType: hit.objectType ?? 'user',
    );
  }
}
