import 'package:flutter/material.dart';

class DetailsOutlinedCard extends StatelessWidget {
  final String text;
  final IconData icon;

  const DetailsOutlinedCard({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card.outlined(
      color: colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: colorScheme.primary, size: 18),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
