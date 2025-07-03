import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Contact extends ConsumerWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text('Contact'),
        TextFormField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(labelText: 'Phone number'),
        )
      ],
    );
  }
}
