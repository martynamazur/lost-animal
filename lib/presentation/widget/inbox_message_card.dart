import 'dart:developer' as developer;

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lostanimal/model/chat_model.dart';

import '../../nawigation/app_router.dart';
import '../../provider/report_provider.dart';

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

    final hasUnread = widget.chat.lastMessageReadBy.contains(currentUserId);
    developer.log('Has unread messages: $hasUnread', name: 'InboxMessageCard');
    final formattedTime = DateFormat.Hm().format(widget.chat.lastMessageAt);
    final Map<String, String> participantDisplayNames = widget.chat.participantDisplayNames;
    final otherParticipantName = participantDisplayNames.entries
        .firstWhere(
          (entry) => entry.key != currentUserId,
      orElse: () => const MapEntry('unknown', 'Unknown'),
    ).value;

    final otherUserId = widget.chat.participants.firstWhere((id) => id != currentUserId);
    final otherUserName = widget.chat.participantDisplayNames[otherUserId] ?? 'Unknown';


    return InkWell(
      onTap: (){
        context.router.push(
            ChatRoute(
                reportId: widget.chat.reportId,
                authorId: otherUserId,
                reportAuthorDisplayName: otherUserName,
            ));
      },
      child: Card(
          elevation: 0.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              spacing: 12,
              children: [
                _cachedPic(widget.chat.reportId),
                Expanded(
                  child: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(otherParticipantName,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(formattedTime,style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                                '${widget.chat.lastMessage}',
                                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                                 maxLines: 1,
                            ),
                          ),
                          Text(
                            hasUnread ?  '' : ' (unread)' ,
                            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.red),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
  Widget _cachedPic(String reportId) {
    return FutureBuilder<String>(
      future: ref.read(getReportFirstPhotoProvider(reportId: reportId).future),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Icon(Icons.error);
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Icon(Icons.broken_image);
        } else {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: snapshot.data!,
              width: 100,
              height: 100,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          );
        }
      },
    );
  }
}
