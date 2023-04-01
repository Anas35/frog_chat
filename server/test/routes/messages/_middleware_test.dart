import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../routes/messages/_middleware.dart';
class _MockRequestContext extends Mock implements RequestContext {}

void main() {

  test('unathorized GET method', () async {
    final handler = middleware(
      (context) => Response(body: ''),
    );
    final request = Request.get(
      Uri.parse('http://localhost/messages'),
    );

    final context = _MockRequestContext();
    when(() => context.request).thenReturn(request);
    final response = await handler(context);

    expect(response.statusCode, HttpStatus.unauthorized);
  });

  ///ADD Example JWT token for testing
  /*test('athorized GET method', () async {
    final handler = middleware(
      (context) => Response(body: ''),
    );
    final request = Request.get(
      Uri.parse('http://localhost/messages/1'),
      headers: {
        HttpHeaders.authorizationHeader: 'token',
      },
    );

    final context = _MockRequestContext();
    when(() => context.request).thenReturn(request);
    final response = await handler(context);

    expect(response.statusCode, HttpStatus.ok);
  });*/

}
