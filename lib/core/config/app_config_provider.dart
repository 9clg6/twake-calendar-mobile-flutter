import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/config/app_config.dart';
import 'package:twake_calendar_mobile/core/config/impl/runtime_app_config.dart';

/// Provider exposing the singleton [AppConfig] of the running app.
///
/// `keepAlive: true` because the configuration is required by every layer
/// and never disposed.
final Provider<AppConfig> appConfigProvider = Provider<AppConfig>(
  (Ref<AppConfig> ref) => RuntimeAppConfig(),
  name: 'appConfigProvider',
);
