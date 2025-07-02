import 'dart:developer' as developer;
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:lostanimal/provider/report_missing_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'gallery_notifier.g.dart';

@riverpod
class GalleryNotifier extends _$GalleryNotifier {


  @override
  FutureOr<List<String>> build() async {
    final reportId = await createReportInDatabase();
    ref.read(reportMissingNotifierProvider.notifier).updateId(reportId);
    return [] ;
  }

  Future<void> addImage() async{
    final pickedFiles = await ImagePicker().pickMultiImage();
    final files = pickedFiles.map((file) => File(file.path)).toList();
    final imageUrls = await uploadReportImages(files);

    if(imageUrls != null){
      ref.read(reportMissingNotifierProvider.notifier).updatePictures(imageUrls);
      state = AsyncData([...state.value ?? [], ...imageUrls]);
    }

  }

  Future<List<String>?> uploadReportImages(List<File> files) async {
    final reportId = ref.watch(reportMissingNotifierProvider.select((form) => form.id));
    try {
      final ref = FirebaseStorage.instance.ref().child('report/$reportId');
      final uploadTasks = files.map((file) async {
        final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
        final fileRef = ref.child(fileName);
        await fileRef.putFile(file);
        return await fileRef.getDownloadURL();
      });

      final urls = await Future.wait(uploadTasks);
      return urls;
    } on FirebaseException catch (e) {
      developer.log('Upload failed: ${e.message}', error: e);
      return [];
    }
  }


  Future<String> createReportInDatabase() async {
    final docRef = FirebaseFirestore.instance.collection('reports').doc();
    await docRef.set({
      'title': '',
      'description': '',
      'createdAt': FieldValue.serverTimestamp(),
    });
    return docRef.id;
  }

  void removeImage(String removeUrl){
    final current = state.value;
    final updated = List<String>.from(current!)..removeWhere((url) => url == removeUrl);
    state = AsyncData(updated);
  }

}
