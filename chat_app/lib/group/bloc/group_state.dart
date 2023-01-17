part of 'group_bloc.dart';

abstract class GroupState extends Equatable {

  const GroupState();
  
  @override
  List<Object> get props => [];

}

class GroupStateInitial extends GroupState {

  final String groupInput;

  const GroupStateInitial({
    this.groupInput = '',
  });

  GroupStateInitial copyWith({
    String? groupInput
  }) {
    return GroupStateInitial(
      groupInput: groupInput ?? this.groupInput,
    );
  }

  @override
  List<Object> get props => [groupInput];

}

class GroupStateLoading extends GroupState {} 

class GroupStateSuccess extends GroupState {

  final Group group;

  const GroupStateSuccess({
    required this.group,
  });

  GroupStateSuccess copyWith({
    Group? group,
  }) {
    return GroupStateSuccess(
      group: group ?? this.group,
    );
  }

  @override
  List<Object> get props => [group];

}

class GroupStateError extends GroupState {

  final String message;

  const GroupStateError({
    required this.message,
  });

  GroupStateError copyWith({
    String? message,
  }) {
    return GroupStateError(
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [message];

}