import 'dart:convert';
import 'dart:io';

import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:http/http.dart' as http;
import 'package:models/models.dart';

class MessageApi {

  WebSocketChannel? _channel;

  void joinChat(String groupId) {
    _channel ??= WebSocketChannel.connect(
      Uri.parse('ws://localhost:8080/ws?groupId=$groupId'),
    );
  }
  
  bool get isChannelActive => _channel != null;

  Stream<String> get messages => _channel!.stream.cast<String>();

  void close() {
    _channel?.sink.close();
    _channel = null;
  }

}
