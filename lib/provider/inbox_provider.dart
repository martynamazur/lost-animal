import 'dart:async';
import 'dart:core';

import 'package:lostanimal/repository/inbox_repository.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/chat_model.dart';
import '../model/message_model.dart';
import 'inbox_provider.dart';

part 'inbox_provider.g.dart';

@riverpod
InboxRepository inboxRepository(Ref ref) {
  return InboxRepository();
}


@riverpod
Stream<List<ChatModel>> getUserChats(Ref ref){
  return ref.read(inboxRepositoryProvider).getUserChatsStream();
}

@riverpod
Stream<List<MessageModel>> getChatMessagesStream(Ref ref, {required String chatId}) {
  return ref.read(inboxRepositoryProvider).getChatMessagesStream(chatId);
}