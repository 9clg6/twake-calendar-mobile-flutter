import 'package:twake_calendar_mobile/core/interfaces/future_usecase.dart';
import 'package:twake_calendar_mobile/features/auth/domain/repositories/auth_repository.dart';

/// Signs the current user out and clears local credentials.
final class SignOutUseCase extends FutureUseCase<void> {
  /// Creates a [SignOutUseCase].
  SignOutUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Future<void> invoke() => _authRepository.signOut();
}
