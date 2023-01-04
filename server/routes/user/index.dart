import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';

FutureOr<Response> onRequest(RequestContext context) async {

  switch (context.request.method) {
    case HttpMethod.get:
    case HttpMethod.post:
      return _post(context);
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _post(RequestContext context) async {
  try {
    final dataSource =  await context.read<Future<DatabaseConnection>>();
    final userFunction = UserFunction(dataSource.sqlConnection);
    final json = await context.request.json() as Map<String, Object?>;

    final user = await userFunction.insert(json);

    return Response.json(
      statusCode: HttpStatus.created,
      body: user.rows.first.assoc(),
    );
  } on DatabaseException catch (e, stackTrace) {
    print(e.message);
    log(e.message, stackTrace: stackTrace);
    return Response.json(
      statusCode: HttpStatus.internalServerError,
    );
  } catch (e) {
    print(e);
    return Response.json(
      statusCode: HttpStatus.badRequest,
    );
  }
}
