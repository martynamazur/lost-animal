import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AddedReportsScreen extends ConsumerStatefulWidget {
  const AddedReportsScreen({super.key});

  @override
  ConsumerState createState() => _AddedReportsScreenState();
}

class _AddedReportsScreenState extends ConsumerState<AddedReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                children: [

                ],
              )
          )
      ),
    );
  }
}
