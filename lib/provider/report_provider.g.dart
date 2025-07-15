// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(reportRepository)
const reportRepositoryProvider = ReportRepositoryProvider._();

final class ReportRepositoryProvider
    extends
        $FunctionalProvider<
          ReportRepository,
          ReportRepository,
          ReportRepository
        >
    with $Provider<ReportRepository> {
  const ReportRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportRepositoryHash();

  @$internal
  @override
  $ProviderElement<ReportRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ReportRepository create(Ref ref) {
    return reportRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReportRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReportRepository>(value),
    );
  }
}

String _$reportRepositoryHash() => r'2b4735b20e22e5cffacf22c70658d1ffa83dfa8e';

@ProviderFor(updateReport)
const updateReportProvider = UpdateReportFamily._();

final class UpdateReportProvider
    extends $FunctionalProvider<AsyncValue<Result>, Result, FutureOr<Result>>
    with $FutureModifier<Result>, $FutureProvider<Result> {
  const UpdateReportProvider._({
    required UpdateReportFamily super.from,
    required (String, Report) super.argument,
  }) : super(
         retry: null,
         name: r'updateReportProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$updateReportHash();

  @override
  String toString() {
    return r'updateReportProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<Result> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Result> create(Ref ref) {
    final argument = this.argument as (String, Report);
    return updateReport(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateReportProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateReportHash() => r'e662cb8472f7e1d61fb5adf10493f54198413f4b';

final class UpdateReportFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Result>, (String, Report)> {
  const UpdateReportFamily._()
    : super(
        retry: null,
        name: r'updateReportProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UpdateReportProvider call(String collectionPath, Report report) =>
      UpdateReportProvider._(argument: (collectionPath, report), from: this);

  @override
  String toString() => r'updateReportProvider';
}

@ProviderFor(createReport)
const createReportProvider = CreateReportFamily._();

final class CreateReportProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  const CreateReportProvider._({
    required CreateReportFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'createReportProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$createReportHash();

  @override
  String toString() {
    return r'createReportProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    final argument = this.argument as String;
    return createReport(ref, collectionPath: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateReportProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$createReportHash() => r'be20493c34c21659c4a6634b705e906a58952884';

final class CreateReportFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<String>, String> {
  const CreateReportFamily._()
    : super(
        retry: null,
        name: r'createReportProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CreateReportProvider call({required String collectionPath}) =>
      CreateReportProvider._(argument: collectionPath, from: this);

  @override
  String toString() => r'createReportProvider';
}

@ProviderFor(getUserMissingReports)
const getUserMissingReportsProvider = GetUserMissingReportsProvider._();

final class GetUserMissingReportsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Report>>,
          List<Report>,
          FutureOr<List<Report>>
        >
    with $FutureModifier<List<Report>>, $FutureProvider<List<Report>> {
  const GetUserMissingReportsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUserMissingReportsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUserMissingReportsHash();

  @$internal
  @override
  $FutureProviderElement<List<Report>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Report>> create(Ref ref) {
    return getUserMissingReports(ref);
  }
}

String _$getUserMissingReportsHash() =>
    r'815d40491017ba74db184800c2e000b117c45cf3';

@ProviderFor(getUserSeenReports)
const getUserSeenReportsProvider = GetUserSeenReportsProvider._();

final class GetUserSeenReportsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Report>>,
          List<Report>,
          FutureOr<List<Report>>
        >
    with $FutureModifier<List<Report>>, $FutureProvider<List<Report>> {
  const GetUserSeenReportsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUserSeenReportsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUserSeenReportsHash();

  @$internal
  @override
  $FutureProviderElement<List<Report>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Report>> create(Ref ref) {
    return getUserSeenReports(ref);
  }
}

String _$getUserSeenReportsHash() =>
    r'65553d5dd5c488ce2f9396ee4cb9fc8c85d18a0e';

@ProviderFor(getAllReports)
const getAllReportsProvider = GetAllReportsProvider._();

final class GetAllReportsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Report>>,
          List<Report>,
          Stream<List<Report>>
        >
    with $FutureModifier<List<Report>>, $StreamProvider<List<Report>> {
  const GetAllReportsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAllReportsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAllReportsHash();

  @$internal
  @override
  $StreamProviderElement<List<Report>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Report>> create(Ref ref) {
    return getAllReports(ref);
  }
}

String _$getAllReportsHash() => r'8378e8bc04206297a5253c56a48a2cbd6cd143bd';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
