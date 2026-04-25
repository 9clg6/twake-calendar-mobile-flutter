import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/config/app_config_provider.dart';
import 'package:twake_calendar_mobile/core/network/dio_client.dart';

/// Singleton [DioClient]. Interceptors (auth, WS-alive) are attached during
/// the kernel bootstrap.
final Provider<DioClient> dioClientProvider = Provider<DioClient>(
  (Ref<DioClient> ref) => DioClient(ref.watch(appConfigProvider)),
  name: 'dioClientProvider',
);
