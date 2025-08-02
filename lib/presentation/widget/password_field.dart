import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lostanimal/presentation/widget/style/decoration_style.dart';

class PasswordField extends StatefulWidget {
  final ValueChanged<String?>? onChanged;
  final String label;
  final String name;
  const PasswordField({super.key, this.onChanged, this.label = 'Password', this.name = 'password'});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FormBuilderTextField(
      name: widget.name,
      obscureText: _obscureText,
      decoration: customInputDecoration(theme).copyWith(
          labelText: widget.label,
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility
              )
          )
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.minLength(6),
      ]),
      onChanged: widget.onChanged
    );
  }
}
