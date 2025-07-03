import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/model/animal_category.dart';
import 'package:lostanimal/presentation/widget/breed.dart';
import 'package:lostanimal/presentation/widget/build_image_gallery.dart';
import 'package:lostanimal/presentation/widget/category.dart';
import 'package:lostanimal/presentation/widget/chip.dart';
import 'package:lostanimal/presentation/widget/contact.dart';
import 'package:lostanimal/presentation/widget/datetime_picker_button.dart';
import 'package:lostanimal/presentation/widget/description.dart';
import 'package:lostanimal/presentation/widget/gender.dart';
import 'package:lostanimal/presentation/widget/reward.dart';
import 'package:lostanimal/provider/gallery_notifier.dart';
import 'package:lostanimal/provider/report_missing_notifier.dart';

import '../model/gender.dart';

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
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
          onPressed: (){
            if(keyForm.currentState?.validate() ?? false){
              keyForm.currentState?.save();

            }
          },
          child: Text('Save')
      ),
      body: SafeArea(
          child: Form(
            key: keyForm,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    BuildImageGallery(),
                    Category(),
                    Breed(),
                    GenderDropDown(),
                    ChipSwitch(),
                    Description((value){
                      ref.read(reportMissingNotifierProvider.notifier).updateColoration(value);
                    },
                        'What is its coat color?'
                    ),//color
                    DateTimePickerButton(
                        (value) async{
                          ref.read(reportMissingNotifierProvider.notifier).updateMissingSince(value);
                        }
                    ),
                    Reward(),
                    Description((value){
                      ref.read(reportMissingNotifierProvider.notifier).updateAdditionalInfo(value);
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
    );
  }
}
