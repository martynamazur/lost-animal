import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lostanimal/model/report_missing_model.dart';
import 'package:lostanimal/model/report_seen_model.dart';
import 'package:lostanimal/model/result_model.dart';

class ReportRepository{

  late final String userId;


  ReportRepository(){
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;
    } else {
      throw Exception('User not logged in');
    }
  }

  Future<String> createReport(String collectionPath) async{
    final docRef = FirebaseFirestore.instance.collection(collectionPath).doc();
    await docRef.set({
      'createdAt': FieldValue.serverTimestamp(),
    });
    return docRef.id;
  }

  Future<Result> updateReport(String collectionPath, ReportSeen? reportSeen, ReportMissing? reportMissing) async{
    try{
      late final String reportId;
      if (reportSeen != null) reportId = reportSeen.id;
      if (reportMissing != null) reportId = reportMissing.id;

      final ref = FirebaseFirestore.instance
          .collection(collectionPath)
          .doc(reportId);

      final Map<String, dynamic> data = {};
      if (reportSeen != null) data.addAll(reportSeen.toJson());
      if (reportMissing != null) data.addAll(reportMissing.toJson());

      if (data.isEmpty) return Result.success();

      await ref.set(data, SetOptions(merge: true));
      return Result.success();


    }on FirebaseAuthException catch(e){
      return Result.failure('something wentw rong');
    }
  }

  Future<List<ReportMissing>> getUserMissingReports() async{

    try{
      final snapshot = await FirebaseFirestore.instance
          .collection('reports')
          .where('type',isEqualTo: 'missing')
          .where('userId', isEqualTo: userId)
          .get();

      return snapshot.docs.map((report) => ReportMissing.fromJson(report.data())).toList();
    }on FirebaseAuthException catch(e){
      return [];
    }
  }

  Future<List<ReportSeen>> getUserSeenReports() async{
    try{
      final snapshot = await FirebaseFirestore.instance
          .collection('reports')
          .where('type', isEqualTo: 'seen')
          .where('userId', isEqualTo: userId)
          .get();
      return snapshot.docs.map((report) => ReportSeen.fromJson(report.data())).toList();

    }on FirebaseAuthException catch(e){
      return [];
    }
  }
}

