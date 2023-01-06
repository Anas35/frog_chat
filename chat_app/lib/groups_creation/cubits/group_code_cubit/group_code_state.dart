part of 'group_code_cubit.dart';

class GroupCodeState extends Equatable {

  final Status status;

  final String? groupCode;

  final String? message;

  const GroupCodeState({this.message, this.groupCode, this.status = Status.initial});

  GroupCodeState copyWith({
    Status? createStatus,
    String? groupCode,
    String? message
  }) {
    return GroupCodeState(
      status: createStatus ?? this.status,
      groupCode: groupCode ?? this.groupCode,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, groupCode, message];
}
