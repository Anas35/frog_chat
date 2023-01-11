import 'dart:developer';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';

final _database = DatabaseConnection();

final databaseProvider = provider<DatabaseConnection>((_) => _database);

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  try {
    await _database.init();
  } on DatabaseException catch (e) {
    log(e.message);
  } catch (e, stackTrace) {
    log('Failed to start server',error: e, stackTrace: stackTrace);
  }
  return serve(handler.use(databaseProvider), ip, port);
}
