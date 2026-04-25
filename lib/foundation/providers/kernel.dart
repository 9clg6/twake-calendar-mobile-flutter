import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/network/auth_interceptor.dart';
import 'package:twake_calendar_mobile/core/network/dio_client.dart';
import 'package:twake_calendar_mobile/core/network/dio_client_provider.dart';
import 'package:twake_calendar_mobile/features/auth/auth_providers.dart';
import 'package:twake_calendar_mobile/features/auth/domain/entities/auth_token.dart';
import 'package:twake_calendar_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:twake_calendar_mobile/features/auth/presentation/controllers/auth_controller.dart';

/// One-shot bootstrap provider attaching the authentication interceptors to
/// the singleton [DioClient].
///
/// Watch this provider once at app start (e.g. inside `main.dart` after
/// runApp, or during the splash screen) so HTTP requests carry a Bearer
/// token and trigger re-authentication on 401s.
final FutureProvider<void> kernelProvider = FutureProvider<void>(
  (Ref<AsyncValue<void>> ref) async {
    final DioClient client = ref.watch(dioClientProvider);
    final AuthRepository authRepository = ref.watch(authRepositoryProvider);

    client.attach(
      AuthInterceptor(
        tokenProvider: () async {
          final AuthTokenEntity? current =
              await authRepository.currentToken();
          return current?.accessToken;
        },
        onUnauthorized: () async {
          await ref.read(authControllerProvider.notifier).signOut();
        },
      ),
    );
  },
  name: 'kernelProvider',
);
