// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userRepositoryHash() => r'8366fba5ac0d6b90c6a637882d24c5e759a5a92f';

/// See also [userRepository].
@ProviderFor(userRepository)
final userRepositoryProvider = AutoDisposeProvider<UserRepository>.internal(
  userRepository,
  name: r'userRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserRepositoryRef = AutoDisposeProviderRef<UserRepository>;
String _$createAccountHash() => r'd9713340ad778130cf9225b4c568cb016cd57862';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [createAccount].
@ProviderFor(createAccount)
const createAccountProvider = CreateAccountFamily();

/// See also [createAccount].
class CreateAccountFamily extends Family<AsyncValue<Result>> {
  /// See also [createAccount].
  const CreateAccountFamily();

  /// See also [createAccount].
  CreateAccountProvider call({
    required String emailAddress,
    required String password,
  }) {
    return CreateAccountProvider(
      emailAddress: emailAddress,
      password: password,
    );
  }

  @override
  CreateAccountProvider getProviderOverride(
    covariant CreateAccountProvider provider,
  ) {
    return call(
      emailAddress: provider.emailAddress,
      password: provider.password,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'createAccountProvider';
}

/// See also [createAccount].
class CreateAccountProvider extends AutoDisposeFutureProvider<Result> {
  /// See also [createAccount].
  CreateAccountProvider({
    required String emailAddress,
    required String password,
  }) : this._internal(
         (ref) => createAccount(
           ref as CreateAccountRef,
           emailAddress: emailAddress,
           password: password,
         ),
         from: createAccountProvider,
         name: r'createAccountProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$createAccountHash,
         dependencies: CreateAccountFamily._dependencies,
         allTransitiveDependencies:
             CreateAccountFamily._allTransitiveDependencies,
         emailAddress: emailAddress,
         password: password,
       );

  CreateAccountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.emailAddress,
    required this.password,
  }) : super.internal();

  final String emailAddress;
  final String password;

  @override
  Override overrideWith(
    FutureOr<Result> Function(CreateAccountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateAccountProvider._internal(
        (ref) => create(ref as CreateAccountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        emailAddress: emailAddress,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Result> createElement() {
    return _CreateAccountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateAccountProvider &&
        other.emailAddress == emailAddress &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, emailAddress.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreateAccountRef on AutoDisposeFutureProviderRef<Result> {
  /// The parameter `emailAddress` of this provider.
  String get emailAddress;

  /// The parameter `password` of this provider.
  String get password;
}

class _CreateAccountProviderElement
    extends AutoDisposeFutureProviderElement<Result>
    with CreateAccountRef {
  _CreateAccountProviderElement(super.provider);

  @override
  String get emailAddress => (origin as CreateAccountProvider).emailAddress;
  @override
  String get password => (origin as CreateAccountProvider).password;
}

String _$signInHash() => r'2a967fd57dbc6e3e4339468214bc7b5f2c582886';

/// See also [signIn].
@ProviderFor(signIn)
const signInProvider = SignInFamily();

/// See also [signIn].
class SignInFamily extends Family<AsyncValue<Result>> {
  /// See also [signIn].
  const SignInFamily();

  /// See also [signIn].
  SignInProvider call({
    required String emailAddress,
    required String password,
  }) {
    return SignInProvider(emailAddress: emailAddress, password: password);
  }

  @override
  SignInProvider getProviderOverride(covariant SignInProvider provider) {
    return call(
      emailAddress: provider.emailAddress,
      password: provider.password,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'signInProvider';
}

/// See also [signIn].
class SignInProvider extends AutoDisposeFutureProvider<Result> {
  /// See also [signIn].
  SignInProvider({required String emailAddress, required String password})
    : this._internal(
        (ref) => signIn(
          ref as SignInRef,
          emailAddress: emailAddress,
          password: password,
        ),
        from: signInProvider,
        name: r'signInProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$signInHash,
        dependencies: SignInFamily._dependencies,
        allTransitiveDependencies: SignInFamily._allTransitiveDependencies,
        emailAddress: emailAddress,
        password: password,
      );

  SignInProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.emailAddress,
    required this.password,
  }) : super.internal();

  final String emailAddress;
  final String password;

  @override
  Override overrideWith(FutureOr<Result> Function(SignInRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: SignInProvider._internal(
        (ref) => create(ref as SignInRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        emailAddress: emailAddress,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Result> createElement() {
    return _SignInProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignInProvider &&
        other.emailAddress == emailAddress &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, emailAddress.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SignInRef on AutoDisposeFutureProviderRef<Result> {
  /// The parameter `emailAddress` of this provider.
  String get emailAddress;

  /// The parameter `password` of this provider.
  String get password;
}

class _SignInProviderElement extends AutoDisposeFutureProviderElement<Result>
    with SignInRef {
  _SignInProviderElement(super.provider);

  @override
  String get emailAddress => (origin as SignInProvider).emailAddress;
  @override
  String get password => (origin as SignInProvider).password;
}

String _$signOutHash() => r'2321bde52f098a03358a8bad28f46725e7abd739';

/// See also [signOut].
@ProviderFor(signOut)
final signOutProvider = AutoDisposeFutureProvider<Result>.internal(
  signOut,
  name: r'signOutProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signOutHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SignOutRef = AutoDisposeFutureProviderRef<Result>;
String _$resetPasswordHash() => r'49ec84e6f38efcc08ea68ebc9f3c942d99b1670a';

/// See also [resetPassword].
@ProviderFor(resetPassword)
const resetPasswordProvider = ResetPasswordFamily();

/// See also [resetPassword].
class ResetPasswordFamily extends Family<AsyncValue<Result>> {
  /// See also [resetPassword].
  const ResetPasswordFamily();

  /// See also [resetPassword].
  ResetPasswordProvider call({required String emailAddress}) {
    return ResetPasswordProvider(emailAddress: emailAddress);
  }

  @override
  ResetPasswordProvider getProviderOverride(
    covariant ResetPasswordProvider provider,
  ) {
    return call(emailAddress: provider.emailAddress);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'resetPasswordProvider';
}

/// See also [resetPassword].
class ResetPasswordProvider extends AutoDisposeFutureProvider<Result> {
  /// See also [resetPassword].
  ResetPasswordProvider({required String emailAddress})
    : this._internal(
        (ref) =>
            resetPassword(ref as ResetPasswordRef, emailAddress: emailAddress),
        from: resetPasswordProvider,
        name: r'resetPasswordProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$resetPasswordHash,
        dependencies: ResetPasswordFamily._dependencies,
        allTransitiveDependencies:
            ResetPasswordFamily._allTransitiveDependencies,
        emailAddress: emailAddress,
      );

  ResetPasswordProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.emailAddress,
  }) : super.internal();

  final String emailAddress;

  @override
  Override overrideWith(
    FutureOr<Result> Function(ResetPasswordRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ResetPasswordProvider._internal(
        (ref) => create(ref as ResetPasswordRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        emailAddress: emailAddress,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Result> createElement() {
    return _ResetPasswordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ResetPasswordProvider && other.emailAddress == emailAddress;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, emailAddress.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ResetPasswordRef on AutoDisposeFutureProviderRef<Result> {
  /// The parameter `emailAddress` of this provider.
  String get emailAddress;
}

class _ResetPasswordProviderElement
    extends AutoDisposeFutureProviderElement<Result>
    with ResetPasswordRef {
  _ResetPasswordProviderElement(super.provider);

  @override
  String get emailAddress => (origin as ResetPasswordProvider).emailAddress;
}

String _$changeEmailHash() => r'cc6386f724479eabf466ae6f6172644c67506ad5';

/// See also [changeEmail].
@ProviderFor(changeEmail)
const changeEmailProvider = ChangeEmailFamily();

/// See also [changeEmail].
class ChangeEmailFamily extends Family<AsyncValue<Result>> {
  /// See also [changeEmail].
  const ChangeEmailFamily();

  /// See also [changeEmail].
  ChangeEmailProvider call({required String newEmail}) {
    return ChangeEmailProvider(newEmail: newEmail);
  }

  @override
  ChangeEmailProvider getProviderOverride(
    covariant ChangeEmailProvider provider,
  ) {
    return call(newEmail: provider.newEmail);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'changeEmailProvider';
}

/// See also [changeEmail].
class ChangeEmailProvider extends AutoDisposeFutureProvider<Result> {
  /// See also [changeEmail].
  ChangeEmailProvider({required String newEmail})
    : this._internal(
        (ref) => changeEmail(ref as ChangeEmailRef, newEmail: newEmail),
        from: changeEmailProvider,
        name: r'changeEmailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$changeEmailHash,
        dependencies: ChangeEmailFamily._dependencies,
        allTransitiveDependencies: ChangeEmailFamily._allTransitiveDependencies,
        newEmail: newEmail,
      );

  ChangeEmailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.newEmail,
  }) : super.internal();

  final String newEmail;

  @override
  Override overrideWith(
    FutureOr<Result> Function(ChangeEmailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChangeEmailProvider._internal(
        (ref) => create(ref as ChangeEmailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        newEmail: newEmail,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Result> createElement() {
    return _ChangeEmailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChangeEmailProvider && other.newEmail == newEmail;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, newEmail.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChangeEmailRef on AutoDisposeFutureProviderRef<Result> {
  /// The parameter `newEmail` of this provider.
  String get newEmail;
}

class _ChangeEmailProviderElement
    extends AutoDisposeFutureProviderElement<Result>
    with ChangeEmailRef {
  _ChangeEmailProviderElement(super.provider);

  @override
  String get newEmail => (origin as ChangeEmailProvider).newEmail;
}

String _$reAuthenticateHash() => r'50d6c8840f6179cca9ef1c5e4b614819739e3bb7';

/// See also [reAuthenticate].
@ProviderFor(reAuthenticate)
const reAuthenticateProvider = ReAuthenticateFamily();

/// See also [reAuthenticate].
class ReAuthenticateFamily extends Family<AsyncValue<Result>> {
  /// See also [reAuthenticate].
  const ReAuthenticateFamily();

  /// See also [reAuthenticate].
  ReAuthenticateProvider call({
    required String email,
    required String password,
  }) {
    return ReAuthenticateProvider(email: email, password: password);
  }

  @override
  ReAuthenticateProvider getProviderOverride(
    covariant ReAuthenticateProvider provider,
  ) {
    return call(email: provider.email, password: provider.password);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'reAuthenticateProvider';
}

/// See also [reAuthenticate].
class ReAuthenticateProvider extends AutoDisposeFutureProvider<Result> {
  /// See also [reAuthenticate].
  ReAuthenticateProvider({required String email, required String password})
    : this._internal(
        (ref) => reAuthenticate(
          ref as ReAuthenticateRef,
          email: email,
          password: password,
        ),
        from: reAuthenticateProvider,
        name: r'reAuthenticateProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$reAuthenticateHash,
        dependencies: ReAuthenticateFamily._dependencies,
        allTransitiveDependencies:
            ReAuthenticateFamily._allTransitiveDependencies,
        email: email,
        password: password,
      );

  ReAuthenticateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
    required this.password,
  }) : super.internal();

  final String email;
  final String password;

  @override
  Override overrideWith(
    FutureOr<Result> Function(ReAuthenticateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReAuthenticateProvider._internal(
        (ref) => create(ref as ReAuthenticateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Result> createElement() {
    return _ReAuthenticateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReAuthenticateProvider &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ReAuthenticateRef on AutoDisposeFutureProviderRef<Result> {
  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;
}

class _ReAuthenticateProviderElement
    extends AutoDisposeFutureProviderElement<Result>
    with ReAuthenticateRef {
  _ReAuthenticateProviderElement(super.provider);

  @override
  String get email => (origin as ReAuthenticateProvider).email;
  @override
  String get password => (origin as ReAuthenticateProvider).password;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
