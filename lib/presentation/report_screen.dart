
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lostanimal/nawigation/app_router.dart';

@RoutePage()
class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('What do you want to do ?'),
                OutlinedButton(
                    onPressed: () => context.router.push(ReportMissingFormRoute()),
                    child: Text('Add missing')
                ),
                OutlinedButton(
                    onPressed: () => context.router.push(ReportAnimalSightingFormRoute()),
                    child: Text('Report an Animal Sighting')
                )
              ],
            ),
          )
      ),
    );
  }
}
