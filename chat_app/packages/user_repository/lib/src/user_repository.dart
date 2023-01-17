import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:models/models.dart';
import 'package:user_repository/user_repository.dart';

class UserRepository {
  final String _url_ = 'http://localhost:8080/user';

  Future<User> createUser(String userName) async {
    final response = await http.post(
      Uri.parse('$_url_/create'),
      body: jsonEncode(userName),
    );

    if (response.statusCode == 201) {
      final json = jsonDecode(response.body) as Map<String, Object?>;
      return User.fromJson(json);
    } else {
      throw UserException(response.body);
    }
  }

  Future<User> getUser(String userId) async {
    final response = await http.get(Uri.parse('$_url_/$userId'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, Object?>;
      return User.fromJson(json);
    } else {
      throw UserException(response.body);
    }
  }

  Future<List<Group>> getGroup(String userId) async {
    final response = await http.get(Uri.parse('$_url_/$userId/groups'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List<Map<String, Object?>>;
      final groups = json.map(Group.fromJson).toList();
      return groups;
    } else {
      throw UserException(response.body);
    }
  }
}
