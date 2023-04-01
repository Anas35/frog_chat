import 'package:formz/formz.dart';

enum GroupIdValidationError {

  invalid('Group Id is Invalid'),
  length('Group Id length should be of length six'),
  nonNumber('Group Id must contain only number'),
  empty('Group Id should not be empty');

  final String message;

  const GroupIdValidationError(this.message);
}

class GroupId extends FormzInput<String, GroupIdValidationError> {
  const GroupId.pure() : super.pure('');

  const GroupId.dirty({required String groupId}) : super.dirty(groupId);

  @override
  GroupIdValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return GroupIdValidationError.empty;
    } else if (value.length != /*6*/4) {
      return GroupIdValidationError.length;
    } else if (int.tryParse(value) == null) {
      return GroupIdValidationError.nonNumber;
    }
    return null;
  }
}
