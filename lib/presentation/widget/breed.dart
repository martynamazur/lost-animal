import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/report_notifier.dart';

class Breed extends ConsumerWidget {
  const Breed({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text('Breed'),
        TextFormField(
          decoration: InputDecoration(labelText: 'Breed'),
          onSaved: (value){
            if(value != null && value.trim().isNotEmpty){
              ref.read(reportNotifierProvider.notifier).updateBreed(value);
            }
          },
        )
      ],
    );
  }
}
