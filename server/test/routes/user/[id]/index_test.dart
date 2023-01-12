import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';
import 'package:mocktail/mocktail.dart';
import 'package:models/models.dart';
import 'package:test/test.dart';

import '../../../../routes/user/[id]/index.dart' as route;


class _MockRequestContext extends Mock implements RequestContext {}

class _MockRequest extends Mock implements Request {}

class _MockDatabaseConnection extends Mock implements DatabaseConnection {}

void main() {
  late RequestContext context;
  late Request request;
  late DatabaseConnection database;

  const id = 'id';
  const user = User(
    id: id,
    name: 'Temp',
  );

  setUpAll(() => registerFallbackValue(user));

  setUp(() {
    context = _MockRequestContext();
    request = _MockRequest();
    database = _MockDatabaseConnection();
    when(() => context.read<DatabaseConnection>()).thenReturn(database);
    when(() => context.request).thenReturn(request);
  });

  group('responds with a 405', () {
    test('when method is DELETE', () async {
      when(() => request.method).thenReturn(HttpMethod.delete);

      final response = await route.onRequest(context, id);

      expect(response.statusCode, equals(HttpStatus.methodNotAllowed));
    });

    test('when method is HEAD', () async {
      when(() => request.method).thenReturn(HttpMethod.head);

      final response = await route.onRequest(context, id);

      expect(response.statusCode, equals(HttpStatus.methodNotAllowed));
    });

    test('when method is OPTIONS', () async {
      when(() => request.method).thenReturn(HttpMethod.options);

      final response = await route.onRequest(context, id);

      expect(response.statusCode, equals(HttpStatus.methodNotAllowed));
    });

    test('when method is PATCH', () async {
      when(() => request.method).thenReturn(HttpMethod.patch);

      final response = await route.onRequest(context, id);

      expect(response.statusCode, equals(HttpStatus.methodNotAllowed));
    });

    test('when method is PUT', () async {
      when(() => request.method).thenReturn(HttpMethod.put);

      final response = await route.onRequest(context, id);

      expect(response.statusCode, equals(HttpStatus.methodNotAllowed));
    });

    test('when method is POST', () async {
      when(() => request.method).thenReturn(HttpMethod.post);

      final response = await route.onRequest(context, id);

      expect(response.statusCode, equals(HttpStatus.methodNotAllowed));
    });
  });

  group('GET /user', () {
    test('responds with a 200 and return user', () async {
      when(() => database.getUser(any())).thenAnswer(
        (_) async => user,
      );
      when(() => request.method).thenReturn(HttpMethod.get);

      final response = await route.onRequest(context, id);

      expect(response.statusCode, equals(HttpStatus.ok));
      await expectLater(response.json(), completion(equals(user.toJson())));

      verify(() => database.getUser(id)).called(1);
    });

    test('return a null if user not exist', () async {
      when(() => database.getUser(any())).thenAnswer(
        (_) async => null,
      );
      when(() => request.method).thenReturn(HttpMethod.get);

      final response = await route.onRequest(context, id);

      expect(response.statusCode, equals(HttpStatus.ok));
      await expectLater(response.body(), completion(isEmpty));

      verify(() => database.getUser(id)).called(1);
    });

  });
}
