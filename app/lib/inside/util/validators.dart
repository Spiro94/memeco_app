import 'package:email_validator/email_validator.dart';

class InsideUtil_Validators {
  static bool isEmailValid(String value) {
    return EmailValidator.validate(value);
  }

  /// Username must be at least 3 characters long and can only contain letters,
  /// numbers, and underscores
  static bool isUsernameValid(String value) {
    return RegExp(r'^[a-zA-Z0-9_]{3,}$').hasMatch(value);
  }

  /// https: //stackoverflow.com/questions/68226712/how-to-check-if-string-contains-both-uppercase-and-lowercase-characters
  static bool isPasswordValid(String password) =>
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
          .hasMatch(password);
}
