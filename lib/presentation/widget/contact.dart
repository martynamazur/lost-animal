import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/presentation/widget/style/decoration_style.dart';
import 'package:lostanimal/utils/validation_helper.dart';

import '../../provider/report_notifier.dart';

class Contact extends ConsumerWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Contact'),
        TextFormField(
          keyboardType: TextInputType.phone,
          onSaved: (value){
            safeCallIfNotEmpty(value, (trimmedValue) =>
                ref.read(reportNotifierProvider.notifier).updatePhoneNumber(trimmedValue)
            );
          },
          decoration: customInputDecoration(theme).copyWith(
            labelText: 'Phone Number',
            hintText: 'Enter your phone number',
          ),

        )
      ],
    );
  }
}
