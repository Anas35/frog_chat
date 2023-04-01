// ignore_for_file: lines_longer_than_80_chars

import 'package:bcrypt/bcrypt.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:database/database.dart';
import 'package:mocktail/mocktail.dart';
import 'package:models/models.dart';
import 'package:server/authentication/authentication.dart';
import 'package:test/test.dart';
import 'package:validation/validation.dart';

class MockUserQuery extends Mock implements UserQuery {}

class FakeUser extends Fake implements User {}

void main() {

  setUpAll(() {
    registerFallbackValue(FakeUser());
  });

  group('Authentication', () {
    late UserQuery mockUserQuery;
    late Authentication authentication;

    setUp(() {
      mockUserQuery = MockUserQuery();
      authentication = Authentication(mockUserQuery);
    });

    test('register validation', () {
      const user = User(email: 'email', password: 'password');
      expect(
        authentication.register(user), 
        throwsA(isA<ValidationException>()),
      );
    });

    test('register JWT', () async {
      const user = User(email: 'user@emil.com', password: 'password', name: 'user');
      
      when(() => mockUserQuery.insertUser(any())).thenAnswer((_) => Future.value('101'));
      
      final token = await authentication.register(user);
      final payload = JWT.decode(token).payload as Map<String, Object?>;
      expect(payload['id'], '101');
    });

    test('login', () async {
      const user = User(email: 'user@gmail.com', password: 'password', id: '1');
      final hashUser = User(email: 'user@gmail.com', password: BCrypt.hashpw('password', BCrypt.gensalt()), id: '1');

      when(() => mockUserQuery.fetchUser(any())).thenAnswer((_) async => hashUser);
      
      final token = await authentication.logIn(user);
      final payload = JWT.decode(token).payload as Map<String, Object?>;
      
      expect(payload['id'], '1');
    });

    test('login incorrect password', () async {
      const user = User(email: 'user@gmail.com', password: 'password', id: '1');
      final incorrectUser = User(
        email: 'user@gmail.com', 
        password: BCrypt.hashpw('12345678', BCrypt.gensalt()), 
        id: '1',
      );
      
      when(() => mockUserQuery.fetchUser(any())).thenAnswer((_) async => incorrectUser);
      
      expect(authentication.logIn(user), throwsA(isA<DatabaseException>()));
    });
    
  });
}
