import 'dart:developer';
import 'dart:io';

import 'package:database/database.dart';
import 'package:dotenv/dotenv.dart';
import 'package:mysql_client/exception.dart';
import 'package:mysql_client/mysql_client.dart';

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
