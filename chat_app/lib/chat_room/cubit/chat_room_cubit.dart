import 'dart:async';
import 'dart:convert';

import 'package:chat_app/chat_room/repository/chat_room_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

class ChatRoomCubit extends Cubit<List<Message>> {

  ChatRoomCubit() : super([]);

  StreamSubscription? streamSubscription;

  final _chatRoomRepository = ChatRoomRepository();

  void subcribeAndListen(String groupId, String userId) {
    _chatRoomRepository.joinChat(groupId, userId);

    streamSubscription = _chatRoomRepository.messages?.listen((event) async {
      final message = await _chatRoomRepository.getMessage(jsonDecode(event).toString());
      emit(List.of(state)..add(message));
    });
  }

  void sendMessage(Message message) => _chatRoomRepository.addMessage(message);

  void closeChat() {
    emit([]);
    _chatRoomRepository.closes();
  }

}