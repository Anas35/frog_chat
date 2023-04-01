// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';
import 'package:server/exception_handling.dart';

Future<Response> onRequest(RequestContext context, String userId) async {
  if (context.request.method == HttpMethod.get) {
    return _get(context, userId);
  } else if (context.request.method == HttpMethod.post) {
    return _post(context, userId);
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context, String userId) async {
  try {
    final groupQuery = context.read<GroupQuery>();
    final groups = await groupQuery.getAllGroups(userId);

    return Response.json(body: groups.map((group) => group.toJson()).toList());
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

Future<Response> _post(RequestContext context, String userId) async {
  return requestQuery(() async {
    final groupQuery = context.read<GroupQuery>();
    final message = await context.request.body();

    final groupId = await groupQuery.createGroup(message);
    await groupQuery.joinGroup(userId, groupId);

    return Response.json(
      statusCode: HttpStatus.created,
      body: groupId,
    );
  });
}
