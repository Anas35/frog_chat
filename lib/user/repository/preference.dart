import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Preference {

  final SharedPreferences sharedPreferences;

  static const String key = '__token__';

  Preference({required this.sharedPreferences});

  String? getToken() {
    return sharedPreferences.getString(key);
  }

  String fetchUserId(String token) {
    String splited = token.split('.')[1];
    int len = splited.length % 4;
    if (len != 0) {
      splited += '=' * (4 - len);
    }
    final data = utf8.decode(base64Decode(splited));
    final json = jsonDecode(data);
    return json['id'];
  }

  Future<bool> setToken(String token) async {
    token = jsonDecode(token);
    return sharedPreferences.setString(key, token);
  }

}