import 'package:formz/formz.dart';

enum PasswordValidationError {
  
  empty('Password should not be empty');

  final String message;

  const PasswordValidationError(this.message);
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty({String value = ''}) : super.dirty(value);

  @override
  PasswordValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : PasswordValidationError.empty;
  }
}
