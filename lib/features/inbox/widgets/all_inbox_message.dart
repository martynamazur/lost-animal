import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/components/empty_states/empty_states.dart';
import '../provider/inbox_provider.dart';
import 'inbox_message_card.dart';

class AllInboxMessage extends ConsumerWidget {
  const AllInboxMessage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chats = ref.watch(getUserChatsProvider);
    return chats.when(
      data: (chats) {
        developer.log('Number of chats: ${chats.length}', name: 'InboxScreen');
        if (chats.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return InboxMessageCard(chat);
              },
            ),
          );
        } else {
          return MessagesEmptyState(
            onStartChat: () {
              // TODO: Navigate to new chat screen
              developer.log('Start new chat pressed', name: 'InboxScreen');
            },
            onRefresh: () {
              // Refresh the chats list
              ref.invalidate(getUserChatsProvider);
            },
            showStartChatButton: true,
            isLoading: false,
          );
        }
      },
      error: (e, st) => Center(child: Text('Error:, $e')),
      loading: () =>
          MessagesEmptyState(isLoading: true, showStartChatButton: false),
    );
  }
}
