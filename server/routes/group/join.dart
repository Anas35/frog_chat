import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';
import 'package:models/models.dart';

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
    final dataSource = context.read<DatabaseConnection>();
    final json = await context.request.json() as Map<String, dynamic>;

    await dataSource.groupFunction.joinGroup(Participants.fromJson(json));

    return Response.json();
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
