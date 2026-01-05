import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../shared/models/message_model.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel message;
  final String currentUserId;
  final DateTime time;
  final List<String> readBy;

  const MessageBubble({
    super.key,
    required this.message,
    required this.currentUserId,
    required this.time,
    required this.readBy,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
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
          color: isMe
              ? colorScheme.primary
              : colorScheme.surfaceContainerHighest,
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
                color: isMe ? colorScheme.onPrimary : colorScheme.onSurface,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  formattedTime,
                  style: TextStyle(
                    color: isMe
                        ? colorScheme.onPrimary.withOpacity(0.7)
                        : colorScheme.onSurface.withOpacity(0.6),
                    fontSize: 10,
                  ),
                ),
                Icon(
                  Icons.check,
                  size: 10,
                  color: isMe
                      ? colorScheme.onPrimary.withOpacity(0.8)
                      : colorScheme.primary,
                ),
                Icon(
                  Icons.check,
                  size: 10,
                  color: isRead
                      ? (isMe ? colorScheme.onPrimary : colorScheme.primary)
                      : (isMe
                            ? colorScheme.onPrimary.withOpacity(0.3)
                            : colorScheme.outline),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
