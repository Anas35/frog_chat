part of 'join_group_cubit.dart';

class JoinGroupState extends Equatable {
  
  const JoinGroupState({
    this.groupId = const GroupId.pure(),
    this.status = FormzStatus.pure,
    this.joinedGroup,
  });

  final GroupId groupId;
  final FormzStatus status;
  final Group? joinedGroup;

  @override
  List<Object?> get props => [groupId, status, joinedGroup];

  JoinGroupState copyWith({
    GroupId? groupId,
    FormzStatus? status,
    Group? joinedGroup,
  }) {
    return JoinGroupState(
      groupId: groupId ?? this.groupId,
      status: status ?? this.status,
      joinedGroup: joinedGroup ?? this.joinedGroup,
    );
  }
}
