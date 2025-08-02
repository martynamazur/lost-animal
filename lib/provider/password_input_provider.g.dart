// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_input_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(PasswordInputNotifier)
const passwordInputNotifierProvider = PasswordInputNotifierProvider._();

final class PasswordInputNotifierProvider
    extends $NotifierProvider<PasswordInputNotifier, String> {
  const PasswordInputNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'passwordInputNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$passwordInputNotifierHash();

  @$internal
  @override
  PasswordInputNotifier create() => PasswordInputNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$passwordInputNotifierHash() =>
    r'9a5fe9961ef2435323b4fc129e349e0bfa188d30';

abstract class _$PasswordInputNotifier extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
