import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DividerWithLabel extends StatelessWidget {
  final String label;
  const DividerWithLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: Divider(
            height: 1,
            indent: 16,
            endIndent: 8,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(label),
        ),
        Expanded(
          child: Divider(
            height: 1,
            indent: 8,
            endIndent: 16,
            thickness: 1,
          ),
        ),
      ],
    );

  }
}
