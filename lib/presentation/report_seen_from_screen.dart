import 'dart:developer' as developer;

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/presentation/test3/mutation_provider.dart';
import 'package:lostanimal/presentation/widget/build_image_gallery.dart';
import 'package:lostanimal/presentation/widget/category.dart';
import 'package:lostanimal/presentation/widget/contact.dart';
import 'package:lostanimal/presentation/widget/description.dart';
import 'package:lostanimal/provider/report_missing_notifier.dart';
import 'package:lostanimal/provider/report_provider.dart';
import 'package:lostanimal/provider/report_seen_notifier.dart';
import 'package:lostanimal/utils/validation_helper.dart';
import 'package:riverpod/experimental/mutation.dart';
import 'package:riverpod/riverpod.dart';

import '../model/result_model.dart';

@RoutePage()
class ReportSeenFromScreen extends ConsumerStatefulWidget {
  const ReportSeenFromScreen({super.key});

  @override
  ConsumerState createState() => _ReportSeenFromScreenState();
}

class _ReportSeenFromScreenState extends ConsumerState<ReportSeenFromScreen> {
  final keyForm = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    developer.log('initState started');
    //_createReportAndSetId();
  }

  Future<void> _createReportAndSetId() async {
    final reportId = await ref.read(createReportProvider(collectionPath: 'reports').future);
    developer.log('Report id $reportId');
    ref.read(reportSeenNotifierProvider.notifier).updateId(reportId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
            key: keyForm,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BuildImageGallery((imageUrls){
                      ref.read(reportSeenNotifierProvider.notifier).updatePictures(imageUrls);
                    }),
                    Category(),
                    Description((value){
                      safeCallIfNotEmpty(value, (value) {
                        ref.read(reportSeenNotifierProvider.notifier).updateDescriptionInf(value);
                      });
                    },'Description'),
                    Contact((value){
                      safeCallIfNotEmpty(value, (value){
                        ref.read(reportSeenNotifierProvider.notifier).updatePhoneNumber(value);
                      });
                    })

                  ],
                ),
              )
          )
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
              onPressed: () async{
                developer.log('KLIK');
                if(keyForm.currentState?.validate() ?? false){
                  keyForm.currentState?.save();

                  developer.log('Zapisalo sie ?');
                  await _createReportAndSetId();



                  final form =  ref.read(reportSeenNotifierProvider.notifier).getCurrentReport();
                  developer.log('Zapisalo sie id ? ${form.missingSince}');
                  developer.log('Zapisalo sie id ? ${form.id}');
                  final result = await ref.read(updateReportProvider('reports',form).future);
                  if(result.success){
                    developer.log('Success');
                    //Przenisc i zrobic ekran z podsumowaniem dodanych zgloszen,
                    //lub jeszcze przed tym dialog wyswietl z powodzeniem badz nie
                    //context.router.replace(route)
                  }else{

                  }
                }
              },
              child: Text('Save')
          ),
      ),
    );
  }

  void _showConfirmationDialog(){
    showDialog(
        context: context,
        builder: (_){
          return AlertDialog(
            title: Text('Success'),
          );
        }
    );
  }
}
