import 'dart:developer' as developer;

import 'package:auto_route/annotations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/model/chat_model.dart';
import 'package:lostanimal/presentation/widget/message_bubble.dart';
import 'package:lostanimal/presentation/widget/message_input_bar.dart';
import 'package:lostanimal/provider/inbox_provider.dart';
import 'package:lostanimal/provider/chat_notifier.dart';

import '../model/message_model.dart';

@RoutePage()
class ChatScreen extends ConsumerStatefulWidget {
  final String reportId;
  final String authorId;
  final String reportAuthorDisplayName;
  const ChatScreen(this.reportId, this.authorId, this.reportAuthorDisplayName, {super.key});

  @override
  ConsumerState createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final ScrollController _scrollController = ScrollController();


  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    final chatAsync = ref.watch(chatNotifierProvider(
        widget.reportId,
        widget.authorId,
        widget.reportAuthorDisplayName
    ));

    ref.listen(
      chatNotifierProvider(widget.reportId, widget.authorId, widget.reportAuthorDisplayName),(previous, next) {
        next.whenData((chat) async {
          final lastMessageReadBy = chat.lastMessageReadBy;

          if(!chat.lastMessageReadBy.contains(currentUser!.uid)){
            await ref.read(inboxRepositoryProvider).updateReadByChat(chat.id, lastMessageReadBy);
          }

          //TODO: dodac do chat pole  lastMessageid ostatniej wiadomosci wiec gdy beda nowe dane listen wylapie i wykona sie funkcja markAsRead
          });
      },
    );

    return chatAsync.when(
            data: (chat) {
              final chatId = chat.id;
              final messages = ref.watch(getChatMessagesStreamProvider(chatId: chatId));
              final Map<String, String> participantDisplayNames = chat.participantDisplayNames;
              final String currentUserId = FirebaseAuth.instance.currentUser!.uid;
              final otherParticipantName = participantDisplayNames.entries
                  .firstWhere((entry) => entry.key != currentUserId,
                  orElse: () => const MapEntry('unknown', 'Unknown')).value;


              return Scaffold(
                  resizeToAvoidBottomInset: true,
                  appBar: AppBar(
                    title: Text('Chat with ${otherParticipantName}'),
                  ),
                  body: SafeArea(
                    child: Column(
                      children: [
                        Expanded(
                          child: messages.when(
                              data: (messages){
                                WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

                                if(messages.isNotEmpty){
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListView.builder(
                                        controller: _scrollController,
                                        itemCount: messages.length,
                                        itemBuilder: (context, index){
                                          final message = messages[index];
                                          return MessageBubble(
                                            message: message,
                                            currentUserId: currentUser!.uid,
                                            time: message.timestamp,
                                            readBy: message.readBy,
                                          );
                                        }),
                                  );
                                } else {
                                  return Center(child: Text('No messages yet'));
                                }
                              },
                              error: (e,st) => Center(child: Text('Error:, $e')),
                              loading: () => const Center(child: CircularProgressIndicator())
                          ),
                        ),
                        MessageInputBar(chat, _scrollToBottom),
                      ],
                    ),
                  ),

                );
            },
            error: (error, st) => Text('$error, $st'),
            loading: () => const Center(child: CircularProgressIndicator())
    );
  }
}
