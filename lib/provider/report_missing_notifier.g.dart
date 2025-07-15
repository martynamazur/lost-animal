// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_missing_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ReportMissingNotifier)
const reportMissingNotifierProvider = ReportMissingNotifierProvider._();

final class ReportMissingNotifierProvider
    extends $NotifierProvider<ReportMissingNotifier, Report> {
  const ReportMissingNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportMissingNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportMissingNotifierHash();

  @$internal
  @override
  ReportMissingNotifier create() => ReportMissingNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Report value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Report>(value),
    );
  }
}

String _$reportMissingNotifierHash() =>
    r'4c1fc50bf588139d872c9c3ff957d0843af6d2bb';

abstract class _$ReportMissingNotifier extends $Notifier<Report> {
  Report build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Report, Report>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Report, Report>,
              Report,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
