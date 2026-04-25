import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:twake_calendar_mobile/features/auth/domain/entities/auth_token.dart';

/// Local data source persisting the OIDC token bundle in the OS-level secure
/// storage (Keychain on iOS, EncryptedSharedPreferences on Android).
abstract interface class AuthLocalDataSource {
  /// Returns the persisted token, or null when none is stored.
  Future<AuthTokenEntity?> getToken();

  /// Persists [token].
  Future<void> saveToken(AuthTokenEntity token);

  /// Clears any stored token.
  Future<void> clear();
}

/// [FlutterSecureStorage]-backed implementation.
final class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  /// Creates an [AuthLocalDataSourceImpl].
  AuthLocalDataSourceImpl({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  /// Storage key for the serialized token bundle.
  static const String key = 'auth.token';

  final FlutterSecureStorage _storage;

  @override
  Future<AuthTokenEntity?> getToken() async {
    final String? raw = await _storage.read(key: key);
    if (raw == null) return null;
    final Map<String, dynamic> json = jsonDecode(raw) as Map<String, dynamic>;
    return AuthTokenEntity(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String?,
      idToken: json['idToken'] as String?,
      expiresAt: json['expiresAt'] is String
          ? DateTime.parse(json['expiresAt'] as String)
          : null,
    );
  }

  @override
  Future<void> saveToken(AuthTokenEntity token) async {
    final String raw = jsonEncode(<String, dynamic>{
      'accessToken': token.accessToken,
      'refreshToken': token.refreshToken,
      'idToken': token.idToken,
      'expiresAt': token.expiresAt?.toIso8601String(),
    });
    await _storage.write(key: key, value: raw);
  }

  @override
  Future<void> clear() => _storage.delete(key: key);
}
