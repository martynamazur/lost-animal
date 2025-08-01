import 'dart:developer' as developer;

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/presentation/test3/mutation_provider.dart';
import 'package:lostanimal/presentation/test3/save_report_btn.dart';
import 'package:lostanimal/presentation/widget/build_image_gallery.dart';
import 'package:lostanimal/presentation/widget/category.dart';
import 'package:lostanimal/presentation/widget/contact.dart';
import 'package:lostanimal/presentation/widget/description.dart';
import 'package:lostanimal/presentation/widget/exit_confirmation_dialog.dart';
import 'package:lostanimal/presentation/widget/location_picker.dart';
import 'package:lostanimal/provider/report_notifier.dart';

import 'package:lostanimal/utils/validation_helper.dart';


@RoutePage()
class ReportSeenFromScreen extends ConsumerStatefulWidget {
  const ReportSeenFromScreen({super.key});

  @override
  ConsumerState createState() => _ReportSeenFromScreenState();
}

class _ReportSeenFromScreenState extends ConsumerState<ReportSeenFromScreen> {
  final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async{
        if(didPop) return;
        final shouldExit = await _showExitConfirmationDialog(context);
        if(shouldExit){
          context.router.pop();
        }
      },
      child: Scaffold(
        body: SafeArea(
            child: Form(
              key: keyForm,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      LocationPicker(),
                      BuildImageGallery(),
                      Category(),
                      Description((value){
                        safeCallIfNotEmpty(value, (value) {
                          ref.read(reportNotifierProvider.notifier).updateAdditionalInfo(value);
                        });
                      },'Description'),
                      Contact()

                    ],
                  ),
                )
            )
        ),
        bottomNavigationBar:  SaveReportBtn(keyForm, 'seen'),
      ),
    );
  }

  Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (ctx) => const ExitConfirmationDialog(),
    ) ?? false;
  }
}
