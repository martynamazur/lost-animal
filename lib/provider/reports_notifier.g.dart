// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ReportsNotifier)
const reportsNotifierProvider = ReportsNotifierProvider._();

final class ReportsNotifierProvider
    extends $AsyncNotifierProvider<ReportsNotifier, ReportsState> {
  const ReportsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportsNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportsNotifierHash();

  @$internal
  @override
  ReportsNotifier create() => ReportsNotifier();
}

String _$reportsNotifierHash() => r'7848a85957b0642f854d1a0d01cc83b901905422';

abstract class _$ReportsNotifier extends $AsyncNotifier<ReportsState> {
  FutureOr<ReportsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<ReportsState>, ReportsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ReportsState>, ReportsState>,
              AsyncValue<ReportsState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
