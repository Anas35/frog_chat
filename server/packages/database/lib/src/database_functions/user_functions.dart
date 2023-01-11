import 'package:database/src/database_connection.dart';
import 'package:models/models.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:uuid/uuid.dart';

class UserFunction {

  const UserFunction({required this.sqlConnection});

  final MySQLConnection sqlConnection;

  Future<List<Group>> getGroups(String userId) {
    return DatabaseException.wrapper(
      body: () async {
        final groupList = await sqlConnection.execute('''
          SELECT `group`.groupId, `group`.groupName from `group` 
          join participants on `group`.groupId = participants.groupId and participants.userId = unhex('$userId')
        ''');

        final groups = groupList.rows.map((row) => Group.fromJson(row.assoc())).toList();
        return groups;
      },
      message: 'Couldn\'t fetch group list',
    );
  }

  Future<User?> getUser(String id) async {
    return DatabaseException.wrapper<User?>(
      body: () async {
        final user = await sqlConnection.execute("select name, hex(id) as id from `user` where id = unhex('$id')");

        if (user.rows.isNotEmpty) {
          return User.fromJson(user.rows.first.assoc());
        }

        return null;
      },
      message: 'Couldn\'t fetch user',
    );
  }

  Future<User> createUser(String name) {
    return DatabaseException.wrapper<User>(
      body: () async {
        final user = await sqlConnection.execute("select name from `user` where name = '$name'");

        if (user.rows.isNotEmpty) {
          throw DatabaseException('UserName already exist');
        }

        final id = Uuid().v4().replaceAll('-', '');

        await sqlConnection.execute("insert into `user`(id, name) values(UNHEX('$id'), '$name')");

        return User(id: id, name: name);
      },
      message: 'Couldn\'t create user',
    );
  }

}