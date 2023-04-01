import 'package:database/database.dart';
import 'package:models/models.dart';
import 'package:test/test.dart';

import '../utils/mock_db.dart';

/*
dart --define=host=127.0.0.1 --define=port=3306 --define=userName=user --define=password=123456 test test/database_test.dart
*/


/// Base test for database packages. Test is perfomed using actual MySql table,
/// that required host to have local mysql connection enable.
///
/// Must define database connection arguments using `--define``
///
/// Run test as,
/// 'dart --define=host=[HOST] --define=port=[PORT] --define=userName=[USERNAME] --define=password=[PASSWORD] test test/database_test.dart'
void main() {
  /// mock Implementation of Database that overrides connection
  final database = MockDatabase();

  late final UserQuery userQuery;

  /// Base test that connect database and perform queries
  group('UserQuery', () {

    /// Connect Database and initialize the schema
    setUpAll(() async {
      return Future<void>(() async {
        await database.initialize();
        await database.initializeTable();
        userQuery = UserQuery(database.sqlConnection);
      });
    });

    group('insert user', () {
      
      test('should insert normally', () async {
        final user = User(name: 'temp', email: 'temp123@gmail.com', password: '123456789');
        await expectLater(() async => await userQuery.insertUser(user), returnsNormally);
      });
      
      test('throw a exception when email exist', () async {
        final user = User(name: 'temp1', email: 'temp1234@gmail.com', password: '123456789');
        await userQuery.insertUser(user);
        await Future.delayed(Duration(milliseconds: 250));
        await expectLater(() async => await userQuery.insertUser(user), throwsA(isA<DatabaseException>()));
      });

    });

    
    group('fetch user', () {
      
      test('can fetch user', () async {
        final user = User(name: 'temp', email: 'temp987@gmail.com', password: '123456789');
        await userQuery.insertUser(user);

        final retriveUser = await userQuery.fetchUser(user.email);

        await expectLater(user.email, retriveUser.email);
      });
      
      test('throw a exception when email does not exist', () async {
        await expectLater(() async => userQuery.fetchUser('temp789@gmail.com'), throwsA(isA<DatabaseException>()));
      });

    });

    /// Drop the test database
    tearDownAll(() async {
      return Future<void>(() async {
        await database.dropDatabase();
      });
    });
  });
}
