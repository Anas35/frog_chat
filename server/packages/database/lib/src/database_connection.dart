import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:database/src/database_functions/database_functions.dart';
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
      throw DatabaseException(message);
    }
  }
}

class DatabaseConnection extends SqlConnection with UserFunction, GroupFunction, MessageFunction {}

class SqlConnection {

  late final MySQLConnection sqlConnection;

  Future<void> init() async {
    try {
      final env = DotEnv()..load();

      final connection = await MySQLConnection.createConnection(
        host: '127.0.0.1',
        port: 3306,
        userName: env['userName']!,
        password: env['password']!,
        databaseName: 'funky', // optional,
        secure: false,
      );

      await connection.connect();
    } on MySQLException catch (e) {
      throw DatabaseException(e.message);
    } on SocketException catch (e) {
      throw DatabaseException(e.message);
    } catch (e) {
      log(e.toString());
      throw DatabaseException('Failed to connect Database');
    }
  }

}
