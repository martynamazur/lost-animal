import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lostanimal/model/animal_category.dart';

class DetailsOutlinedCard extends StatelessWidget {
  final String text;
  final IconData icon;
  const DetailsOutlinedCard({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 4,
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.secondary, size: 18,),
            Expanded(child: Text(text)),
          ],
        ),
      ),
    );
  }
}
