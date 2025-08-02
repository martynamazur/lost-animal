import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lostanimal/presentation/widget/style/decoration_style.dart';

class EmailField extends StatelessWidget {
  final bool? enabled;
  final String label;
  const EmailField({super.key, required this.label, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FormBuilderTextField(
        name: 'email',
        enabled: enabled ?? true,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        decoration: customInputDecoration(theme).copyWith(
          label: Text(label),
        ),
        validator: enabled == true ? FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.email()
        ]) : null,
      );
  }
}
