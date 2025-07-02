import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ReportAnimalSightingFormScreen extends ConsumerStatefulWidget {
  const ReportAnimalSightingFormScreen({super.key});

  @override
  ConsumerState createState() => _ReportAnimalSightingFormScreenState();
}

class _ReportAnimalSightingFormScreenState extends ConsumerState<ReportAnimalSightingFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
