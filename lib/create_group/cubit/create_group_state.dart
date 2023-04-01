part of 'create_group_cubit.dart';

enum CreateGroupStatus {
  initial,
  loading,
  success,
  failed,
}

class CreateGroupState extends Equatable {
  const CreateGroupState({
    this.groupName = '',
    this.status = CreateGroupStatus.initial,
  });

  final String groupName;
  final CreateGroupStatus status;

  @override
  List<Object> get props => [groupName, status];

  CreateGroupState copyWith({
    String? groupName,
    CreateGroupStatus? status,
  }) {
    return CreateGroupState(
      groupName: groupName ?? this.groupName,
      status: status ?? this.status,
    );
  }
}

class CreateGroupInitial extends CreateGroupState {
  const CreateGroupInitial() : super();
}
