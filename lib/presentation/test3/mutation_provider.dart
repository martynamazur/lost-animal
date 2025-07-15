import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:lostanimal/model/result_model.dart';

import '../../provider/report_missing_notifier.dart';

//final saveFormMutation = Mutation<void>();


final saveFormMutation = Mutation(label: (ref) async {
  final notifier = ref.get(reportMissingNotifierProvider.notifier);
  await notifier.saveToFirestore();
});



