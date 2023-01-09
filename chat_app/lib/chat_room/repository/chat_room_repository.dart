import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:models/models.dart';

class ChatRoomRepository {
  WebSocketChannel? _channel;

  final _url = "http://localhost:8080/messages";

  void joinChat(String groupId, String userId) {
    _channel = WebSocketChannel.connect(
        Uri.parse('ws://localhost:8080/ws?userId=$userId&groupId=$groupId'));
  }

  Future<Message> getMessage(String id) async {
    try {
      final response = await http.get(Uri.parse("$_url/$id"));

      if (response.statusCode == 200) {
        return Message.fromJson(jsonDecode(response.body));
      }
      throw response.statusCode;
    } catch (e) {
      print(e);
      throw "Failed to fetch";
    }
  }

  Stream? get messages => _channel?.stream;

  void closes() => _channel?.sink.close();

  Future<void> addMessage(Message message) async {
    try {
      final response = await http.post(
        Uri.parse('$_url/add'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(message.toJson()),
      );

      if (response.statusCode == 201) {
        _channel?.sink.add(response.body);
      } else {
        throw response.statusCode;
      }
    } catch (e) {
      print(e);
    }
  }
}
