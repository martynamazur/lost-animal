import 'package:flutter/material.dart';

class ReportStatusBadge extends StatelessWidget {
  final String type;

  const ReportStatusBadge({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: switch (type.toLowerCase()) {
            'missing' => [
              theme.colorScheme.error,
              theme.colorScheme.error.withValues(alpha: 0.8),
            ],
            'found' => [
              theme.colorScheme.tertiary,
              theme.colorScheme.tertiary.withValues(alpha: 0.8),
            ],
            'seen' => [
              theme.colorScheme.primary,
              theme.colorScheme.primary.withValues(alpha: 0.8),
            ],
            _ => [
              theme.colorScheme.primary,
              theme.colorScheme.primary.withValues(alpha: 0.8),
            ],
          },
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            switch (type.toLowerCase()) {
              'missing' => Icons.search,
              'found' => Icons.check_circle,
              'seen' => Icons.visibility,
              _ => Icons.pets,
            },
            color: Colors.white,
            size: 18,
          ),
          const SizedBox(width: 8),
          Text(
            type.toUpperCase(),
            style: theme.textTheme.labelLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
