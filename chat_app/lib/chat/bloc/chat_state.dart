part of 'chat_bloc.dart';

enum ChatStatus {
  initial,
  loading,
  loaded,
  failed,
}

class ChatState extends Equatable {
  
  const ChatState({
    this.chatStatus = ChatStatus.initial,
    this.messages = const [],
    this.errorMessage = '',
  });

  final ChatStatus chatStatus;
  final List<MessageDetails> messages;
  final String errorMessage;

  @override
  List<Object> get props => [chatStatus, messages, errorMessage];

  /// Creates a copy of the current ChatState with property changes
  ChatState copyWith({
    ChatStatus? chatStatus,
    List<MessageDetails>? messages,
    String? errorMessage,
  }) {
    return ChatState(
      chatStatus: chatStatus ?? this.chatStatus,
      messages: messages ?? this.messages,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
