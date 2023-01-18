import 'package:database/database.dart';
import 'package:models/models.dart';
import 'package:database/src/sql_connection.dart';
import 'package:uuid/uuid.dart';

mixin UserFunction on SqlConnection {

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

  Future<User> getUser(String id) async {
    return DatabaseException.wrapper<User>(
      body: () async {
        final user = await sqlConnection.execute("select name, hex(id) as id from `user` where id = unhex('$id')");
        final groups = await getGroups(id);

        if (user.rows.isEmpty) {
          throw 'No User exist';
        }

        final userI = User.fromJson(user.rows.first.assoc()).copyWith(groups: groups);

        return userI;
      },
      message: 'Failed to fetch user',
    );
  }

  Future<User> createUser(String name) {
    return DatabaseException.wrapper<User>(
      body: () async {
        final user = await sqlConnection.execute("select name from `user` where name = '$name'");

        if (user.rows.isNotEmpty) {
          throw 'UserName already exist';
        }

        final id = Uuid().v4().replaceAll('-', '');

        await sqlConnection.execute("insert into `user`(id, name) values(UNHEX('$id'), '$name')");

        return User(id: id, name: name);
      },
      message: 'Failed to create user',
    );
  }

}