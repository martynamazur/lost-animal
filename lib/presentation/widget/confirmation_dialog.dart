import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmLabel;
  final String cancelLabel;

  const ConfirmationDialog({
    super.key,
    this.title = 'Potwierdź',
    required this.message,
    this.confirmLabel = 'Tak',
    this.cancelLabel = 'Nie',
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(cancelLabel),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(confirmLabel),
        ),
      ],
    );
  }
}
