import 'package:lostanimal/model/auth_error_model.dart';

class Result {
  final bool isValid;
  final String? errorMessage;
  final AuthError? code;

  Result({ required this.isValid, this.errorMessage, this.code });

  bool get success => isValid;

  factory Result.success() => Result(isValid: true);

  factory Result.failure(String message, {AuthError? code}) {
    return Result(isValid: false, errorMessage: message, code: code);
  }

  factory Result.info(String message) =>
      Result(isValid: true, errorMessage: message);
}
