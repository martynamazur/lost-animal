// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_missing_reports_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(UserMissingReportsNotifier)
const userMissingReportsNotifierProvider =
    UserMissingReportsNotifierProvider._();

final class UserMissingReportsNotifierProvider
    extends $AsyncNotifierProvider<UserMissingReportsNotifier, List<Report>> {
  const UserMissingReportsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userMissingReportsNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userMissingReportsNotifierHash();

  @$internal
  @override
  UserMissingReportsNotifier create() => UserMissingReportsNotifier();
}

String _$userMissingReportsNotifierHash() =>
    r'bb2c7c1dca2418a818277ec1b503d2823934be51';

abstract class _$UserMissingReportsNotifier
    extends $AsyncNotifier<List<Report>> {
  FutureOr<List<Report>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Report>>, List<Report>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Report>>, List<Report>>,
              AsyncValue<List<Report>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
