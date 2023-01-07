import 'package:database/src/database_connection.dart';
import 'package:database/src/database_functions/database_functions.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:uuid/uuid.dart';

class UserFunction extends DatabaseFunction {

  UserFunction(this.sqlConnection);

  final MySQLConnection sqlConnection;

  Future<IResultSet> getGroupList(String id) {
    return DatabaseException.wrapper(
      body: () async {
        final groupList = await sqlConnection.execute("select groupId from `participants` where userId = unhex('$id')");
        return groupList;
      },
      message: 'Couldn\'t fetch group list',
    );
  }

  @override
  Future<IResultSet> get(String id) async {
    return DatabaseException.wrapper<IResultSet>(
      body: () async {
        final user = await sqlConnection.execute("select name, hex(id) as id from `user` where id = unhex('$id')");
        return user;
      },
      message: 'Couldn\'t fetch user',
    );
  }

  @override
  Future<IResultSet> insert(Map<String, Object?> json) {
    return DatabaseException.wrapper<IResultSet>(
      body: () async {
        final name = json['name'];
        final user = await sqlConnection.execute("select name from `user` where name = '$name'");

        if (user.rows.isNotEmpty) {
          throw DatabaseException('UserName already exist');
        }

        final id = Uuid().v4();

        await sqlConnection.execute("insert into `user`(id, name) values(UNHEX(REPLACE('$id', '-', '')), '$name')");

        return await get(id.replaceAll('-', ''));
      },
      message: 'Couldn\'t create user',
    );
  }

}