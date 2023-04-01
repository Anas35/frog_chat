// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';
import 'package:mocktail/mocktail.dart';
import 'package:models/models.dart';
import 'package:test/test.dart';

import '../../../routes/messages/_middleware.dart';
import '../../../routes/messages/index.dart' as messages;

class _MockRequestContext extends Mock implements RequestContext {}

class _MockMessageQuery extends Mock implements MessageQuery {}

void main() {

  const message = Message(groupId: 'group', userId: 'user', message: 'hello');

  setUpAll(() {
    registerFallbackValue(message);
  });

  final headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  test('unathorized POST method', () async {
    final handler = middleware(
      (context) => Response(body: ''),
    );
    final request = Request.post(
      Uri.parse('http://localhost/messages'),
      headers: headers,
      body: mapToForm(message.toJson()),
    );

    final context = _MockRequestContext();
    when(() => context.request).thenReturn(request);
    final response = await handler(context);

    expect(response.statusCode, HttpStatus.unauthorized);
  });

  test('POST method', () async {
    final request = Request.post(
      Uri.parse('http://localhost/messages'),
      headers: headers,
      body: mapToForm(message.toJson()),
    );

    final context = _MockRequestContext();
    final messageQuery = _MockMessageQuery();
    when(() => context.request).thenReturn(request);
    when(() => context.read<MessageQuery>()).thenReturn(messageQuery);
    when(() => messageQuery.createMessage(message)).thenAnswer((_) async => '101');

    final response = await messages.onRequest(context);

    expect(response.statusCode, HttpStatus.created);
    expect(jsonDecode(await response.body()), '101');
  });

  test('unathorized GET method', () async {
    final handler = middleware(
      (context) => Response(body: ''),
    );
    final request = Request.get(
      Uri.parse('http://localhost/messages'),
      headers: headers,
    );

    final context = _MockRequestContext();
    when(() => context.request).thenReturn(request);
    final response = await handler(context);

    expect(response.statusCode, HttpStatus.unauthorized);
  });

  test('Group Id Required', () async {
    final request = Request.get(
      Uri.parse('http://localhost/messages'),
      headers: headers,
    );

    final context = _MockRequestContext();
    final messageQuery = _MockMessageQuery();
    when(() => context.request).thenReturn(request);
    when(() => context.read<MessageQuery>()).thenReturn(messageQuery);
    final response = await messages.onRequest(context);

    expect(response.statusCode, HttpStatus.forbidden);
  });

  test('GET requests', () async {
    final request = Request.get(
      Uri.parse('http://localhost/messages?groupId=101'),
      headers: headers,
    );

    final context = _MockRequestContext();
    final messageQuery = _MockMessageQuery();
    when(() => context.request).thenReturn(request);
    when(() => context.read<MessageQuery>()).thenReturn(messageQuery);
    when(() => messageQuery.getGroupMessages(any())).thenAnswer((_) async => []);
    final response = await messages.onRequest(context);

    expect(response.statusCode, HttpStatus.ok);
  });

}

String mapToForm(Map<String, Object?> map) {
  var body = '';
  for (final entry in map.entries) {
    if (body.isEmpty) {
      body += '${entry.key}=${entry.value}';
    } else {
      body += '&${entry.key}=${entry.value}';
    }
  }
  return body;
}
