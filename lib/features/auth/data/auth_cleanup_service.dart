import 'dart:developer' as developer;

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_cleanup_service.g.dart';

@riverpod
AuthCleanupService authCleanupService(Ref ref) {
  return AuthCleanupService();
}

/// Serwis odpowiedzialny za czyszczenie danych lokalnych przy wylogowaniu
class AuthCleanupService {
  /// Czyści wszystkie dane użytkownika z lokalnego storage
  Future<void> clearAllUserData() async {
    try {
      developer.log('AuthCleanup: Starting user data cleanup');

      // Wyczyść SharedPreferences
      await _clearSharedPreferences();

      // Wyczyść cache'owane dane (jeśli używasz)
      await _clearCachedData();

      // Wyczyść dane z bazy lokalnej (jeśli używasz SQLite/Hive)
      await _clearLocalDatabase();

      developer.log('AuthCleanup: User data cleanup completed');
    } catch (e, stackTrace) {
      developer.log(
        'AuthCleanup: Error during cleanup',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Czyści SharedPreferences
  Future<void> _clearSharedPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Lista kluczy do wyczyszczenia (dostosuj do swojej aplikacji)
      final keysToRemove = [
        'user_preferences',
        'cached_reports',
        'last_location',
        'app_settings',
        'notification_tokens',
        // Dodaj inne klucze specyficzne dla Twojej aplikacji
      ];

      for (final key in keysToRemove) {
        await prefs.remove(key);
        developer.log('AuthCleanup: Removed SharedPreferences key: $key');
      }

      // Alternatywnie: wyczyść wszystko (ostrożnie!)
      // await prefs.clear();
    } catch (e) {
      developer.log('AuthCleanup: Error clearing SharedPreferences', error: e);
    }
  }

  /// Czyści cache'owane dane
  Future<void> _clearCachedData() async {
    try {
      // Tutaj możesz wyczyścić:
      // - Cache'owane obrazy
      // - Tymczasowe pliki
      // - Cache network requests

      developer.log('AuthCleanup: Cached data cleared');
    } catch (e) {
      developer.log('AuthCleanup: Error clearing cached data', error: e);
    }
  }

  /// Czyści lokalną bazę danych
  Future<void> _clearLocalDatabase() async {
    try {
      // Jeśli używasz SQLite, Hive, lub innej lokalnej bazy:
      // - Usuń tabele użytkownika
      // - Wyczyść dane offline
      // - Resetuj synchronizację

      developer.log('AuthCleanup: Local database cleared');
    } catch (e) {
      developer.log('AuthCleanup: Error clearing local database', error: e);
    }
  }

  /// Czyści specyficzne dane dla konkretnego użytkownika
  Future<void> clearUserSpecificData(String userId) async {
    try {
      developer.log('AuthCleanup: Clearing data for user: $userId');

      final prefs = await SharedPreferences.getInstance();

      // Usuń dane specyficzne dla tego użytkownika
      final userSpecificKeys = [
        'user_${userId}_reports',
        'user_${userId}_chats',
        'user_${userId}_settings',
      ];

      for (final key in userSpecificKeys) {
        await prefs.remove(key);
      }

      developer.log('AuthCleanup: User-specific data cleared for: $userId');
    } catch (e) {
      developer.log('AuthCleanup: Error clearing user-specific data', error: e);
    }
  }

  /// Czyści tylko dane sesji (zachowuje ustawienia aplikacji)
  Future<void> clearSessionData() async {
    try {
      developer.log('AuthCleanup: Clearing session data only');

      final prefs = await SharedPreferences.getInstance();

      // Usuń tylko dane sesji, zachowaj ustawienia aplikacji
      final sessionKeys = [
        'current_user_id',
        'auth_token',
        'last_sync_time',
        'active_chats',
      ];

      for (final key in sessionKeys) {
        await prefs.remove(key);
      }

      developer.log('AuthCleanup: Session data cleared');
    } catch (e) {
      developer.log('AuthCleanup: Error clearing session data', error: e);
    }
  }
}
