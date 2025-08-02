// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(userRepository)
const userRepositoryProvider = UserRepositoryProvider._();

final class UserRepositoryProvider
    extends $FunctionalProvider<UserRepository, UserRepository, UserRepository>
    with $Provider<UserRepository> {
  const UserRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserRepository create(Ref ref) {
    return userRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRepository>(value),
    );
  }
}

String _$userRepositoryHash() => r'8366fba5ac0d6b90c6a637882d24c5e759a5a92f';

@ProviderFor(createAccount)
const createAccountProvider = CreateAccountFamily._();

final class CreateAccountProvider
    extends $FunctionalProvider<AsyncValue<Result>, Result, FutureOr<Result>>
    with $FutureModifier<Result>, $FutureProvider<Result> {
  const CreateAccountProvider._({
    required CreateAccountFamily super.from,
    required ({String emailAddress, String password}) super.argument,
  }) : super(
         retry: null,
         name: r'createAccountProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$createAccountHash();

  @override
  String toString() {
    return r'createAccountProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<Result> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Result> create(Ref ref) {
    final argument = this.argument as ({String emailAddress, String password});
    return createAccount(
      ref,
      emailAddress: argument.emailAddress,
      password: argument.password,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CreateAccountProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$createAccountHash() => r'caa1ec1a03b28723dde0000a84f829a830608d9d';

final class CreateAccountFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<Result>,
          ({String emailAddress, String password})
        > {
  const CreateAccountFamily._()
    : super(
        retry: null,
        name: r'createAccountProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CreateAccountProvider call({
    required String emailAddress,
    required String password,
  }) => CreateAccountProvider._(
    argument: (emailAddress: emailAddress, password: password),
    from: this,
  );

  @override
  String toString() => r'createAccountProvider';
}

@ProviderFor(signIn)
const signInProvider = SignInFamily._();

final class SignInProvider
    extends $FunctionalProvider<AsyncValue<Result>, Result, FutureOr<Result>>
    with $FutureModifier<Result>, $FutureProvider<Result> {
  const SignInProvider._({
    required SignInFamily super.from,
    required ({String emailAddress, String password}) super.argument,
  }) : super(
         retry: null,
         name: r'signInProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$signInHash();

  @override
  String toString() {
    return r'signInProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<Result> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Result> create(Ref ref) {
    final argument = this.argument as ({String emailAddress, String password});
    return signIn(
      ref,
      emailAddress: argument.emailAddress,
      password: argument.password,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SignInProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$signInHash() => r'53c15037afd12eccc1050dd941c27e704db9ab1e';

final class SignInFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<Result>,
          ({String emailAddress, String password})
        > {
  const SignInFamily._()
    : super(
        retry: null,
        name: r'signInProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SignInProvider call({
    required String emailAddress,
    required String password,
  }) => SignInProvider._(
    argument: (emailAddress: emailAddress, password: password),
    from: this,
  );

  @override
  String toString() => r'signInProvider';
}

@ProviderFor(signOut)
const signOutProvider = SignOutProvider._();

final class SignOutProvider
    extends $FunctionalProvider<AsyncValue<Result>, Result, FutureOr<Result>>
    with $FutureModifier<Result>, $FutureProvider<Result> {
  const SignOutProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signOutProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signOutHash();

  @$internal
  @override
  $FutureProviderElement<Result> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Result> create(Ref ref) {
    return signOut(ref);
  }
}

String _$signOutHash() => r'836ba51808ea291a969819db765bf8af546876e4';

@ProviderFor(signInAnon)
const signInAnonProvider = SignInAnonProvider._();

final class SignInAnonProvider
    extends $FunctionalProvider<AsyncValue<Result>, Result, FutureOr<Result>>
    with $FutureModifier<Result>, $FutureProvider<Result> {
  const SignInAnonProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signInAnonProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signInAnonHash();

  @$internal
  @override
  $FutureProviderElement<Result> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Result> create(Ref ref) {
    return signInAnon(ref);
  }
}

String _$signInAnonHash() => r'687353a3ed03c5267bde4c29b8e616152c943ce1';

@ProviderFor(resetPassword)
const resetPasswordProvider = ResetPasswordFamily._();

final class ResetPasswordProvider
    extends $FunctionalProvider<AsyncValue<Result>, Result, FutureOr<Result>>
    with $FutureModifier<Result>, $FutureProvider<Result> {
  const ResetPasswordProvider._({
    required ResetPasswordFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'resetPasswordProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$resetPasswordHash();

  @override
  String toString() {
    return r'resetPasswordProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Result> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Result> create(Ref ref) {
    final argument = this.argument as String;
    return resetPassword(ref, emailAddress: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ResetPasswordProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$resetPasswordHash() => r'926582ce0e0e87976dcb41cb3e0d1df7fe0c2e2f';

final class ResetPasswordFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Result>, String> {
  const ResetPasswordFamily._()
    : super(
        retry: null,
        name: r'resetPasswordProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ResetPasswordProvider call({required String emailAddress}) =>
      ResetPasswordProvider._(argument: emailAddress, from: this);

  @override
  String toString() => r'resetPasswordProvider';
}

@ProviderFor(changeEmail)
const changeEmailProvider = ChangeEmailFamily._();

final class ChangeEmailProvider
    extends $FunctionalProvider<AsyncValue<Result>, Result, FutureOr<Result>>
    with $FutureModifier<Result>, $FutureProvider<Result> {
  const ChangeEmailProvider._({
    required ChangeEmailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'changeEmailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$changeEmailHash();

  @override
  String toString() {
    return r'changeEmailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Result> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Result> create(Ref ref) {
    final argument = this.argument as String;
    return changeEmail(ref, newEmail: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ChangeEmailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$changeEmailHash() => r'86c2b6aeceb6a98d75375eb550bd2838c85db2fb';

final class ChangeEmailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Result>, String> {
  const ChangeEmailFamily._()
    : super(
        retry: null,
        name: r'changeEmailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ChangeEmailProvider call({required String newEmail}) =>
      ChangeEmailProvider._(argument: newEmail, from: this);

  @override
  String toString() => r'changeEmailProvider';
}

@ProviderFor(changePassword)
const changePasswordProvider = ChangePasswordFamily._();

final class ChangePasswordProvider
    extends $FunctionalProvider<AsyncValue<Result>, Result, FutureOr<Result>>
    with $FutureModifier<Result>, $FutureProvider<Result> {
  const ChangePasswordProvider._({
    required ChangePasswordFamily super.from,
    required ({String newPassword, String currentPassword}) super.argument,
  }) : super(
         retry: null,
         name: r'changePasswordProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$changePasswordHash();

  @override
  String toString() {
    return r'changePasswordProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<Result> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Result> create(Ref ref) {
    final argument =
        this.argument as ({String newPassword, String currentPassword});
    return changePassword(
      ref,
      newPassword: argument.newPassword,
      currentPassword: argument.currentPassword,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ChangePasswordProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$changePasswordHash() => r'9b148fd288c778bad50bfb3eab1be54d11d76b2f';

final class ChangePasswordFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<Result>,
          ({String newPassword, String currentPassword})
        > {
  const ChangePasswordFamily._()
    : super(
        retry: null,
        name: r'changePasswordProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ChangePasswordProvider call({
    required String newPassword,
    required String currentPassword,
  }) => ChangePasswordProvider._(
    argument: (newPassword: newPassword, currentPassword: currentPassword),
    from: this,
  );

  @override
  String toString() => r'changePasswordProvider';
}

@ProviderFor(reAuthenticate)
const reAuthenticateProvider = ReAuthenticateFamily._();

final class ReAuthenticateProvider
    extends $FunctionalProvider<AsyncValue<Result>, Result, FutureOr<Result>>
    with $FutureModifier<Result>, $FutureProvider<Result> {
  const ReAuthenticateProvider._({
    required ReAuthenticateFamily super.from,
    required ({String email, String password}) super.argument,
  }) : super(
         retry: null,
         name: r'reAuthenticateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$reAuthenticateHash();

  @override
  String toString() {
    return r'reAuthenticateProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<Result> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Result> create(Ref ref) {
    final argument = this.argument as ({String email, String password});
    return reAuthenticate(
      ref,
      email: argument.email,
      password: argument.password,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ReAuthenticateProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reAuthenticateHash() => r'50d6c8840f6179cca9ef1c5e4b614819739e3bb7';

final class ReAuthenticateFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<Result>,
          ({String email, String password})
        > {
  const ReAuthenticateFamily._()
    : super(
        retry: null,
        name: r'reAuthenticateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ReAuthenticateProvider call({
    required String email,
    required String password,
  }) => ReAuthenticateProvider._(
    argument: (email: email, password: password),
    from: this,
  );

  @override
  String toString() => r'reAuthenticateProvider';
}

@ProviderFor(linkWithCredential)
const linkWithCredentialProvider = LinkWithCredentialFamily._();

final class LinkWithCredentialProvider
    extends $FunctionalProvider<AsyncValue<Result>, Result, FutureOr<Result>>
    with $FutureModifier<Result>, $FutureProvider<Result> {
  const LinkWithCredentialProvider._({
    required LinkWithCredentialFamily super.from,
    required AuthCredential super.argument,
  }) : super(
         retry: null,
         name: r'linkWithCredentialProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$linkWithCredentialHash();

  @override
  String toString() {
    return r'linkWithCredentialProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Result> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Result> create(Ref ref) {
    final argument = this.argument as AuthCredential;
    return linkWithCredential(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LinkWithCredentialProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$linkWithCredentialHash() =>
    r'6876144d9af2701282dbcfcda7d2cce829f3bb73';

final class LinkWithCredentialFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Result>, AuthCredential> {
  const LinkWithCredentialFamily._()
    : super(
        retry: null,
        name: r'linkWithCredentialProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LinkWithCredentialProvider call(AuthCredential authCredential) =>
      LinkWithCredentialProvider._(argument: authCredential, from: this);

  @override
  String toString() => r'linkWithCredentialProvider';
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
