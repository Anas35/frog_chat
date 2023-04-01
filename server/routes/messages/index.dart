import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';
import 'package:models/models.dart';
import 'package:server/exception_handling.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method == HttpMethod.post) {
    return _post(context);
  } else if (context.request.method == HttpMethod.get) {
    return _get(context);
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _post(RequestContext context) async {
  return requestQuery(() async {
    final messageQuery = context.read<MessageQuery>();
    final json = await context.request.formData();

    final messageId = await messageQuery.createMessage(Message.fromJson(json));

    return Response.json(
      statusCode: HttpStatus.created,
      body: messageId,
    );
  });
}

Future<Response> _get(RequestContext context) async {
  return requestQuery(() async {
    final messageQuery = context.read<MessageQuery>();
    final groupId = context.request.uri.queryParameters['groupId'];

    if (groupId == null) {
      return Response.json(
        statusCode: HttpStatus.forbidden,
        body: 'No Group Id found',
      ); 
    }

    final messages = await messageQuery.getGroupMessages(groupId);

    return Response.json(
      body: messages.map((message) => message.toJson()).toList(),
    );
  });
}
