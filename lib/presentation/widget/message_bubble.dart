import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/message_model.dart';


class MessageBubble extends StatelessWidget {
  final MessageModel message;
  final String currentUserId;
  final DateTime time;
  final List<String> readBy;

  const MessageBubble({
    super.key,
    required this.message,
    required this.currentUserId, required this.time, required this.readBy,
  });

  @override
  Widget build(BuildContext context) {
    final formattedTime = DateFormat.Hm().format(time);

    final isMe = message.senderId == currentUserId;
    final isRead = readBy.length > 2;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: isMe ? Theme.of(context).primaryColor : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: Radius.circular(isMe ? 12 : 0),
            bottomRight: Radius.circular(isMe ? 0 : 12),
          ),
        ),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message.text,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black87,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(formattedTime,
                  style: TextStyle(
                    color: isMe ? Colors.white70 : Colors.black54,
                    fontSize: 10,
                  ),
                ),
                Icon(Icons.check, size: 10, color: isMe ? Colors.blue : Colors.white),
                Icon(Icons.check, size: 10, color: isRead ? Colors.blue : Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
