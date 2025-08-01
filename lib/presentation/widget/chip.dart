import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/report_notifier.dart';

class ChipSwitch extends ConsumerWidget {
  const ChipSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final switchValue = ref.watch(reportNotifierProvider.select((form) => form.hasChip));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Text('Has it been microchipped?', style: Theme.of(context).textTheme.bodyMedium),
        SwitchListTile(
            value: switchValue ?? false,
            onChanged: (value){
              ref.read(reportNotifierProvider.notifier).updateHasChip(value);
            },
            title: Text(
              'Has it been microchipped?',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          tileColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        )
      ],
    );
  }
}
