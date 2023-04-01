import 'dart:io';

import 'package:database/database.dart';

/// MockDatabase extends Database to override the init() method
/// to connect and initialize the test database.
///
/// use `--define` to pass database connection arguments.
class MockDatabase extends DatabaseConnection {
  /// Connect to local Sql Connection.
  /// Connection arguments are defined via `--define`

  Future<void> initialize() async {
    super.init(
      host: String.fromEnvironment("host"),
      port: int.parse(String.fromEnvironment("port")),
      userName: String.fromEnvironment("userName"),
      password: String.fromEnvironment("password"),
    );
  }

  /// Initialize the database using test_schema
  Future<void> initializeTable() async {
    final schema = await File('.\\test\\utils\\test_schema.sql').readAsString();
    await sqlConnection.execute(schema);
  }

  /// Drop the database that is created for test
  Future<void> dropDatabase() async {
    await sqlConnection.execute("drop database testDb");
    await sqlConnection.close();
  }
}
