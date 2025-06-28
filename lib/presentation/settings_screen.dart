import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/presentation/change_email_screen.dart';
import 'package:lostanimal/provider/user_provider.dart';

import '../model/result_model.dart';
import '../nawigation/app_router.dart';

@RoutePage()
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              OutlinedButton(
                  onPressed: () => context.pushRoute(ChangeEmailRoute()),
                  child: Text('Change email address')
              ),
              OutlinedButton(
                  onPressed: () async{
                    final messenger = ScaffoldMessenger.of(context);
                    final Result result = await ref.read(signOutProvider.future);
                    if(result.success){
                      context.router.replaceAll([LoginRoute()]);
                    }else{
                      messenger.showSnackBar(SnackBar(content: Text(result.errorMessage ?? 'Ups something went wrong. Try again')));
                    }
                  },
                  child: Text('Sign out')
              )
            ],
          )
      ),
    );
  }
}