import 'dart:math';

import 'package:models/models.dart';
import 'package:mysql_client/mysql_client.dart';

class GroupQuery {
  final MySQLConnection sqlConnection;

  GroupQuery(this.sqlConnection);

  Future<String> createGroup(String groupName) async {
    final groupId = _generatedGroupId;
    await sqlConnection.execute(
      "insert into `groups`(groupId, groupName) values('$groupId', '$groupName')",
    );
    return groupId;
  }

  Future<void> joinGroup(String userId, String groupId) async {
    await sqlConnection.execute(
      "insert into participants(groupId, userId) values('$groupId', '$userId')",
    );
  }

  Future<Group> getGroup(String groupId) async {
    final group = await sqlConnection.execute("select * from `groups` where groupId = '$groupId'");
    return Group.fromJson(group.rows.first.assoc());
  }

  Future<List<Group>> getAllGroups(String userId) async {
    final groupList = await sqlConnection.execute('''
      SELECT * from `groups` join participants on `groups`.groupId = participants.groupId and participants.userId = '$userId'
    ''');

    final groups = groupList.rows.map((row) => Group.fromJson(row.assoc())).toList();
    return groups;
  }

  String get _generatedGroupId {
    return '${Random().nextInt(900000) + 100000}';
  }
}
