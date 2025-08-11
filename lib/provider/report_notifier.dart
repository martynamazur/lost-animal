import 'dart:developer' as developer;


import 'package:firebase_auth/firebase_auth.dart';
import 'package:lostanimal/model/animal_category.dart';
import 'package:lostanimal/provider/report_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/gender.dart';
import '../model/report_model.dart';


part 'report_notifier.g.dart';

@riverpod
class ReportNotifier extends _$ReportNotifier {

  @override
  Report build() {
    return Report.empty();
  }


  Report getCurrentReport(){
    return state;
  }


  void updateId(String id){
    state = state.copyWith(id: id);
  }

  void updatePictures(List<String> newPictures) {
    final existing = state.pictures.toSet();
    final toAdd = newPictures.where((url) => !existing.contains(url)).toList();
    if (toAdd.isNotEmpty) {
      final updatedList = [...state.pictures, ...toAdd];
      state = state.copyWith(pictures: updatedList);
    }
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

  void updateUuid(String userUuid){
    state = state.copyWith(userId: userUuid);
  }

  void updateLongitude(double newLongitude){
    state = state.copyWith(longitude: newLongitude);
  }

  void updateLatitude(double newLatitude){
    state = state.copyWith(longitude: newLatitude);
  }

  void updateCityName(String newCityName){
    state = state.copyWith(cityName : newCityName);
  }

  void updateType(String type){
    state = state.copyWith(type: type);
  }

  void updateAuthorDisplayName(String name){
    state = state.copyWith(reportAuthorDisplayName: name);
  }


  Future<void> updateLocation(double lat, double lng, String cityName) async{
    state = state.copyWith(
      latitude: lat,
      longitude: lng,
      cityName: cityName
    );
  }


  Future<void> saveToFirestore(String type) async {
    final authorDisplayName = FirebaseAuth.instance.currentUser?.displayName ?? 'Unknown';
    updateAuthorDisplayName(authorDisplayName);
    updateType(type);
    final reportId = await ref.read(createReportProvider(collectionPath: 'reports').future);
    final userUuid = FirebaseAuth.instance.currentUser!.uid;
    updateId(reportId);
    updateUuid(userUuid);

    developer.log('Report id $reportId');
    developer.log('Linki ${state.pictures.length}');
    final report = state;

    await ref.read(updateReportProvider('reports', report).future);

  }
}