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
      children: [
        Text('Has it been microchipped?', style: Theme.of(context).textTheme.bodyMedium),
        Switch(
            value: switchValue!,
            onChanged: (value){
              ref.read(reportNotifierProvider.notifier).updateHasChip(value);
            }
        )
      ],
    );
  }
}
