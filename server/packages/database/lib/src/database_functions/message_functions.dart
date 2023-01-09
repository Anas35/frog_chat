import 'package:database/database.dart';
import 'package:database/src/database_functions/database_functions.dart';
import 'package:mysql_client/mysql_client.dart';

class MessageFunction implements DatabaseFunction {
  final MySQLConnection sqlConnection;

  MessageFunction(this.sqlConnection);

  @override
  Future<IResultSet> get(String id) async {
    return DatabaseException.wrapper<IResultSet>(
      body: () async {
        return await sqlConnection.execute(
          "select id, groupId, hex(userId) as userId, message from messages where id = '$id'",
        );
      },
      message: 'Couldn\'t fetch message',
    );
  }

  @override
  Future<IResultSet> insert(Map<String, Object?> json) async {
    return DatabaseException.wrapper<IResultSet>(
      body: () async {
        await sqlConnection.execute(
          'insert into messages(groupId, userId, message) values(:groupId, unhex(:userId), :message)',
          json,
        );
        return await fetchId(json['groupId']! as String);
      },
      message: 'Couldn\'t save message to database',
    );
  }

  Future<IResultSet> fetchId(String groupId) async {
    return DatabaseException.wrapper<IResultSet>(
      body: () async {
        return await sqlConnection.execute(
          "select id from messages where groupId = '$groupId' order by id desc LIMIT 1",
        );
      },
      message: 'Couldn\'t fetch message',
    );
  }

  Future<IResultSet> fetchAll(String groupId) async {
    return DatabaseException.wrapper<IResultSet>(
      body: () async {
        return await sqlConnection.execute(
          "select id from messages where groupId = '$groupId'",
        );
      },
      message: 'Couldn\'t fetch message',
    );
  }
}
