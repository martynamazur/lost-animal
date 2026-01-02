import 'package:flutter/material.dart';
import 'section_header.dart';

class InfoContainer extends StatelessWidget {
  final IconData icon;
  final String sectionTitle;
  final String content;
  final Color? iconColor;

  const InfoContainer({
    super.key,
    required this.icon,
    required this.sectionTitle,
    required this.content,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: sectionTitle),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: theme.colorScheme.outline.withValues(alpha: 0.5),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: iconColor ?? theme.colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  content,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
