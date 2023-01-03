import 'dart:async';
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
  final dataSource = await context.read<Future<DatabaseConnection>>();

  final groupFunction = GroupFunction(dataSource.sqlConnection);
  final participantsFunction = ParticipantsFunction(dataSource.sqlConnection);
  
  final json = await context.request.json() as Map<String, dynamic>;

  await groupFunction.insert(json);
  await participantsFunction.insert(json);

  return Response.json(statusCode: HttpStatus.created);
}
