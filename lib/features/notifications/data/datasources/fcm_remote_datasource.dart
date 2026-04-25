import 'package:firebase_messaging/firebase_messaging.dart';

/// Wrapper around [FirebaseMessaging] used by the notifications feature.
abstract interface class FcmRemoteDataSource {
  /// Requests notification permission and returns the platform-issued FCM
  /// token. Returns null when the user denies permission or the device is
  /// running on the simulator without APNs certificates.
  Future<String?> requestTokenAndPermission();

  /// Stream of token refreshes (the platform may rotate the token).
  Stream<String> get onTokenRefresh;

  /// Stream of foreground messages.
  Stream<RemoteMessage> get onMessage;
}

/// Default implementation backed by [FirebaseMessaging.instance].
final class FcmRemoteDataSourceImpl implements FcmRemoteDataSource {
  /// Creates an [FcmRemoteDataSourceImpl].
  FcmRemoteDataSourceImpl({FirebaseMessaging? messaging})
      : _messaging = messaging ?? FirebaseMessaging.instance;

  final FirebaseMessaging _messaging;

  @override
  Future<String?> requestTokenAndPermission() async {
    final NotificationSettings settings =
        await _messaging.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.denied) {
      return null;
    }
    return _messaging.getToken();
  }

  @override
  Stream<String> get onTokenRefresh => _messaging.onTokenRefresh;

  @override
  Stream<RemoteMessage> get onMessage => FirebaseMessaging.onMessage;
}
