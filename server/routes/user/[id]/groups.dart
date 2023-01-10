import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';

FutureOr<Response> onRequest(RequestContext context, String userId) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context, userId);
    case HttpMethod.post:
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context, String userId) async {
  try {
    final dataSource = await context.read<Future<DatabaseConnection>>();
    final userFunction = UserFunction(dataSource.sqlConnection);

    final user = await userFunction.getGroupList(userId);

    final groups = user.rows.map((row) => row.assoc()).toList();

    return Response.json(
      body: groups,
    );
  } on DatabaseException catch (e) {
    return Response.json(
      statusCode: HttpStatus.internalServerError,
      body: e.message,
    );
  } catch (e, stackTrace) {
    log('Error: Route: user/$userId/groups', error: e, stackTrace: stackTrace);
    return Response.json(
      statusCode: HttpStatus.badRequest,
      body: 'Bad Request, try again later',
    );
  }
}
