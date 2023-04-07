import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';
import 'package:models/models.dart';
import 'package:server/authentication/authentication.dart';
import 'package:validation/validation.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method == HttpMethod.post) {
    return _post(context);
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _post(RequestContext context) async {  
  try {
    final authentication = context.read<Authentication>();
    final json = await context.request.formData();

    final token = await authentication.register(User.fromJson(json));

    return Response.json(
      statusCode: HttpStatus.created,
      body: token,
    );
  } on ValidationException catch (e) {
    return Response.json(
      statusCode: HttpStatus.badRequest,
      body: e.message,
    );
  } on DatabaseException catch (e) {
    return Response.json(
      statusCode: HttpStatus.badRequest,
      body: e.message,
    );
  } catch (e, stackTrace) {
    print('Error: Route: Register $e $stackTrace');
    return Response.json(
      statusCode: HttpStatus.badGateway,
      body: 'Registeration failed, Please try again later',
    );
  }
}
