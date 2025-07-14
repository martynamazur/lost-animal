import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/gender.dart';
import '../../provider/report_missing_notifier.dart';


class GenderDropDown extends ConsumerWidget {
  const GenderDropDown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final  selectedGender = ref.watch(reportMissingNotifierProvider.select((form) => form.gender));

    return Column(
      children: [
        Text('Gender', style: Theme.of(context).textTheme.bodyMedium),
        DropdownButtonFormField<Gender>(
          value: selectedGender,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          ),
          items: Gender.values.map((gender) {
            return DropdownMenuItem<Gender>(
              value: gender,
              child: Text(gender.name),
            );
          }).toList(),
          onChanged: (newGender) {
            if (newGender != null) {
              ref.read(reportMissingNotifierProvider.notifier).updateGender(newGender);
            }
          },
          validator: (value) {
            if (value == null) {
              return 'Please choose gender';
            }
            return null;
          },
        ),
      ],
    );
  }
}
