// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(AuthNotifier)
const authNotifierProvider = AuthNotifierProvider._();

final class AuthNotifierProvider
    extends $AsyncNotifierProvider<AuthNotifier, void> {
  const AuthNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authNotifierHash();

  @$internal
  @override
  AuthNotifier create() => AuthNotifier();
}

String _$authNotifierHash() => r'6efbb1d94e1d5fe6d04493ba8cd5c2533836ba47';

abstract class _$AuthNotifier extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
