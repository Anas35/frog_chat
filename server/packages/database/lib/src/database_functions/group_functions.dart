import 'dart:math';

import 'package:database/database.dart';
import 'package:database/src/sql_connection.dart';
import 'package:models/models.dart';

mixin GroupFunction on SqlConnection {

  Future<List<MessageDetails>> getGroupMessages(String groupId) async {
    return DatabaseException.wrapper<List<MessageDetails>>(
      body: () async {
        final messages = await sqlConnection.execute("SELECT hex(`user`.`id`) as id, `user`.name as name, message from `user` join messages on messages.groupId = '$groupId'");
        final list = messages.rows.map((row) {
          return MessageDetails(user: User.fromJson(row.assoc()), message: row.assoc()['message']!);
        }).toList();
        return list;
      },
      message: "Couldn't fetch Group Messages",
    );
  }

  Future<Group> joinGroup(Participants participants) async {
    return DatabaseException.wrapper<Group>(
      body: () async {
        await sqlConnection.execute(
          "insert into participants(groupId, userId) values(:groupId, unhex(:userId))",
          participants.toJson(),
        );

        final group = await sqlConnection.execute("select * from `group` where groupId = '${participants.groupId}'");
        return Group.fromJson(group.rows.first.assoc());
      },
      message: "Failed to join Group",
    );
  }

  Future<Group> createGroup(String groupName) async {
    return DatabaseException.wrapper<Group>(
      body: () async {
        final groupId = _generatedGroupId;
        await sqlConnection.execute(
          "insert into `group`(groupId, groupName) values('$groupId', '$groupName')",
        );
        return Group(groupId: groupId, groupName: groupName);
      },
      message: 'Couldn\'t create group',
    );
  }
  
  String get _generatedGroupId {
    return '${Random().nextInt(900000) + 100000}';
  }

}