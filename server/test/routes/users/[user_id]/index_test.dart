import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';
import 'package:mocktail/mocktail.dart';
import 'package:models/models.dart';
import 'package:test/test.dart';

import '../../../../routes/users/[user_id]/index.dart' as route;

class _MockRequestContext extends Mock implements RequestContext {}

class _MockUserQuery extends Mock implements UserQuery {}

void main() {
  late RequestContext context;
  late UserQuery userQuery;

  const id = 'id';
  const user = User(
    id: id,
    email: 'email12@gmail.com',
    password: '12345678',
    name: 'Temp',
  );

  setUpAll(() => registerFallbackValue(user));

  setUp(() {
    context = _MockRequestContext();
    userQuery = _MockUserQuery();
    when(() => context.read<UserQuery>()).thenReturn(userQuery);
  });

  group('GET /user', () {
    test('responds with a 200 and return user', () async {
      
      final request = Request.get(
        Uri.parse('http://localhost/users/$id'),
      );

      when(() => userQuery.fetchUser(any())).thenAnswer((_) async => user);
      when(() => context.request).thenReturn(request);

      final response = await route.onRequest(context, id);

      expect(response.statusCode, equals(HttpStatus.ok));
      await expectLater(response.json(), completion(equals(user.toJson())));

      verify(() => userQuery.fetchUser(id)).called(1);
    });

    test('return a null if user not exist', () async {
      final request = Request.get(
        Uri.parse('http://localhost/users/$id'),
      );

      when(() => userQuery.fetchUser(any())).thenThrow(
        const DatabaseException('No User exist'),
      );
      when(() => context.request).thenReturn(request);

      final response = await route.onRequest(context, id);

      expect(response.statusCode, equals(HttpStatus.badGateway));
      await expectLater(response.body(), completion(equals('"No User exist"')));

      verify(() => userQuery.fetchUser(id)).called(1);
    });

  });
}
