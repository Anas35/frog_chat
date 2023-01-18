part of 'chat_bloc.dart';

abstract class ChatEvent  extends Equatable {
  const ChatEvent();
  
  @override
  List<Object?> get props => [];
}

class PreMessagesEvent extends ChatEvent {}

class _GetMessageEvent extends ChatEvent {

  final String messageId;

  const _GetMessageEvent({required this.messageId});
  
  @override
  List<Object?> get props => [messageId];
}

class AddMessageEvent extends ChatEvent {

  final String message;

  final String userId;

  const AddMessageEvent({required this.userId, required this.message});
  
  @override
  List<Object?> get props => [message, userId];
}