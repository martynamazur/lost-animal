// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ReportNotifier)
const reportNotifierProvider = ReportNotifierProvider._();

final class ReportNotifierProvider
    extends $NotifierProvider<ReportNotifier, Report> {
  const ReportNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportNotifierHash();

  @$internal
  @override
  ReportNotifier create() => ReportNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Report value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Report>(value),
    );
  }
}

String _$reportNotifierHash() => r'69269b0b726fe572886f79e31d95bda0c71a5c0f';

abstract class _$ReportNotifier extends $Notifier<Report> {
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
