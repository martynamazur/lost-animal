import 'package:flutter/material.dart';
import 'bottom_contact_bar.dart';

class ContactBarContainer extends StatelessWidget {
  final String reportId;
  final String authorId;
  final String displayNameAuthor;
  final bool isEnabled;

  const ContactBarContainer({
    super.key,
    required this.reportId,
    required this.authorId,
    required this.displayNameAuthor,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Opacity(
        opacity: isEnabled ? 1.0 : 0.6,
        child: AbsorbPointer(
          absorbing: !isEnabled,
          child: BottomContactBar(reportId, authorId, displayNameAuthor),
        ),
      ),
    );
  }
}
