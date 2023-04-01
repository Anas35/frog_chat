part of 'join_group_cubit.dart';

class JoinGroupState extends Equatable {
  
  const JoinGroupState({
    this.groupId = const GroupId.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  final GroupId groupId;
  final FormzSubmissionStatus status;

  @override
  List<Object?> get props => [groupId, status];

  JoinGroupState copyWith({
    GroupId? groupId,
    FormzSubmissionStatus? status
  }) {
    return JoinGroupState(
      groupId: groupId ?? this.groupId,
      status: status ?? this.status
    );
  }
}
