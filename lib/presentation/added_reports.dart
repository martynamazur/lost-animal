import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/presentation/report_list.dart';
import 'package:lostanimal/provider/user_seen_reports_notifier.dart';

import '../provider/user_missing_reports_notifier.dart';

@RoutePage()
class AddedReportsScreen extends ConsumerStatefulWidget {
  const AddedReportsScreen({super.key});

  @override
  ConsumerState createState() => _AddedReportsScreenState();
}

class _AddedReportsScreenState extends ConsumerState<AddedReportsScreen> {
  @override
  Widget build(BuildContext context) {
    final reportsMissingNotifier = ref.watch(userMissingReportsNotifierProvider);
    final reportsSeenNotifier = ref.watch(userSeenReportsNotifierProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Reports'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Seen reports'),
              Tab(icon: Icon(Icons.search), text: 'Missing reports'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ReportList(reportsSeenNotifier),
            ReportList(reportsMissingNotifier)
          ],
        ),
      ),
    );
  }
}
