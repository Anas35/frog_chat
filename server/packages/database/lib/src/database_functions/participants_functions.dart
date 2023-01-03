import 'package:database/src/database_connection.dart';
import 'package:database/src/database_functions/database_functions.dart';
import 'package:mysql_client/mysql_client.dart';

class ParticipantsFunction extends DatabaseFunction {

  ParticipantsFunction(this.sqlConnection);

  final MySQLConnection sqlConnection;

  @override
  Future<IResultSet> get(String id) async {
    return DatabaseException.wrapper<IResultSet>(
      body: () async {
        final user = await sqlConnection.execute("select id, groupId, hex(userId) as id from `participants` where userId = unhex('$id')");
        return user;
      },
      message: 'Couldn\'t fetch user participanted group',
    );
  }

  @override
  Future<IResultSet> insert(Map<String, Object?> json) {
    return DatabaseException.wrapper<IResultSet>(
      body: () async {
        return await sqlConnection.execute(
          'insert into participants(groupId, groupName, userId) values(:groupId, :groupName, hex(:userId))',
          json,
        );
      }, 
      message: 'Couldn\'t join group',
    );
  }

}