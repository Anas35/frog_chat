import 'dart:async';

import 'package:api_wrapper/api_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:models/models.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  
  ChatBloc({required this.api}) :
  super(const ChatState()) {
    on<PreMessagesEvent>(_onPreMessagesEvent);
    on<AddMessageEvent>(_onAddMessageEvent);
    on<_GetMessageEvent>(_onGetMessageEvent);
  }

  final ApiWrapper api;
  StreamSubscription? _streamSubscription;

  Future<void> _onPreMessagesEvent(
    PreMessagesEvent event,
    Emitter<ChatState> emit,
  ) async {
    try {
      emit(state.copyWith(chatStatus: ChatStatus.loading));

      if(api.isChannelActive) {
        _streamSubscription?.cancel();
        api.close();
      }
      
      api.joinChat(event.groupId);
      final messages = await api.getAllMessage(event.groupId, event.token);

      emit(
        state.copyWith(
          chatStatus: ChatStatus.loaded, 
          messages: List.from(messages),
        ),
      );

      _streamSubscription = api.messages.listen((id) {
        print('hello');
        add(_GetMessageEvent(messageId: id, token: event.token));
      });

    } on ApiException catch (e) {
      emit(state.copyWith(
        chatStatus: ChatStatus.failed,
        errorMessage: e.message,
      ));
    } catch (e, stck) {
      print(stck);
      emit(state.copyWith(
        chatStatus: ChatStatus.failed,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onGetMessageEvent(
    _GetMessageEvent event,
    Emitter<ChatState> emit,
  ) async {
    try {

      final messageIds = state.messages.map((message) => message.messageId).toList();

      if (!messageIds.contains(event.messageId)) {
        final message = await api.fetchMessage(event.messageId, event.token);
        emit(
          state.copyWith(
            chatStatus: ChatStatus.loaded, messages: List.from(state.messages)..add(message),
          ),
        );
      }

    } catch (e) {
      print(e);
      emit(state.copyWith(
        errorMessage: e.toString(),
      ));
    }
  }

  FutureOr<void> _onAddMessageEvent(
    AddMessageEvent event,
    Emitter<ChatState> emit,
  ) async {
    try {
      final message = Message(
        groupId: event.groupId,
        userId: event.userId,
        message: event.message,
      );
      await api.createMessage(message, event.token);
    } catch (e) {
      emit(state.copyWith(
        chatStatus: ChatStatus.failed,
        errorMessage: e.toString(),
      ));
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    api.close();
    return super.close();
  }
}
