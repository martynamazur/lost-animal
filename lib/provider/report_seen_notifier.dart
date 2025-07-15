import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/report_model.dart';

part 'report_seen_notifier.g.dart';

@riverpod
class ReportSeenNotifier extends _$ReportSeenNotifier {
  
  @override
   Report build() {
    return Report.empty();
  }

  Report getCurrentReport(){
    return state;
  }

  void updateId(String newId) {
    state = state.copyWith(id: newId);
  }

  void updateDateAndTime( DateTime newDateAndTime){
    state = state.copyWith(missingSince: newDateAndTime);
  }

  void updateDescriptionInf(String newDescription){
    state = state.copyWith(additionalInfo: newDescription);
  }

  void updatePictures(List<String> newPictures){

    final updatedList = List<String>.from(state.pictures)..addAll(newPictures);
    state = state.copyWith(pictures: updatedList);

  }

  void updatePhoneNumber(String newPhoneNumber){
    state = state.copyWith(phoneNumber: newPhoneNumber);
  }

  void updateLongitude(double newLongitude){
    state = state.copyWith(longitude: newLongitude);
  }

  void updateLatitude(double newLatitude){
    state = state.copyWith(longitude: newLatitude);
  }

}
