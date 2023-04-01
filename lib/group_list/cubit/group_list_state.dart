part of 'group_list_cubit.dart';

enum GroupListStatus {
  initial,
  loading,
  success,
  failed,
}

class GroupListState extends Equatable {
  const GroupListState({
    this.status = GroupListStatus.initial,
    this.groups = const [],
    this.errorMessage = '',
  });

  final GroupListStatus status;

  final List<Group> groups;

  final String errorMessage;

  GroupListState copyWith({
    GroupListStatus? status,
    List<Group>? groups,
    String? errorMessage,
  }) {
    return GroupListState(
      status: status ?? this.status,
      groups: groups ?? this.groups,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, groups, errorMessage];
}
