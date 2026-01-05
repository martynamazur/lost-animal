import 'package:firebase_messaging/firebase_messaging.dart';
import '../user/data/user_repository.dart';

class FCMTokenService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final UserRepository _userRepository = UserRepository();

  static Future<void> initialize() async {
    await _saveCurrentToken();

    _messaging.onTokenRefresh.listen((newToken) {
      _userRepository.saveTokenFCM(newToken);
    });
  }

  static Future<void> _saveCurrentToken() async {
    try {
      final token = await _messaging.getToken();
      if (token != null) {
        await _userRepository.saveTokenFCM(token);
      }
    } catch (e) {
      print('Error getting FCM token: $e');
    }
  }

  static Future<void> removeTokens() async {
    try {
      await _userRepository.removeTokens();
    } catch (e) {
      print('Error removing FCM token: $e');
    }
  }

  static Future<String?> getCurrentToken() async {
    try {
      return await _messaging.getToken();
    } catch (e) {
      print('Error getting current FCM token: $e');
      return null;
    }
  }
}
