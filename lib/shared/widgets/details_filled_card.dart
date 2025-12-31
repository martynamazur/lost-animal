import 'package:flutter/cupertino.dart';
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
    return Card(
      elevation: 0.5,
      color: switch (type) {
        null => null,
        'seen' => Theme.of(context).colorScheme.primary,
        'found' => Colors.lightGreen,
        'missing' => Theme.of(context).colorScheme.error,
        _ => Theme.of(context).colorScheme.primary,
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          spacing: 4,
          children: [
            Icon(icon, color: type != null ? Colors.white : Colors.black),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: type != null ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
