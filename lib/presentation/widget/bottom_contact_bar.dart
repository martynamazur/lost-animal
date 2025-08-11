import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/nawigation/app_router.dart';
import '../../model/chat_model.dart';
import '../../provider/inbox_provider.dart';


class BottomContactBar extends ConsumerWidget {
  final String reportId;
  final String authorId;
  final String displayNameAuthor;

  BottomContactBar(this.reportId, this.authorId, this.displayNameAuthor, {super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedButton.icon(
            onPressed: () {
              // TODO: Call action
            },
            icon: const Icon(Icons.phone),
            label: const Text('Call'),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: FilledButton.icon(
              onPressed: () async {
                context.router.push(
                    ChatRoute(
                        reportId: reportId,
                        authorId: authorId,
                        reportAuthorDisplayName: displayNameAuthor,
                    ));
              },
              icon: const Icon(Icons.messenger_outline),
              label: const Text('Send message'),
            ),
          ),
        ],
      ),
    );
  }
}
