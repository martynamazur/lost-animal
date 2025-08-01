import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lostanimal/presentation/widget/style/decoration_style.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FormBuilderTextField(
        name: 'email',
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        decoration: customInputDecoration(theme).copyWith(
          label: Text('Email')
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.email()
        ]),
      );
  }
}
