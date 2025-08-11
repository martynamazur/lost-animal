import 'dart:async';
import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lostanimal/model/chat_model.dart';
import 'package:lostanimal/model/message_model.dart';

class InboxRepository {
  final _collection = FirebaseFirestore.instance.collection('chats');
  late final String _userId;

  InboxRepository() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _userId = user.uid;
    } else {
      throw Exception('User not logged in');
    }
  }

  Stream<List<ChatModel>> getUserChatsStream() {
    return _collection
        .where('participants', arrayContains: _userId)
        .orderBy('lastMessageAt', descending: true)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => ChatModel.fromJson(doc.data())).toList()
    );
  }
  
  Stream<List<MessageModel>> getChatMessagesStream(String chatId) {
    return _collection
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => MessageModel.fromJson(doc.data())).toList());
  }



  Future<void> updateReadByChat(String chatId, List<String> lastMessageReadBy) async {
    try {
      final docRef = FirebaseFirestore.instance.collection('chats').doc(chatId);

      if (!lastMessageReadBy.contains(_userId)) {
        await docRef.update({
          'lastMessageReadBy': FieldValue.arrayUnion([_userId])
        });
      }
    } catch (e) {
      developer.log('Error updating read by chat: $e', name: 'ChatNotifier');
      rethrow;
    }
  }

  Future<void> sendMessage(ChatModel chat,String chatId, MessageModel message, {required List<String> participants}) async {
    try {
      final chatDocRef = _collection.doc(chat.id);
      final chatSnapshot = await chatDocRef.get();


      if (!chatSnapshot.exists) {
        await chatDocRef.set(chat.toJson());
      } else {
        await chatDocRef.update({
          'lastMessage': message.text,
          'lastMessageAt': FieldValue.serverTimestamp(),
          'lastMessageReadBy':[_userId]
        });
      }

      final docRef = chatDocRef.collection('messages').doc();

      final messageWithId = message.copyWith(id: docRef.id, readBy: [_userId]);
      await docRef.set(messageWithId.toJson());

    } catch (e) {
      developer.log('Error sending message: $e', name: 'InboxRepository');
      rethrow;
    }
  }

  Future<void> markMessageRead({
    required String chatId,
    required String messageId,
    required String userId,
  }) async {
    final messageRef = _collection
        .doc(chatId)
        .collection('messages')
        .doc(messageId);

    await messageRef.update({
      'readBy': FieldValue.arrayUnion([userId]),
    });
  }


  //TODO: remove
  Future<String> createChat(ChatModel chat) async {
    try {
      final docRef = _collection.doc();
      final chatWithId = chat.copyWith(id: docRef.id);
      await docRef.set(chatWithId.toJson());
      return docRef.id;
    } catch (e) {
      developer.log('Error creating chat: $e', name: 'InboxRepository');
      rethrow;
    }
  }
}