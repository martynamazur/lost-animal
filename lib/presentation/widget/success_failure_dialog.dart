import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuccessFailureDialog extends StatelessWidget {
  final bool success;
  final String title;
  final String message;
  final String buttonText;

  const SuccessFailureDialog({super.key, required this.success, required this.title, required this.message, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        //TODO: Add icon for a better experience
        OutlinedButton(onPressed: () => context.router.pop(success), child: Text(buttonText))
      ],
    );
  }
}
