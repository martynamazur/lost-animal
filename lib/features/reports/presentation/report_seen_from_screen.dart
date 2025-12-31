import 'dart:developer' as developer;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/shared/widgets/mutation_provider.dart';
import 'package:lostanimal/shared/widgets/save_report_btn.dart';
import 'package:lostanimal/features/gallery/widgets/build_image_gallery.dart';
import 'package:lostanimal/features/reports/widgets/category.dart';
import 'package:lostanimal/shared/widgets/contact.dart';
import 'package:lostanimal/features/reports/widgets/description.dart';
import 'package:lostanimal/shared/widgets/exit_confirmation_dialog.dart';
import 'package:lostanimal/features/reports/widgets/location_picker.dart';
import 'package:lostanimal/features/reports/provider/report_notifier.dart';

import 'package:lostanimal/shared/utils/validation_helper.dart';

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
    final colorScheme = Theme.of(context).colorScheme;

    final localTheme = Theme.of(context).copyWith(
      colorScheme: Theme.of(context).colorScheme.copyWith(
        surfaceContainerHighest: Colors.grey[600],
        surface: Colors.white,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(),
      ),
    );
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
        appBar: AppBar(title: Text('Report Seen')),
        body: SafeArea(
          child: Form(
            key: keyForm,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 32,
                  children: [
                    LocationPicker(),
                    BuildImageGallery(),
                    Category(),
                    Description((value) {
                      safeCallIfNotEmpty(value, (value) {
                        ref
                            .read(reportNotifierProvider.notifier)
                            .updateAdditionalInfo(value);
                      });
                    }, 'Description'),
                    Contact(),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: SaveReportBtn(keyForm, 'seen'),
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
