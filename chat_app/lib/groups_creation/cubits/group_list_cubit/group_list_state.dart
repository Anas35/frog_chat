part of 'group_list_cubit.dart';

class GroupListState extends Equatable {

  final Status status;

  final String? message;

  final List<String> groupList;

  const GroupListState({this.groupList = const [], this.message, this.status = Status.initial});

  GroupListState copyWith({
    Status? status,
    String? message,
     List<String>? groupList,
  }) {
    return GroupListState(
      status: status ?? this.status,
      message: message ?? this.message,
      groupList: groupList ?? this.groupList,
    );
  }

  @override
  List<Object?> get props => [status, message, groupList];
}
