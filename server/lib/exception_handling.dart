import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';

///
Future<Response> requestQuery(Future<Response> Function() body) async {
  try {
    return await body();
  } on DatabaseException catch (e) {
    return Response.json(
      statusCode: HttpStatus.badGateway,
      body: e.message,
    );
  } catch (e, stack) {
    print(stack);
    print(e);
    return Response.json(
      statusCode: HttpStatus.internalServerError,
      body: 'unHandled error',
    );
  }
}
