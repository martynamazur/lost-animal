import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/router/app_router.dart';
import '../../../shared/models/chat_model.dart';
import '../../reports/provider/report_provider.dart';

class InboxMessageCard extends ConsumerStatefulWidget {
  final ChatModel chat;
  const InboxMessageCard(this.chat, {super.key});

  @override
  ConsumerState createState() => _InboxMessageCardState();
}

class _InboxMessageCardState extends ConsumerState<InboxMessageCard> {
  final String currentUserId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final hasUnread = !widget.chat.lastMessageReadBy.contains(currentUserId);
    final formattedTime = DateFormat.Hm().format(widget.chat.lastMessageAt);
    final formattedDate = DateFormat.MMMd().format(widget.chat.lastMessageAt);

    final Map<String, String> participantDisplayNames =
        widget.chat.participantDisplayNames;
    final otherParticipantName = participantDisplayNames.entries
        .firstWhere(
          (entry) => entry.key != currentUserId,
          orElse: () => const MapEntry('unknown', 'Unknown'),
        )
        .value;

    final otherUserId = widget.chat.participants.firstWhere(
      (id) => id != currentUserId,
    );
    final otherUserName =
        widget.chat.participantDisplayNames[otherUserId] ?? 'Unknown';

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: hasUnread
            ? colorScheme.primaryContainer.withOpacity(0.3)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () {
            context.router.push(
              ChatRoute(
                reportId: widget.chat.reportId,
                authorId: otherUserId,
                reportAuthorDisplayName: otherUserName,
              ),
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: hasUnread
                    ? colorScheme.primary.withOpacity(0.2)
                    : colorScheme.outline.withOpacity(0.1),
                width: hasUnread ? 1.5 : 0.5,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Stack(
                  children: [
                    _cachedPic(widget.chat.reportId),
                    if (hasUnread)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: colorScheme.error,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: colorScheme.surface,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              otherParticipantName,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: hasUnread
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                                color: colorScheme.onSurface,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                formattedTime,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: hasUnread
                                      ? colorScheme.primary
                                      : colorScheme.onSurface.withOpacity(0.6),
                                  fontWeight: hasUnread
                                      ? FontWeight.w500
                                      : FontWeight.normal,
                                ),
                              ),
                              if (_isToday(widget.chat.lastMessageAt))
                                const SizedBox.shrink()
                              else
                                Text(
                                  formattedDate,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurface.withOpacity(
                                      0.5,
                                    ),
                                    fontSize: 10,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.chat.lastMessage,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: hasUnread
                                    ? colorScheme.onSurface
                                    : colorScheme.onSurface.withOpacity(0.7),
                                fontWeight: hasUnread
                                    ? FontWeight.w500
                                    : FontWeight.normal,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          if (hasUnread) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.error,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'NEW',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: colorScheme.onError,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  Widget _cachedPic(String reportId) {
    final colorScheme = Theme.of(context).colorScheme;

    return FutureBuilder<String>(
      future: ref.read(getReportFirstPhotoProvider(reportId: reportId).future),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: colorScheme.primary,
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: colorScheme.errorContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.error_outline,
              color: colorScheme.onErrorContainer,
              size: 24,
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.pets,
              color: colorScheme.onSurface.withOpacity(0.6),
              size: 24,
            ),
          );
        } else {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: snapshot.data!,
              width: 56,
              height: 56,
              placeholder: (context, url) => Container(
                width: 56,
                height: 56,
                color: colorScheme.surfaceContainerHighest,
                child: Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: 56,
                height: 56,
                color: colorScheme.errorContainer,
                child: Icon(
                  Icons.error_outline,
                  color: colorScheme.onErrorContainer,
                  size: 24,
                ),
              ),
              fit: BoxFit.cover,
            ),
          );
        }
      },
    );
  }
}
