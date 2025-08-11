import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InboxMessageTile extends ConsumerWidget {
  final String senderName;
  final String messagePreview;
  final DateTime timestamp;
  final bool isUnread;

  const InboxMessageTile({
    super.key,
    required this.senderName,
    required this.messagePreview,
    required this.timestamp,
    required this.isUnread,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Card(
      elevation: isUnread ? 2 : 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: isUnread
          ? theme.colorScheme.surfaceContainerHighest
          : theme.colorScheme.surface,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.primaryContainer,
          child: Icon(Icons.person, color: theme.colorScheme.onPrimaryContainer),
        ),
        title: Text(
          senderName,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        subtitle: Text(
          messagePreview,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyMedium,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formatTime(timestamp),
              style: theme.textTheme.labelSmall,
            ),
            if (isUnread)
              const SizedBox(height: 4),
            if (isUnread)
              const Badge(
                backgroundColor: Colors.red,
                label: Text('!'),
              ),
          ],
        ),
        onTap: () {

        },
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    if (now.difference(time).inDays == 0) {
      return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
    } else {
      return '${time.day}/${time.month}';
    }
  }
}
