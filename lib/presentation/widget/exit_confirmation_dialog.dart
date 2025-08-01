import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExitConfirmationDialog extends StatelessWidget {
  const ExitConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Cancel Report?',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      content: Text(
        'Are you sure you want to cancel? Any unsaved changes will be lost.',
        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              onPressed: () => context.router.pop(false),
              child: Text('No, Continue'),
            ),
            FilledButton(
              onPressed: () => context.router.pop(true),
              child: Text('Yes, Cancel'),
            ),
          ],
        )
      ],
    );
  }
}
