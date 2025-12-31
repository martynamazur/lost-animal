import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset('assets/appIcon.png', width: 120, height: 120),
        ),
        Text('Lost Animal', style: Theme.of(context).textTheme.headlineMedium),
        Text('Sign in and get started'),
      ],
    );
  }
}
