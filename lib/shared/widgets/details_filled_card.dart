import 'package:flutter/material.dart';

class DetailsFilledCard extends StatelessWidget {
  final String text;
  final String? subText;
  final IconData icon;
  final String? type;

  const DetailsFilledCard({
    super.key,
    required this.icon,
    required this.text,
    this.subText,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Określenie kolorów na podstawie typu
    Color? cardColor;
    Color? contentColor;

    switch (type) {
      case 'seen':
        cardColor = colorScheme.primary;
        contentColor = colorScheme.onPrimary;
        break;
      case 'found':
        cardColor = colorScheme.tertiary;
        contentColor = colorScheme.onTertiary;
        break;
      case 'missing':
        cardColor = colorScheme.error;
        contentColor = colorScheme.onError;
        break;
      default:
        cardColor = colorScheme.surfaceContainerHighest;
        contentColor = colorScheme.onSurface;
    }

    return Card(
      elevation: 0.5,
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Icon(icon, color: contentColor, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: contentColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
