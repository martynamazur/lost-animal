// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_form_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(SignUpFormNotifier)
const signUpFormNotifierProvider = SignUpFormNotifierProvider._();

final class SignUpFormNotifierProvider
    extends $AsyncNotifierProvider<SignUpFormNotifier, void> {
  const SignUpFormNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signUpFormNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signUpFormNotifierHash();

  @$internal
  @override
  SignUpFormNotifier create() => SignUpFormNotifier();
}

String _$signUpFormNotifierHash() =>
    r'be669c8206b7f1b74c543504424a2ab47178b714';

abstract class _$SignUpFormNotifier extends $AsyncNotifier<void> {
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
