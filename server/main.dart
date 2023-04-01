import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';
import 'package:server/config/config.dart';

final _database = DatabaseConnection();

final sqlConnection = provider<MySQLConnection>(
  (_) => _database.sqlConnection,
);

Future<void> init(InternetAddress ip, int port) async {
  await _database.init(
    host: Config.HOST,
    port: Config.PORT,
    userName: Config.USERNAME,
    password: Config.PASSWORD,
  );
}

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  return serve(handler.use(sqlConnection), ip, port);
}
