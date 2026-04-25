import 'package:twake_calendar_mobile/core/interfaces/future_usecase.dart';
import 'package:twake_calendar_mobile/features/auth/domain/entities/auth_token.dart';
import 'package:twake_calendar_mobile/features/auth/domain/repositories/auth_repository.dart';

/// Triggers the OIDC sign-in flow.
final class SignInUseCase extends FutureUseCase<AuthTokenEntity> {
  /// Creates a [SignInUseCase].
  SignInUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Future<AuthTokenEntity> invoke() => _authRepository.signIn();
}
