import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'password_input_provider.g.dart';

@riverpod
class PasswordInputNotifier extends _$PasswordInputNotifier {
  @override
  String build() => '';

  void update(String value) => state = value;
}
