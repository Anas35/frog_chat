import 'dart:async';
import 'dart:developer';
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

Future<Response> _get(RequestContext context, String groupId) async {
  try {
    final dataSource = context.read<DatabaseConnection>();
    final user = await dataSource.getGroupMessages(groupId);

    return Response.json(
      body: user,
    );
  } on DatabaseException catch (e) {
    return Response.json(
      statusCode: HttpStatus.internalServerError,
      body: e.message,
    );
  } catch (e, stackTrace) {
    log('Error: Route: user/create', error: e, stackTrace: stackTrace);
    return Response.json(
      statusCode: HttpStatus.badGateway,
      body: 'Something went wrong, Please try again later',
    );
  }
}
