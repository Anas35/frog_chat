import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepository {

  final String _url = "http://localhost:8080";

  final String _key = '__user__';

  User? _user;

  Future<User> addUser(String userName) async {
    final response = await http.post(
      Uri.parse('$_url/user'), 
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({'name': userName}),
    );

    if(response.statusCode == 201) {
      final json = jsonDecode(response.body);
      _user = User.fromJson(json);

      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString(_key, _user!.id);
      
      return _user!;
    } else {
      throw response.body;
    }

  }

  Future<User?> getUser() async {
    if(_user != null) return _user;

    final sharedPreferences = await SharedPreferences.getInstance();
    final id = sharedPreferences.getString(_key);

    if(id != null) {
      final response = await http.get(Uri.parse('$_url/user/$id'));
      if(response.statusCode == 200) {
        _user = User.fromJson(jsonDecode(response.body));
      }
    }

    return _user;
  }

  Future<void> removeUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(_key);
    _user = null;
  }

  String? get userId => _user?.id;
}