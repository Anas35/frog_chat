part of 'chat_bloc.dart';

abstract class ChatEvent  extends Equatable {
  const ChatEvent();
  
  @override
  List<Object?> get props => [];
}

class PreMessagesEvent extends ChatEvent {

  final String groupId;

  final String token;

  const PreMessagesEvent({required this.token, required this.groupId});

  @override
  List<Object?> get props => [groupId];
}

class _GetMessageEvent extends ChatEvent {

  final String messageId;

  final String token;

  const _GetMessageEvent({required this.token, required this.messageId});
  
  @override
  List<Object?> get props => [messageId];
}

class AddMessageEvent extends ChatEvent {

  final String message;

  final String userId;

  final String token;

  final String groupId;

  const AddMessageEvent({
    required this.token,
    required this.groupId,
    required this.userId,
    required this.message,
  });
  
  @override
  List<Object?> get props => [message, userId];
}