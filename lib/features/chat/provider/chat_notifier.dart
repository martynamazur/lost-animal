import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/models/chat_model.dart';

part 'chat_notifier.g.dart';

@riverpod
class ChatNotifier extends _$ChatNotifier {
  final currentUserId = FirebaseAuth.instance.currentUser?.uid;

  @override
  Future<ChatModel> build(
    String reportId,
    String authorId,
    String reportAuthorDisplayName,
  ) async {
    return _getOrCreateChat(reportId, authorId, reportAuthorDisplayName);
  }

  Future<ChatModel> _getOrCreateChat(
    String reportId,
    String authorId,
    String reportAuthorDisplayName,
  ) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final currentUserId = currentUser?.uid ?? '';
    final currentUserDisplayName = currentUser?.displayName ?? 'Unknown User';
    developer.log(
      'UNSorted participants: ${[currentUserId, authorId]}',
      name: 'ChatNotifier',
    );
    final participants = [currentUserId, authorId]..sort();
    developer.log('Sorted participants: $participants', name: 'ChatNotifier');

    final participantsKey = participants.join('_');

    developer.log('Participants Key: $participantsKey', name: 'ChatNotifier');
    developer.log('Report ID: $reportId', name: 'ChatNotifier');

    final query = FirebaseFirestore.instance
        .collection('chats')
        .where('reportId', isEqualTo: reportId)
        .where('participantsKey', isEqualTo: participantsKey)
        .limit(1);

    final querySnapshot = await query.get();
    final chatExists = querySnapshot.docs.isNotEmpty;

    if (chatExists) {
      final doc = querySnapshot.docs.first;
      return ChatModel.fromFirestore(doc).copyWith(id: doc.id);
    } else {
      final docRef = FirebaseFirestore.instance.collection('chats').doc();
      final newChatId = docRef.id;

      return ChatModel(
        id: newChatId,
        reportId: reportId,
        lastMessage: "",
        participants: participants,
        participantsKey: participantsKey,
        lastMessageAt: DateTime.now(),
        createdAt: DateTime.now(),
        reportAuthorDisplayName: reportAuthorDisplayName,
        lastMessageReadBy: [],
        participantDisplayNames: {
          currentUserId: currentUserDisplayName,
          authorId: reportAuthorDisplayName,
        },
        reportAuthorId: authorId,
      );
    }
  }
}
