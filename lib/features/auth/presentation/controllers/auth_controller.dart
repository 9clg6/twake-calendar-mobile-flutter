import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/logging/log.dart';
import 'package:twake_calendar_mobile/features/auth/auth_providers.dart';
import 'package:twake_calendar_mobile/features/auth/domain/entities/auth_token.dart';
import 'package:twake_calendar_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:twake_calendar_mobile/features/auth/presentation/controllers/auth_state.dart';

/// Controller exposing the synchronous [AuthState] consumed by route guards
/// and screens.
///
/// Build runs once on first access to hydrate from the secure storage. The
/// `signIn` and `signOut` methods delegate to the repository and update the
/// state accordingly.
final class AuthController extends Notifier<AuthState> {
  late AuthRepository _authRepository;
  final Log _log = Log.named('AuthController');

  @override
  AuthState build() {
    _authRepository = ref.read(authRepositoryProvider);
    _hydrate();
    return AuthState.initial().copyWith(isLoading: true);
  }

  Future<void> _hydrate() async {
    try {
      final AuthTokenEntity? token = await _authRepository.currentToken();
      state = state.copyWith(
        isLoading: false,
        isLoggedIn: token != null && !token.isExpired,
        token: token,
      );
    } on Exception catch (e, st) {
      _log.error('Failed to hydrate auth state', e, st);
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Launches the OIDC sign-in flow.
  Future<void> signIn() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final AuthTokenEntity token = await _authRepository.signIn();
      state = state.copyWith(
        isLoading: false,
        isLoggedIn: true,
        token: token,
      );
    } on Exception catch (e, st) {
      _log.error('Sign-in failed', e, st);
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Logs the user out and clears stored credentials.
  Future<void> signOut() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _authRepository.signOut();
      state = AuthState.initial();
    } on Exception catch (e, st) {
      _log.error('Sign-out failed', e, st);
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

/// Provider for [AuthController].
final NotifierProvider<AuthController, AuthState> authControllerProvider =
    NotifierProvider<AuthController, AuthState>(
  AuthController.new,
  name: 'authControllerProvider',
);
