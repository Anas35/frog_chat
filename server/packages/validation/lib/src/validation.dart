import 'package:email_validator/email_validator.dart';
import 'package:models/models.dart';
import 'package:validation/src/validation_exception.dart';

class Validation {
  
  static void validateRegister(User user) {
    if (!EmailValidator.validate(user.email)) {
      throw ValidationException('Enter a valid email address');
    } else if (user.name.isEmpty) {
      throw ValidationException('UserName should not be empty');
    } else {
      _validatePassword(user.password);
    }
  }

  static void validateLogIn(User user) {
    if (!EmailValidator.validate(user.email)) {
      throw ValidationException('Enter a valid email address');
    } else {
      _validatePassword(user.password);
    }
  }
  
  static void _validatePassword(String password) {
    if (password.contains(' ')) {
      throw ValidationException('Password must not contain space');
    } else if (password.length < 8) {
      throw ValidationException('Password should be minimum of length 8');
    }
  }

}