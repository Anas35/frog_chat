part of 'group_bloc.dart';

abstract class GroupEvent extends Equatable {
  const GroupEvent();
}

class GroupInputEvent extends GroupEvent {

  final String groupInput;

  const GroupInputEvent({required this.groupInput});

  @override
  List<Object?> get props => [groupInput];

}

class CreateGroupEvent extends GroupEvent {

  final String groupName;

  final String userId;

  const CreateGroupEvent({required this.groupName, required this.userId});

  @override
  List<Object?> get props => [groupName, userId];

}

class JoinGroupEvent extends GroupEvent {

  final Participants participant;

  const JoinGroupEvent({required this.participant});

  @override
  List<Object?> get props => [participant];

}

class GroupMessagesEvent extends GroupEvent {

  final List<MessageDetails> messages;

  const GroupMessagesEvent({required this.messages});

  @override
  List<Object?> get props => [messages];

}