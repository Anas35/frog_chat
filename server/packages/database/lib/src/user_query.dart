import 'package:database/src/database_exception.dart';
import 'package:models/models.dart';
import 'package:mysql_client/mysql_client.dart';

class UserQuery {

  final MySQLConnection sqlConnection;

  UserQuery(this.sqlConnection);

  Future<String> insertUser(User user) async {
    final response = await sqlConnection.execute("select * from `users` where email = '${user.email}'");

    if (response.rows.isNotEmpty) {
      throw DatabaseException('Email already exists');
    }

    final result = await sqlConnection.execute("insert into `users`(name, email, password) value(:name, :email, :password)", user.toJson());
    return result.lastInsertID.toString();
  }

  Future<User> fetchUser(String email) async {
    final response = await sqlConnection.execute("select * from `users` where email = '$email'");

    if (response.rows.isEmpty) {
      throw DatabaseException('Email does not exists');
    }

    return User.fromJson(response.rows.first.assoc());
  }
}
