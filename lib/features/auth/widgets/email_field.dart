import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EmailField extends StatelessWidget {
  final bool? enabled;
  final String label;
  final IconData? icon;
  const EmailField({
    super.key,
    required this.label,
    this.enabled = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FormBuilderTextField(
      name: 'email',
      enabled: enabled ?? true,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        label: Text(label),
        prefixIcon: icon != null
            ? Icon(
                icon,
                color: enabled == true
                    ? theme.colorScheme.primary
                    : Colors.grey[400],
              )
            : null,
      ),
      validator: enabled == true
          ? FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ])
          : null,
    );
  }
}
