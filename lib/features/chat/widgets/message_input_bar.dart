import 'dart:developer' as developer;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/models/chat_model.dart';
import '../../../shared/models/message_model.dart';
import '../../inbox/provider/inbox_provider.dart';

class MessageInputBar extends ConsumerStatefulWidget {
  final ChatModel chat;
  final void Function() scrollToBottom;
  const MessageInputBar(this.chat, this.scrollToBottom, {super.key});

  @override
  ConsumerState createState() => _MessageInputBarState();
}

class _MessageInputBarState extends ConsumerState<MessageInputBar> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Write a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceContainerLowest,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () async {
              if (_textEditingController.text.isNotEmpty) {
                final message = MessageModel(
                  text: _textEditingController.text,
                  senderId: FirebaseAuth.instance.currentUser!.uid,
                  timestamp: DateTime.now(),
                  id: '',
                  readBy: [],
                );

                developer.log(
                  'Sending message: ${message.text}, ${message.senderId}',
                  name: 'ChatScreen',
                );

                await ref
                    .read(inboxRepositoryProvider)
                    .sendMessage(
                      widget.chat,
                      widget.chat.id,
                      message,
                      participants: widget.chat.participants,
                    );

                _textEditingController.clear();
                widget.scrollToBottom();
              }
            },
          ),
        ],
      ),
    );
  }
}
