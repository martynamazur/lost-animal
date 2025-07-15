import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/repository/report_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/report_model.dart';
import '../model/result_model.dart';

part 'report_provider.g.dart';

@riverpod
ReportRepository reportRepository(Ref ref) {
  return ReportRepository();
}

@riverpod
Future<Result> updateReport(Ref ref, String collectionPath, Report report) async {
  developer.log('CollectionPath $collectionPath');
  return ref.read(reportRepositoryProvider).updateReport(collectionPath, report);
}

@riverpod
Future<String> createReport(Ref ref,{required String collectionPath}) async {
  return ref.read(reportRepositoryProvider).createReport(collectionPath);
}

@riverpod
Future<List<Report>> getUserMissingReports(Ref ref) async {
  return ref.read(reportRepositoryProvider).getUserMissingReports();
}

@riverpod
Future<List<Report>> getUserSeenReports(Ref ref) async {
  return ref.read(reportRepositoryProvider).getUserSeenReports();
}

@riverpod
Stream<List<Report>> getAllReports(Ref ref) {
  return ref.read(reportRepositoryProvider).getAllReports();
}
