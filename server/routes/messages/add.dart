import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';

FutureOr<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.post:
      return _post(context);
    case HttpMethod.get:
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
    final dataSource = await context.read<Future<DatabaseConnection>>();
    final messageFunction = MessageFunction(dataSource.sqlConnection);
  
    final json = await context.request.json() as Map<String, dynamic>;

    final result = await messageFunction.insert(json);
    final id = result.rows.first.assoc()['id'];
    print(id);

    return Response.json(
      statusCode: HttpStatus.created,
      body: id,
    );
  } on DatabaseException catch (e) {
    print(e.message);
  }
  return Response.json(statusCode: HttpStatus.internalServerError);
}
