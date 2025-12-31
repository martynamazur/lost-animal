import 'dart:core';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../shared/models/chat_model.dart';
import '../../../shared/models/message_model.dart';
import '../data/inbox_repository.dart';

part 'inbox_provider.g.dart';

@riverpod
InboxRepository inboxRepository(Ref ref) {
  return InboxRepository();
}

@riverpod
Stream<List<ChatModel>> getUserChats(Ref ref) {
  return ref.read(inboxRepositoryProvider).getUserChatsStream();
}

@riverpod
Stream<List<MessageModel>> getChatMessagesStream(
  Ref ref, {
  required String chatId,
}) {
  return ref.read(inboxRepositoryProvider).getChatMessagesStream(chatId);
}
