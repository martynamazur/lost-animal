import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class UserRepository {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> saveTokenFCM(String token) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        print('No authenticated user, skipping token save');
        return;
      }

      final userData = {
        'fcmToken': token,
        'userId': user.uid,
        'lastTokenUpdate': FieldValue.serverTimestamp(),
        'email': user.email,
        'displayName': user.displayName ?? 'Unknown User',
        'isAnonymous': user.isAnonymous,
        'lastSeen': FieldValue.serverTimestamp(),
      };

      await _firestore
          .collection('users')
          .doc(user.uid)
          .set(userData, SetOptions(merge: true));
    } catch (e) {
      print('Error saving FCM token to database: $e');
    }
  }

  Future<void> removeTokens() async {
    try {
      final user = _auth.currentUser;
      if (user == null) return;

      await _firestore.collection('users').doc(user.uid).update({
        'fcmToken': FieldValue.delete(),
        'lastTokenUpdate': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error removing FCM token: $e');
    }
  }

  Future<void> removeToken() async {
    await removeTokens();
  }

  Future<void> createOrUpdateUserProfile({
    String? displayName,
    String? email,
    Map<String, dynamic>? additionalData,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return;
      }

      final userData = {
        'userId': user.uid,
        'email': user.email ?? email,
        'displayName': user.displayName ?? displayName ?? 'Unknown User',
        'isAnonymous': user.isAnonymous,
        'createdAt': FieldValue.serverTimestamp(),
        'lastSeen': FieldValue.serverTimestamp(),
        'isActive': true,
        ...?additionalData,
      };

      await _firestore
          .collection('users')
          .doc(user.uid)
          .set(userData, SetOptions(merge: true));
    } catch (e) {
      print('Error creating/updating user profile: $e');
    }
  }

  Future<void> updateLastSeen() async {
    try {
      final user = _auth.currentUser;
      if (user == null) return;

      await _firestore.collection('users').doc(user.uid).update({
        'lastSeen': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error updating last seen: $e');
    }
  }

  Future<Map<String, dynamic>?> getUserProfile(String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();

      if (doc.exists) {
        return doc.data();
      }
      return null;
    } catch (e) {
      print('Error getting user profile: $e');
      return null;
    }
  }
}
