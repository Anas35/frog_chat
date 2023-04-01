// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';
import 'package:server/exception_handling.dart';

FutureOr<Response> onRequest(
  RequestContext context, String userId, String groupId,
) async {
  if (context.request.method == HttpMethod.post) {
    return await _post(context, userId, groupId);
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _post(RequestContext context, String userId, String groupId) async {
  return requestQuery(() async {
    final groupQuery = context.read<GroupQuery>();
    await groupQuery.joinGroup(userId, groupId);
    
    return Response();
  });
}
