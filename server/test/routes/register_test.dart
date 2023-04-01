// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:models/models.dart';
import 'package:server/authentication/authentication.dart';
import 'package:test/test.dart';

import '../../routes/register.dart' as register;

class _MockRequestContext extends Mock implements RequestContext {}

class _MockAuthentication extends Mock implements Authentication {}

void main() {
  test('mock', () async {
    const user = User(name: 'Anas', email: 'anas123@gmail.com', password: '12234567');

    final request = Request.post(
      Uri.parse('http://localhost/register'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: mapToForm(user.toJson()),
    );

    final context = _MockRequestContext();
    final authentication = _MockAuthentication();

    when(() => context.read<Authentication>()).thenReturn(authentication);
    when(() => context.request).thenReturn(request);
    when(() => authentication.register(user)).thenAnswer((_) async => 'hello');

    final response = await register.onRequest(context);

    expect(jsonDecode(await response.body()), 'hello');
  });

}

String mapToForm(Map<String, dynamic> map) {
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
