import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogConfirmation extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  const DialogConfirmation({super.key, required this.title, required this.message, required this.icon});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 12,
        children: [
          Icon(icon, color: Colors.grey, size: 48),
          Text(title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 20) ?? TextStyle(fontSize: 20)),
        ],
      ),
      content: Text(
        message,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: FilledButton(
              onPressed: () => context.router.pop(),
              child: Text('OK')
          ),
        )
      ],
    );
  }
}
