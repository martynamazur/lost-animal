import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lostanimal/shared/models/gender.dart';
import 'package:lostanimal/features/reports/forms/report_notifier.dart';

class GenderDropDown extends ConsumerWidget {
  const GenderDropDown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGender = ref.watch(
      reportNotifierProvider.select((form) => form.gender),
    );

    return Column(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gender', style: Theme.of(context).textTheme.labelLarge),
        DropdownButtonFormField<Gender>(
          value: selectedGender,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          ),
          items: Gender.values.map((gender) {
            return DropdownMenuItem<Gender>(
              value: gender,
              child: Row(
                spacing: 8.0,
                children: [
                  Icon(gender == Gender.male ? Icons.male : Icons.female),
                  Text(gender.name),
                ],
              ),
            );
          }).toList(),
          onChanged: (newGender) {
            if (newGender != null) {
              ref.read(reportNotifierProvider.notifier).updateGender(newGender);
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
