import 'dart:async';

import 'package:dotenv/dotenv.dart';
import 'package:mysql_client/exception.dart';
import 'package:mysql_client/mysql_client.dart';

class DatabaseException implements Exception {
  final String message;

  const DatabaseException(this.message);

  static Future<T> wrapper<T>({required Future<T> Function() body, required String message}) async {
    try {
      final result = await body();
      return result;
    } on MySQLException catch (e) {
      throw DatabaseException(e.message);
    } catch (e) {
      throw DatabaseException('$message, Error: $e');
    }
  }
}

class DatabaseConnection {
  final MySQLConnection sqlConnection;

  DatabaseConnection._init(this.sqlConnection);

  static Future<DatabaseConnection> init() async {

    final env = DotEnv()..load();

    final connection = await MySQLConnection.createConnection(
      host: '127.0.0.1',
      port: 3306,
      userName: env['userName']!,
      password: env['password']!,
      databaseName: 'funky', // optional,
      secure: false,
    );

    try {
      await connection.connect();
    } on MySQLException catch (e) {
      throw DatabaseException(e.message);
    } catch (e) {
      throw DatabaseException('Something went wrong');
    }

    return DatabaseConnection._init(connection);
  }

}
