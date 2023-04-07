import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';
import 'package:server/exception_handling.dart';

FutureOr<Response> onRequest(RequestContext context, String userId) async {
  if (context.request.method == HttpMethod.get) {
    return requestQuery(() async {
      final userQuery = context.read<UserQuery>();
      final user = await userQuery.fetchUser(userId);

      return Response.json(body: user);
    });
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}
