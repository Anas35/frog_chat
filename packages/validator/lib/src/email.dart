import 'package:formz/formz.dart';

enum EmailValidationError { 
  invalid('Please enter a correct email'), 
  empty('Email should not be empty');

  final String message;

  const EmailValidationError(this.message);
}

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');

  const Email.dirty({String value = ''}) : super.dirty(value);

  @override
  EmailValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : EmailValidationError.empty;
  }
}
