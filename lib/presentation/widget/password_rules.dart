import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/provider/password_input_provider.dart';

class PasswordRules extends ConsumerWidget {
  const PasswordRules({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final password = ref.watch(passwordInputNotifierProvider);

    final rules = {
      'Min. 8 characters': password.length >= 8,
      'At least 1 uppercase letter': RegExp(r'[A-Z]').hasMatch(password),
      'At least 1 digit': RegExp(r'\d').hasMatch(password),
      'At least 1 special character': RegExp(r'[!@#\$&*~]').hasMatch(password),
    };


    return Material(
      elevation: 0.5,
      borderRadius: BorderRadius.circular(12),
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Password should contain :', style: TextStyle(fontWeight: FontWeight.bold)),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 8,
              crossAxisSpacing: 16,
              childAspectRatio: 4,
              children: rules.entries.map((entry) {
                return Row(
                  children: [
                    Icon(
                      entry.value ? Icons.check_circle : Icons.cancel,
                      size: 18,
                      color: entry.value ? Colors.green : Colors.red,
                    ),
                    SizedBox(width: 8),
                    Flexible(child: Text(entry.key)),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
