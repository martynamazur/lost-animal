import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/router/app_router.dart';
import 'report_card.dart';
import 'report_quick_action.dart';
import 'report_screen_header.dart';

@RoutePage()
class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const ReportScreenHeader(),

              const SizedBox(height: 40),

              Column(
                children: [
                  ReportCard(
                    title: 'Report Missing Pet',
                    subtitle: 'Lost your furry friend?',
                    description:
                        'Help us spread the word and bring them home safely',
                    icon: Icons.pets_outlined,
                    gradient: LinearGradient(
                      colors: [
                        theme.colorScheme.error,
                        theme.colorScheme.error.withValues(alpha: 0.7),
                      ],
                    ),
                    onTap: () => context.router.push(ReportMissingFormRoute()),
                    delay: const Duration(milliseconds: 100),
                  ),

                  const SizedBox(height: 20),

                  ReportCard(
                    title: 'Report Sighting',
                    subtitle: 'Found a lost pet?',
                    description:
                        'Help reunite pets with their worried families',
                    icon: Icons.visibility_outlined,
                    gradient: LinearGradient(
                      colors: [
                        theme.colorScheme.primary,
                        theme.colorScheme.primary.withValues(alpha: 0.7),
                      ],
                    ),
                    onTap: () => context.router.push(ReportSeenRoute()),
                    delay: const Duration(milliseconds: 200),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Help Section
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: theme.colorScheme.primary,
                      size: 32,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Need Help?',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Every report helps! The more details you provide, the better chance we have of reuniting pets with their families.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showQuickActionSheet(context);
        },
        icon: const Icon(Icons.add),
        label: const Text('Quick Report'),
        backgroundColor: theme.colorScheme.tertiary,
        foregroundColor: theme.colorScheme.onTertiary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _showQuickActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => QuickReportSheet(),
    );
  }
}
