import 'dart:async';
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
    final dataSource =  await context.read<Future<DatabaseConnection>>();
    final userFunction = UserFunction(dataSource.sqlConnection);
    final json = await context.request.json() as Map<String, Object?>;

    final user = await userFunction.insert(json);

    return Response.json(
      statusCode: HttpStatus.created,
      body: user.rows.first.assoc(),
    );
  } on FormatException catch (e) {
    return Response.json(
      statusCode: HttpStatus.badRequest,
      body: e.message,
    );
  } on DatabaseException catch (e) {
    return Response.json(
      statusCode: HttpStatus.badGateway,
      body: e.message,
    );
  } catch (e) {
    print(e);
    return Response.json(
      statusCode: HttpStatus.internalServerError,
      body: 'Something went wrong, Please try again later',
    );
  }
}
