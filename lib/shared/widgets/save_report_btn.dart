import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/shared/widgets/mutation_provider.dart';
import 'package:lostanimal/features/reports/provider/report_notifier.dart';
import 'package:riverpod/experimental/mutation.dart';

import '../../core/router/app_router.dart';

class SaveReportBtn extends ConsumerWidget {
  final GlobalKey<FormState> formKey;
  final String formType;
  const SaveReportBtn(this.formKey, this.formType, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saveForm = ref.watch(saveFormMutation);
    final theme = Theme.of(context).colorScheme;

    //Obserwuje stan mutacji i nawiguje/wyswietlac snacbara
    ref.listen(saveFormMutation, (previous, next) {
      if (next case MutationSuccess()) {
        if (context.mounted) {
          context.router.replace(AddedReportsRoute());
        }
      } else if (next case MutationError(:final error)) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.toString()),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    });

    //Co wyswietlam w roznych stanach
    return switch (saveForm) {
      MutationIdle() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.onSurface,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              formKey.currentState?.save();
              saveFormMutation.run(ref, (ref) async {
                await ref
                    .get(reportNotifierProvider.notifier)
                    .saveToFirestore(formType);
              });
            }
          },
          child: const Text('Submit'),
        ),
      ),
      MutationError() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        onPressed: () async {
          saveFormMutation.run(ref, (ref) async {
            await ref
                .get(reportNotifierProvider.notifier)
                .saveToFirestore(formType);
          });
        },
        child: const Text('Retry'),
      ),
      MutationPending() => Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircularProgressIndicator(),
        ),
      ),
      MutationSuccess() => SizedBox.shrink(),
    };
  }
}
