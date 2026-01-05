import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../shared/components/empty_states/empty_states.dart';
import '../../../shared/components/skeleton_layout/inbox_message_skeleton.dart';
import '../provider/inbox_provider.dart';
import 'inbox_message_card.dart';

class AllInboxMessage extends ConsumerWidget {
  const AllInboxMessage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chats = ref.watch(getUserChatsProvider);
    return chats.when(
      data: (chats) {
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
      loading: () => Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return const InboxMessageSkeleton();
          },
          separatorBuilder: (context, index) => const SizedBox(height: 8),
        ),
      ),
    );
  }
}
