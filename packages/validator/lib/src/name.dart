import 'package:formz/formz.dart';

enum NameValidationError {
  
  empty('Name should not be empty');

  final String message;

  const NameValidationError(this.message);
}

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');

  const Name.dirty({String value = ''}) : super.dirty(value);

  @override
  NameValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : NameValidationError.empty;
  }
}
