// ignore_for_file: lines_longer_than_80_chars
import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';
import 'package:mocktail/mocktail.dart';
import 'package:models/models.dart';
import 'package:test/test.dart';

import '../../../routes/messages/[id].dart' as messages;
import '../../../routes/messages/_middleware.dart';

class _MockRequestContext extends Mock implements RequestContext {}

class _MockMessageQuery extends Mock implements MessageQuery {}

void main() {

  const message = Message(groupId: 'group', userId: 'user', message: 'hello', id: '1');

  setUpAll(() {
    registerFallbackValue(message);
  });


  test('unathorized GET method', () async {
    final handler = middleware(
      (context) => Response(body: ''),
    );
    final request = Request.get(
      Uri.parse('http://localhost/messages/1'),
    );

    final context = _MockRequestContext();
    when(() => context.request).thenReturn(request);
    final response = await handler(context);

    expect(response.statusCode, HttpStatus.unauthorized);
  });

  test('GET requests', () async {
    final request = Request.get(
      Uri.parse('http://localhost/messages/1'),
    );
    const messageDetails = MessageDetails(
      message: 'hello',
      messageId: '1',
      userId: '101',
      userName: 'user',
    );

    final context = _MockRequestContext();
    final messageQuery = _MockMessageQuery();

    when(() => context.request).thenReturn(request);
    when(() => context.read<MessageQuery>()).thenReturn(messageQuery);
    when(() => messageQuery.getMessage(any())).thenAnswer((_) async => messageDetails);
    
    final response = await messages.onRequest(context, '1');

    expect(response.statusCode, HttpStatus.ok);
    expect(jsonDecode(await response.body()), equals(messageDetails.toJson()));
  });

}
