import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/shared/widgets/save_report_btn.dart';
import 'package:lostanimal/features/gallery/widgets/build_image_gallery.dart';
import 'package:lostanimal/shared/widgets/contact.dart';
import 'package:lostanimal/shared/widgets/exit_confirmation_dialog.dart';
import 'package:lostanimal/features/reports/forms/report_notifier.dart';

import 'package:lostanimal/shared/utils/validation_helper.dart';

import '../../../shared/widgets/category.dart';
import '../../../shared/widgets/description.dart';
import '../../../shared/widgets/location_picker.dart';
import '../../../shared/widgets/section_card.dart';

@RoutePage()
class ReportSeenScreen extends ConsumerStatefulWidget {
  const ReportSeenScreen({super.key});

  @override
  ConsumerState createState() => _ReportSeenScreenState();
}

class _ReportSeenScreenState extends ConsumerState<ReportSeenScreen> {
  final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldExit = await _showExitConfirmationDialog(context);
        if (shouldExit) {
          context.router.pop();
        }
      },
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(
            'Report Sighting',
            style: theme.textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: colorScheme.surface,
          elevation: 0,
          scrolledUnderElevation: 1,
          surfaceTintColor: colorScheme.surfaceTint,
          iconTheme: IconThemeData(color: colorScheme.onSurface),
        ),
        body: SafeArea(
          child: Form(
            key: keyForm,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    colorScheme.surface,
                    colorScheme.surfaceContainerLowest,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20,
                    children: [
                      const SizedBox(height: 8),
                      SectionCard(child: LocationPicker()),
                      SectionCard(child: BuildImageGallery()),
                      SectionCard(child: Category()),
                      SectionCard(
                        child: Description((value) {
                          safeCallIfNotEmpty(value, (value) {
                            ref
                                .read(reportNotifierProvider.notifier)
                                .updateAdditionalInfo(value);
                          });
                        }, 'Description'),
                      ),
                      SectionCard(child: Contact()),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadow.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SaveReportBtn(keyForm, 'seen'),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (ctx) => const ExitConfirmationDialog(),
        ) ??
        false;
  }
}
