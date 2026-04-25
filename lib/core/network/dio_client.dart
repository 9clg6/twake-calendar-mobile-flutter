import 'package:dio/dio.dart';
import 'package:twake_calendar_mobile/core/config/app_config.dart';

/// Builds the singleton [Dio] used by every Retrofit endpoint.
///
/// Interceptors (auth, WS-alive guard, logging) are added on top of this
/// instance via [attach].
final class DioClient {
  /// Creates a [DioClient] from the given [config].
  DioClient(AppConfig config)
      : dio = Dio(
          BaseOptions(
            baseUrl: config.calendarBaseUrl,
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 30),
            sendTimeout: const Duration(seconds: 30),
            headers: <String, String>{
              'Accept': 'application/json',
            },
          ),
        );

  /// Underlying Dio instance.
  final Dio dio;

  /// Attaches an interceptor.
  void attach(Interceptor interceptor) => dio.interceptors.add(interceptor);
}
