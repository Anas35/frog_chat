import 'package:database/database.dart';
import 'package:database/src/database_functions/database_functions.dart';
import 'package:mysql_client/mysql_client.dart';

class MessageFunction implements DatabaseFunction {

  final MySQLConnection sqlConnection;

  MessageFunction(this.sqlConnection);

  @override
  Future<IResultSet> get(String id) async => throw UnimplementedError('Use fetchMessage()');

  @override
  Future<IResultSet> insert(Map<String, Object?> json) async {
    return DatabaseException.wrapper<IResultSet>(
      body: () async {
        return await sqlConnection.execute(
            'insert into message(groupId, userId, message) values(:groupId, unhex(:userId), :message)', 
            json,
          );
        }, 
      message: 'Couldn\'t save message to database',
    );
  }

  Future<IResultSet> fetchMessage(Map<String, Object?> json) async {
    return DatabaseException.wrapper<IResultSet>(
      body: () async {
        return await sqlConnection.execute(
          "select id, hex(userId) as userId, groupId, message from message where userId = unhex(':userId') and groupId = ':groupId'",
          json
        );
      },
      message: 'Couldn\'t fetch message',
    );
  }

}