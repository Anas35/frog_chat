import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import 'routes/_middleware.dart';

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) {
  return serve(handler.use(databaseProvider), ip, port);
}
