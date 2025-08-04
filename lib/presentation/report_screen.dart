import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lostanimal/nawigation/app_router.dart';

@RoutePage()
class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 16.0,
                    children: [
                      Text(
                        'What do you want to do?',
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),


                      Row(
                        children: [
                          //TODO: create a widget for the card
                          Expanded(
                            child: SizedBox(
                              height: 200,
                              child: GestureDetector(
                                onTap: () => context.router.push(ReportMissingFormRoute()),
                                child: Card(
                                  child: Column(
                                    spacing: 8.0,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          'Report Missing',
                                          style: TextStyle(color: Theme.of(context).colorScheme.primary)
                                      ),
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundColor: Colors.deepPurple[50],
                                        child: Icon(
                                            Icons.search_rounded,
                                            size: 64,
                                            color: Theme.of(context).colorScheme.primary
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 200,
                              child: GestureDetector(
                                onTap: () => context.router.push(ReportSeenRoute()),
                                child: Card(
                                  child: Column(
                                    spacing: 8.0,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          'Report Sighting',
                                          style: TextStyle(
                                              color: Theme.of(context).colorScheme.primary
                                          )
                                      ),
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundColor: Colors.deepPurple[50],
                                        child: Icon(
                                            Icons.remove_red_eye_outlined,
                                            size: 64,
                                            color: Theme.of(context).colorScheme.primary
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}