import 'package:twake_calendar_mobile/features/people/domain/entities/person.dart';

/// Contract for searching people (users + contacts).
abstract interface class PeopleRepository {
  /// Searches people whose display name or email matches [query].
  Future<List<PersonEntity>> search(String query);
}
