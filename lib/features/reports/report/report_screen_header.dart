import 'package:flutter/material.dart';

import '../../../shared/widgets/stat_item.dart';

class ReportScreenHeader extends StatelessWidget {
  const ReportScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.primaryContainer,
                theme.colorScheme.secondaryContainer,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.primary.withOpacity(0.3),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Icon(
            Icons.pets,
            size: 60,
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),

        const SizedBox(height: 24),

        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
          ).createShader(bounds),
          child: Text(
            'Help Our Furry Friends',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        const SizedBox(height: 12),

        Text(
          'Every pet deserves to find their way home.\nWhat would you like to report today?',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StatItem(
              number: '1,234',
              label: 'Pets Found',
              icon: Icons.favorite,
              color: theme.colorScheme.error,
            ),
            Container(width: 1, height: 40, color: theme.colorScheme.outline),
            StatItem(
              number: '567',
              label: 'Active Reports',
              icon: Icons.search,
              color: theme.colorScheme.primary,
            ),
          ],
        ),
      ],
    );
  }
}
