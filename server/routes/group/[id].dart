import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';

FutureOr<Response> onRequest(RequestContext context, String id) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context, id);
    case HttpMethod.post:
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context, String id) async {
  try {
    final dataSource = await context.read<Future<DatabaseConnection>>();
    final participantsFunction = ParticipantsFunction(dataSource.sqlConnection);

    final user = await participantsFunction.get(id);

    final map = user.rows.map((row) => row.assoc()).toList();

    return Response.json(
      body: {'groups': map},
    );
  } on DatabaseException catch (e, stackTrace) {
    print(e.message + stackTrace.toString());
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
