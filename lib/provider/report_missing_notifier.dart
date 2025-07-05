import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lostanimal/model/animal_category.dart';
import 'package:lostanimal/provider/report_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';


import '../model/gender.dart';
import '../model/report_missing_model.dart';
import '../model/result_model.dart';

part 'report_missing_notifier.g.dart';

@riverpod
class ReportMissingNotifier extends _$ReportMissingNotifier {

  @override
  ReportMissing build() {
    final report = ReportMissing.empty();
    return report;
  }


  ReportMissing getCurrentReport(){
    return state;
  }


  void updateId(String id){
    state = state.copyWith(id: id);
  }

  void updatePictures(List<String> newPictures) {
    final updatedList = List<String>.from(state.pictures)..addAll(newPictures);
    state = state.copyWith(pictures: updatedList);
  }


  void removePicture(String imageUrl){
    final updatedList = state.pictures
        .where((picture) => picture != imageUrl)
        .toList();

    state = state.copyWith(pictures: updatedList);
  }

  void updateCategory(AnimalCategory newCategory) {
    state = state.copyWith(category: newCategory);
  }

  void updateBreed(String newBreed) {
    state = state.copyWith(breed: newBreed);
  }

  void updateGender(Gender newGender) {
    state = state.copyWith(gender: newGender);
  }

  void updateHasChip(bool hasChip) {
    state = state.copyWith(hasChip: hasChip);
  }

  void updateColoration(String newColoration) {
    state = state.copyWith(coloration: newColoration);
  }

  void updateMissingSince(DateTime dateTime) {
    state = state.copyWith(missingSince: dateTime);
  }

  void updateReward(double newReward) {
    state = state.copyWith(reward: newReward);
  }

  void updateAdditionalInfo(String newInfo) {
    state = state.copyWith(additionalInfo: newInfo);
  }

  void updatePhoneNumber(String newPhoneNumber){
    state = state.copyWith(phoneNumber: newPhoneNumber);
  }


  Future<void> saveToFirestore() async {

    final reportId = await ref.read(createReportProvider(collectionPath: 'reports').future);

    updateId(reportId);

    developer.log('Report id $reportId');

    final report = state;

    await ref.read(updateReportProvider('reports',null, report).future);

  }
}