import 'dart:developer' as developer;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/presentation/test3/save_report_btn.dart';
import 'package:lostanimal/presentation/widget/breed.dart';
import 'package:lostanimal/presentation/widget/build_image_gallery.dart';
import 'package:lostanimal/presentation/widget/category.dart';
import 'package:lostanimal/presentation/widget/chip.dart';
import 'package:lostanimal/presentation/widget/contact.dart';
import 'package:lostanimal/presentation/widget/datetime_picker_button.dart';
import 'package:lostanimal/presentation/widget/description.dart';
import 'package:lostanimal/presentation/widget/exit_confirmation_dialog.dart';
import 'package:lostanimal/presentation/widget/gender.dart';
import 'package:lostanimal/presentation/widget/location_picker.dart';
import 'package:lostanimal/presentation/widget/reward.dart';

import 'package:lostanimal/provider/report_notifier.dart';


@RoutePage()
class ReportMissingFormScreen extends ConsumerStatefulWidget {
  const ReportMissingFormScreen({super.key});

  @override
  ConsumerState createState() => _ReportMissingFormScreenState();
}

class _ReportMissingFormScreenState extends ConsumerState<ReportMissingFormScreen> {
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
        appBar: AppBar(
          title: Text('Report Missing'),
        ),
        body: SafeArea(
            child: Form(
              key: keyForm,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      LocationPicker(),
                      BuildImageGallery(),
                      Category(),
                      Breed(),
                      GenderDropDown(),
                      ChipSwitch(),
                      Description((value){
                        ref.read(reportNotifierProvider.notifier).updateColoration(value);
                      },
                          'What is its coat color?'
                      ),//color
                      DateTimePickerButton(),
                      Reward(),
                      Description((value){
                        ref.read(reportNotifierProvider.notifier).updateAdditionalInfo(value);
                      },
                        'Description'
                      ),
                      Contact(),
                    ],
                  ),
                ),
              ),
            )
        ),
        bottomNavigationBar: SaveReportBtn(keyForm, 'missing') ,
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
