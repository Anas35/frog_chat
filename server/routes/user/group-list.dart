import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';

FutureOr<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
    case HttpMethod.post:
      return _get(context);
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context) async {
  try {
    final dataSource = await context.read<Future<DatabaseConnection>>();
    final userFunction = UserFunction(dataSource.sqlConnection);
    final userId = await context.request.body();

    final user = await userFunction.getGroupList(userId);

    final list = user.rows.map((row) => row.assoc()['groupId']).toList();

    return Response.json(
      body: list,
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
