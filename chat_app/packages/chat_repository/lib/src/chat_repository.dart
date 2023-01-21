import 'dart:convert';

import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:http/http.dart' as http;
import 'package:models/models.dart';

class ChatRepository {

  WebSocketChannel? _channel;

  static const _url = 'http://localhost:8080/messages';

  void joinChat(String groupId) {
    _channel ??= WebSocketChannel.connect(
      Uri.parse('ws://localhost:8080/ws?groupId=$groupId'),
    );
  }
  
  bool get isChannelActive => _channel != null;

  Future<MessageDetails> getMessage(String id) async {
    final response = await http.get(Uri.parse('$_url/$id'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, Object?>;
      return MessageDetails.fromJson(json);
    } else {
      throw response.body;
    }
  }

  Stream<String> get messages => _channel!.stream.cast<String>();

  void close() {
    _channel?.sink.close();
    _channel = null;
  }

  Future<void> addMessage(Message message) async {
    final response = await http.post(
      Uri.parse('$_url/create'),
      body: jsonEncode(message.toJson()),
    );

    if (response.statusCode == 201) {
      _channel?.sink.add(jsonDecode(response.body));
    } else {
      throw response.body;
    }
  }
}
