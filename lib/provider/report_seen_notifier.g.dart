// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_seen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ReportSeenNotifier)
const reportSeenNotifierProvider = ReportSeenNotifierProvider._();

final class ReportSeenNotifierProvider
    extends $NotifierProvider<ReportSeenNotifier, Report> {
  const ReportSeenNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportSeenNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportSeenNotifierHash();

  @$internal
  @override
  ReportSeenNotifier create() => ReportSeenNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Report value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Report>(value),
    );
  }
}

String _$reportSeenNotifierHash() =>
    r'2a194923d61a032175ec746fb10fd5ffac45a361';

abstract class _$ReportSeenNotifier extends $Notifier<Report> {
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
