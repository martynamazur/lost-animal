import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/router/app_router.dart';

class QuickReportSheet extends StatelessWidget {
  const QuickReportSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: theme.colorScheme.outline,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          Text('Quick Actions', style: theme.textTheme.titleLarge),
          const SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.pets, color: theme.colorScheme.error),
            title: const Text('Report Missing Pet'),
            onTap: () {
              context.router.pop();
              context.router.push(const ReportMissingFormRoute());
            },
          ),
          ListTile(
            leading: Icon(Icons.visibility, color: theme.colorScheme.primary),
            title: const Text('Report Sighting'),
            onTap: () {
              context.router.pop();
              context.router.push(const ReportSeenRoute());
            },
          ),
        ],
      ),
    );
  }
}
