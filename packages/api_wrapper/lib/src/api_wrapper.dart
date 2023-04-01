import 'dart:convert';
import 'dart:io';

import 'package:api_wrapper/api_wrapper.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:http/http.dart' as http;
import 'package:models/models.dart';

class ApiWrapper {

  final String baseUrl = 'http://localhost:8080';

  Map<String, String> headers(String token) {
    return {
      HttpHeaders.authorizationHeader: 'Bearer $token',
      HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
    };
  }

  Future<String> register(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      body: user.toJson(),
    );
    
    if (response.statusCode == HttpStatus.created) {
      return response.body;
    } else {
      throw ApiException(response.body);
    }
  }

  Future<String> logIn(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: user.toJson(),
    );
    if (response.statusCode == HttpStatus.created) {
      return response.body;
    } else {
      throw ApiException(response.body);
    }
  }

  Future<User> fetchUser(String userId, String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/$userId'),
      headers: headers(token),
    );
    if (response.statusCode == HttpStatus.ok) {
      final body = jsonDecode(response.body) as Map<String, Object?>;
      return User.fromJson(body);
    } else {
      throw ApiException(response.body);
    }
  }

  Future<String> createGroup(String userId, String groupName, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users/$userId/groups'),
      body: groupName,
      headers: headers(token),
    );
    if (response.statusCode == HttpStatus.created) {
      return response.body;
    } else {
      throw ApiException(response.body);
    }
  }

  Future<String> joinGroup(String userId, String groupId, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users/$userId/groups/$groupId/join'),
      headers: headers(token),
    );
    if (response.statusCode == HttpStatus.ok) {
      return response.body;
    } else {
      throw ApiException(response.body);
    }
  }

  Future<List<Group>> getAllGroups(String userId, String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/$userId/groups'),
      headers: headers(token),
    );
    if (response.statusCode == HttpStatus.ok) {
      final body = jsonDecode(response.body) as List<dynamic>;
      final castBody = body.cast<Map<String, dynamic>>();
      return castBody.map(Group.fromJson).toList();
    } else {
      throw ApiException(response.body);
    }
  }

  Future<MessageDetails> fetchMessage(String messageId, String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/messages/$messageId'),
      headers: headers(token),
    );
    if (response.statusCode == HttpStatus.ok) {
      final body = jsonDecode(response.body) as Map<String, Object?>;
      return MessageDetails.fromJson(body);
    } else {
      throw ApiException(response.body);
    }
  }

  Future<List<MessageDetails>> getAllMessage(String groupId, String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/messages?groupId=$groupId'),
      headers: headers(token),
    );
    if (response.statusCode == HttpStatus.ok) {
      final body = jsonDecode(response.body) as List<dynamic>;
      final castBody = body.cast<Map<String, dynamic>>();
      return castBody.map(MessageDetails.fromJson).toList();
    } else {
      throw ApiException(response.body);
    }
  }

  WebSocketChannel? _channel;

  void joinChat(String groupId) {
    _channel ??= WebSocketChannel.connect(
      Uri.parse('ws://localhost:8080/ws?groupId=$groupId'),
    );
  }

  Future<String> createMessage(Message message, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/messages'),
      body: message.toJson(),
      headers: headers(token),
    );

    if (response.statusCode == 201) {
      _channel?.sink.add(jsonDecode(response.body));
      return response.body;
    } else {
      throw ApiException(response.body);
    }
  }
  
  bool get isChannelActive => _channel != null;

  Stream<String> get messages => _channel!.stream.cast<String>();

  void close() {
    _channel?.sink.close();
    _channel = null;
  }

}
