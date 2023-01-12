import 'dart:math';

import 'package:database/database.dart';
import 'package:models/models.dart';

mixin GroupFunction on SqlConnection {

  Future<List<dynamic>> getGroupMessages(String groupId) async {
    return DatabaseException.wrapper<List<dynamic>>(
      body: () async {
        final messages = await sqlConnection.execute("SELECT hex(`user`.`id`), `user`.name, message from `user` join messages on messages.groupId = '$groupId'");
        final list = messages.rows.map((row) => row.assoc()).toList();
        return list;
      },
      message: "Couldn't fetch Group Messages",
    );
  }

  Future<void> joinGroup(Participants participants) async {
    return DatabaseException.wrapper<void>(
      body: () async {
        await sqlConnection.execute(
          "insert into participants(groupId, userId) values(:groupId, unhex(:userId))",
          participants.toJson(),
        );
      },
      message: "Couldn't fetch Group",
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