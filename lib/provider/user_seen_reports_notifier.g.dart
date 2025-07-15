// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_seen_reports_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(UserSeenReportsNotifier)
const userSeenReportsNotifierProvider = UserSeenReportsNotifierProvider._();

final class UserSeenReportsNotifierProvider
    extends $AsyncNotifierProvider<UserSeenReportsNotifier, List<Report>> {
  const UserSeenReportsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userSeenReportsNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userSeenReportsNotifierHash();

  @$internal
  @override
  UserSeenReportsNotifier create() => UserSeenReportsNotifier();
}

String _$userSeenReportsNotifierHash() =>
    r'f2c9eacdb44b9f1d90d5ab9065601fcc9bc39215';

abstract class _$UserSeenReportsNotifier extends $AsyncNotifier<List<Report>> {
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
