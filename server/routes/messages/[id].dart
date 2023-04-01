import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';
import 'package:server/exception_handling.dart';

FutureOr<Response> onRequest(RequestContext context, String id) async {
  if (context.request.method == HttpMethod.get) {
    return _get(context, id);
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context, String id) async {
  return requestQuery(() async {
    final messageQuery = context.read<MessageQuery>();
    final message = await messageQuery.getMessage(id);

    return Response.json(body: message.toJson());
  });
}
