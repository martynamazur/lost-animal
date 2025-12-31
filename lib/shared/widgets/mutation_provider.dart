import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:lostanimal/shared/models/result_model.dart';

import 'package:lostanimal/features/reports/provider/report_notifier.dart';

//final saveFormMutation = Mutation<void>();

final saveFormMutation = Mutation(
  label: (ref) async {
    final notifier = ref.get(reportNotifierProvider.notifier);
    await notifier.saveToFirestore();
  },
);
