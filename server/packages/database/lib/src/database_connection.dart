import 'dart:io';

import 'package:database/database.dart';
import 'package:mysql_client/exception.dart';

class DatabaseConnection {
  late final MySQLConnection? _sqlConnection;

  MySQLConnection get sqlConnection {
    if (_sqlConnection == null) {
      throw DatabaseException('Sql Connection has not been established');
    }
    return _sqlConnection!;
  }

  Future<void> init({
    required String host,
    required int port,
    required String userName,
    required String password,
  }) async {
    try {
      _sqlConnection = await MySQLConnection.createConnection(
        host: '127.0.0.1',
        port: port,
        userName: userName,
        password: password,
        databaseName: 'chats', // optional,
        secure: false,
      );

      await sqlConnection.connect();
    } on MySQLException catch (e) {
      print(e);
      throw DatabaseException(e.message);
    } on SocketException catch (e) {
      throw DatabaseException(e.message);
    } catch (e) {
      print(e);
      throw DatabaseException('Failed to connect Database');
    }
  }
}
