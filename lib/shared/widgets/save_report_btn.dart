import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/shared/widgets/mutation_provider.dart';
import 'package:lostanimal/features/reports/forms/report_notifier.dart';
import 'package:riverpod/experimental/mutation.dart';

import '../../core/router/app_router.dart';

class SaveReportBtn extends ConsumerWidget {
  final GlobalKey<FormState> formKey;
  final String formType;
  const SaveReportBtn(this.formKey, this.formType, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saveForm = ref.watch(saveFormMutation);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

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
              backgroundColor: colorScheme.error,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        }
      }
    });

    //Co wyswietlam w roznych stanach
    return switch (saveForm) {
      MutationIdle() => SizedBox(
        width: double.infinity,
        child: FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            elevation: 2,
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
          child: Text(
            'Submit Report',
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      MutationError() => SizedBox(
        width: double.infinity,
        child: FilledButton.tonal(
          style: FilledButton.styleFrom(
            backgroundColor: colorScheme.errorContainer,
            foregroundColor: colorScheme.onErrorContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
          onPressed: () async {
            saveFormMutation.run(ref, (ref) async {
              await ref
                  .get(reportNotifierProvider.notifier)
                  .saveToFirestore(formType);
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.refresh, size: 20),
              const SizedBox(width: 8),
              Text(
                'Retry',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: colorScheme.onErrorContainer,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
      MutationPending() => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              color: colorScheme.primary,
              strokeWidth: 3,
            ),
            const SizedBox(height: 12),
            Text(
              'Submitting report...',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
      MutationSuccess() => const SizedBox.shrink(),
    };
  }
}
