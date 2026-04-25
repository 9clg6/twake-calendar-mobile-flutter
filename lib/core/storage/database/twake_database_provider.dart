import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/storage/database/twake_database.dart';

/// Singleton [TwakeDatabase] — opened once for the lifetime of the app.
final Provider<TwakeDatabase> twakeDatabaseProvider = Provider<TwakeDatabase>(
  (Ref<TwakeDatabase> ref) {
    final TwakeDatabase database = TwakeDatabase();
    ref.onDispose(database.close);
    return database;
  },
  name: 'twakeDatabaseProvider',
);
