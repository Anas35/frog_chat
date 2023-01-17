import 'dart:convert';

import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:http/http.dart' as http;
import 'package:models/models.dart';

class ChatRepository {
  ChatRepository({required String groupId}) {
    _channel = _joinChat(groupId);
  }

  late WebSocketChannel _channel;

  final _url = 'http://localhost:8080/messages';

  WebSocketChannel _joinChat(String groupId) {
    return WebSocketChannel.connect(
      Uri.parse('ws://localhost:8080/ws?groupId=$groupId'),
    );
  }

  Future<MessageDetails> getMessage(String id) async {
    final response = await http.get(Uri.parse('$_url/$id'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, Object?>;
      return MessageDetails.fromJson(json);
    } else {
      throw response.body;
    }
  }

  Stream<String> get messages => _channel.stream.cast<String>();

  void close() => _channel.sink.close();

  Future<void> addMessage(Message message) async {
    final response = await http.post(
      Uri.parse('$_url/create'),
      body: jsonEncode(message.toJson()),
    );

    if (response.statusCode == 201) {
      _channel.sink.add(jsonDecode(response.body));
    } else {
      throw response.body;
    }
  }
}
