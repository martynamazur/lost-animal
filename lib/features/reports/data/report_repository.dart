import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lostanimal/shared/models/report_model.dart';

import 'package:lostanimal/shared/models/result_model.dart';

class ReportRepository {
  final _collection = FirebaseFirestore.instance.collection('reports');
  late final String _userId;

  ReportRepository() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _userId = user.uid;
    } else {
      throw Exception('User not logged in');
    }
  }

  Future<String> createReport(String collectionPath) async {
    final docRef = FirebaseFirestore.instance.collection(collectionPath).doc();
    await docRef.set({
      'createdAt': FieldValue.serverTimestamp(),
      'authorId': _userId,
    });
    return docRef.id;
  }

  Future<Result> updateReport(String collectionPath, Report report) async {
    try {
      final String? reportId = report.id;
      final data = report.toJson();

      final ref = FirebaseFirestore.instance
          .collection(collectionPath)
          .doc(reportId)
          .set(data, SetOptions(merge: true));

      return Result.success();
    } on FirebaseException catch (e) {
      return Result.failure('something wentw rong');
    }
  }

  Future<List<Report>> getUserMissingReports() async {
    try {
      final snapshot = await _collection
          .where('type', isEqualTo: 'missing')
          .where('userId', isEqualTo: _userId)
          .get();

      return snapshot.docs
          .map((report) => Report.fromJson(report.data()))
          .toList();
    } on FirebaseException catch (e) {
      return [];
    }
  }

  Future<List<Report>> getUserSeenReports() async {
    try {
      final snapshot = await _collection
          .where('type', isEqualTo: 'seen')
          .where('userId', isEqualTo: _userId)
          .get();
      return snapshot.docs
          .map((report) => Report.fromJson(report.data()))
          .toList();
    } on FirebaseException catch (e) {
      return [];
    }
  }

  Stream<List<Report>> getAllReports() {
    return _collection
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => Report.fromJson(doc.data()))
              .toList();
        })
        .handleError((error) {});
  }

  Future<Report?> getReportById(String reportId) async {
    try {
      final docs = await _collection.doc(reportId).get();
      if (docs.exists) {
        return Report.fromJson(docs.data()!);
      } else {
        throw Exception('Report not found');
      }
    } on FirebaseException catch (e) {}
    return null;
  }

  Future<String> getReportFirstPhoto(String reportId) async {
    try {
      final doc = await _collection.doc(reportId).get();
      if (doc.exists) {
        final data = doc.data();
        if (data != null &&
            data.containsKey('pictures') &&
            data['pictures'].isNotEmpty) {
          return data['pictures'][0];
        } else {
          throw Exception('No photos found for this report');
        }
      } else {
        throw Exception('Report not found');
      }
    } on FirebaseException catch (e) {
      throw Exception('Error fetching report photos: $e');
    }
  }
}
