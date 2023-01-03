import 'dart:math';

import 'package:database/database.dart';
import 'package:database/src/database_functions/database_functions.dart';
import 'package:mysql_client/mysql_client.dart';

class GroupFunction implements DatabaseFunction {

  final MySQLConnection sqlConnection;

  GroupFunction(this.sqlConnection);

  @override
  Future<IResultSet> get(String id) async {
    return DatabaseException.wrapper<IResultSet>(
      body: () async {
        final user = await sqlConnection.execute("select * from `group` where groupId = '$id'");
        return user;
      },
      message: "Couldn't fetch Group Details",
    );
  }

  @override
  Future<IResultSet> insert(Map<String, Object?> json) async {
    return DatabaseException.wrapper<IResultSet>(
      body: () async {
        return await sqlConnection.execute(
          'insert into `group`(groupId, groupName) values(:groupId, :groupName)',
          json,
        );
      },
      message: 'Couldn\'t create group',
    );
  }

  
  Future<String> generateGroupCode() async {
    final random = Random();
    while (true) {
      final id = '${random.nextInt(9000) + 1000}';
      final condition = await get(id);

      if (condition.rows.isEmpty) {
        return id;
      }
    }
  }


}