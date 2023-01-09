import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:models/models.dart';

import '../../custom_exception.dart';

class UserRepository {

  final String _url = "http://localhost:8080/user";

  Future<User> createUser(String userName) async {
    try {
      final response = await http.post(
        Uri.parse('$_url/create'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'name': userName}),
      );

      if (response.statusCode == 201) {
        final json = jsonDecode(response.body);
        return User.fromJson(json);
      } else {
        throw HttpRequestException(response.body);
      }
    } catch (e) {
      throw HttpRequestException("Post request for User Creaion failed");
    }
  }

  Future<User?> getUser(String userId) async {
    try {
      final response = await http.get(Uri.parse('$_url/$userId'));
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw HttpRequestException(response.body);
      }
    } catch (e) {
      throw HttpRequestException("Get request for User failed");
    }
  }
}
