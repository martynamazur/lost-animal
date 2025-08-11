import 'dart:developer' as developer;

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/presentation/widget/all_inbox_message.dart';
import 'package:lostanimal/presentation/widget/inbox_message_card.dart';
import 'package:lostanimal/provider/inbox_provider.dart';

@RoutePage()
class InboxScreen extends ConsumerStatefulWidget {
  const InboxScreen({super.key});

  @override
  ConsumerState createState() => _InboxScreenState();
}

class _InboxScreenState extends ConsumerState<InboxScreen> {

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Inbox'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.messenger_outline), text: 'All'),
              Tab(icon: Icon(Icons.email_rounded), text: 'Unread'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AllInboxMessage(),
            Text('widget unread messages'),
          ],
        ),
      ),
    );
  }



}
