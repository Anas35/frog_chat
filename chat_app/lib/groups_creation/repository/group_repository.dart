import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:models/models.dart';

class GroupRepository {

  static const String _url = "http://localhost:8080/group";

  Future<String> fetchGroupCode() async {
    final response = await http.get(Uri.parse('$_url/generate-id'));

    if (response.statusCode == 201) {
      return jsonDecode(response.body)['groupId'];
    } else {
      throw 'Failed to generate group code';
    }

  }

  Future<void> createGroup(Group group) async {
    final response = await http.post(
      Uri.parse('$_url/create'),
      body: jsonEncode(group.toJson()),
    );

    if (response.statusCode != 201) {
      throw 'Failed to create group';
    }

  }

  Future<void> joinGroup(Participants participants) async {
    final response = await http.post(
      Uri.parse('$_url/join'),
      body: jsonEncode(participants.toJson()),
    );

    if (response.statusCode != 201) {
      throw 'Failed to join group';
    }
  }

  Future<List<String>> getJoinedGroup(String userId) async {
    const String url = "http://localhost:8080/user/group-list";

    ///TODO Make this get
    final response = await http.post(
      Uri.parse(url),
      body: userId,
    );

    if (response.statusCode == 200) {
      final groups = jsonDecode(response.body) as List<dynamic>;
      return groups.map((e) => e as String).toList();
    } else {
      throw 'Failed to fetch groups';
    }
  } 
}