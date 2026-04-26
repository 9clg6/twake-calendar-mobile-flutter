import 'package:twake_calendar_mobile/features/auth/domain/entities/auth_token.dart';
import 'package:twake_calendar_mobile/features/auth/domain/repositories/auth_repository.dart';

/// Compile-time flag flipping the app into a fully offline demo mode:
/// every repository hits the in-memory fakes, no network call is made,
/// and the user is auto-authenticated. Toggle with
/// `--dart-define=DEMO_MODE=true` (defaults to true so `flutter run`
/// boots straight into the calendar).
const bool kDemoMode = bool.fromEnvironment('DEMO_MODE', defaultValue: true);

/// Public iCalendar feed used as the source of truth in demo mode.
/// Override at compile-time with `--dart-define=DEMO_ICS_URL=...`.
const String kDemoIcsFeedUrl = String.fromEnvironment(
  'DEMO_ICS_URL',
  defaultValue:
      'https://twcalendar.linagora.com/api/calendars/'
      '69a6b366dbe2241a56db7a88/69a6b366dbe2241a56db7a88/calendar.ics'
      '?token=pN_UQ6-0_vWgefrDdoCcFROOJIVwFw',
);

/// In-memory [AuthRepository] that always reports the user as logged in.
/// Used in demo mode to skip the OIDC flow entirely.
final class InMemoryAuthRepository implements AuthRepository {
  /// Creates an [InMemoryAuthRepository].
  InMemoryAuthRepository();

  AuthTokenEntity? _stored = const AuthTokenEntity(accessToken: 'demo');

  @override
  Future<AuthTokenEntity?> currentToken() async => _stored;

  @override
  Future<AuthTokenEntity> refresh() async =>
      const AuthTokenEntity(accessToken: 'demo');

  @override
  Future<AuthTokenEntity> signIn() async {
    _stored = const AuthTokenEntity(accessToken: 'demo');
    return _stored!;
  }

  @override
  Future<void> signOut() async {
    _stored = null;
  }
}
