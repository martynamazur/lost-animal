import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lostanimal/features/reports/provider/report_notifier.dart';

class Breed extends ConsumerWidget {
  const Breed({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Breed', style: Theme.of(context).textTheme.labelLarge),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Enter breed',
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          onSaved: (value) {
            if (value != null && value.trim().isNotEmpty) {
              ref.read(reportNotifierProvider.notifier).updateBreed(value);
            }
          },
          enabled: true,
        ),
      ],
    );
  }
}
