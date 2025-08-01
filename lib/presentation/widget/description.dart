import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/presentation/widget/style/decoration_style.dart';

class Description extends ConsumerWidget {
  final void Function(String value) onSaved;
  final String headline;
  const Description(this.onSaved, this.headline, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          maxLines: 3,
          decoration: InputDecoration(
            labelText: headline,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surfaceVariant,
          ),
          onSaved: (value){
            if(value != null && value.trim().isNotEmpty){
              onSaved(value.trim());
            }
          },
        )
      ],
    );;
  }
}
