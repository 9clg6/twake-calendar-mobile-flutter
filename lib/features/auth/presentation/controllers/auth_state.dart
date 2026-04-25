import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twake_calendar_mobile/features/auth/domain/entities/auth_token.dart';

part 'auth_state.freezed.dart';

/// Synchronous projection of the auth status, suitable for redirect guards.
@freezed
abstract class AuthState with _$AuthState {
  /// Creates an [AuthState].
  const factory AuthState({
    @Default(false) bool isLoggedIn,
    @Default(false) bool isLoading,
    AuthTokenEntity? token,
    String? error,
  }) = _AuthState;

  /// Initial state — not logged in, not loading.
  factory AuthState.initial() => const AuthState();
}
