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

  late final GroupQuery groupQuery;
  late final UserQuery userQuery;

  /// Base test that connect database and perform queries
  group('GroupQuery', () {

    /// Connect Database and initialize the schema
    setUpAll(() async {
      return Future<void>(() async {
        await database.initialize();
        await database.initializeTable();
        groupQuery = GroupQuery(database.sqlConnection);
        userQuery = UserQuery(database.sqlConnection);
      });
    });

    group('create group', () {
      
      test('should create normally', () async {
        await expectLater(() async => await groupQuery.createGroup('Hello'), returnsNormally);
      });

      test('should return group Code', () async {
        final groupId = await groupQuery.createGroup('hello1');
        await expectLater(groupId.length, equals(6));
      });

    });

    
    group('join user', () {
      
      test('can join group', () async {
        final user = User(name: 'temp', email: 'temp987@gmail.com', password: '123456789');
        final userId = await userQuery.insertUser(user);
        final groupId = await groupQuery.createGroup('temp');

        await expectLater(() async => await groupQuery.joinGroup(userId, groupId), returnsNormally);
      });

    });

    
    group('fetch group', () {
      
      test('can fetch', () async {
        final groupId = await groupQuery.createGroup('temp1');
        await Future.delayed(Duration(milliseconds: 250));

        final group = await groupQuery.getGroup(groupId);

        await expectLater(group.groupName, equals('temp1'));
      });

    });

    group('Retrive all groups', () {
      
      test('can return list', () async {
        final user = User(name: 'temp', email: 'temp@gmail.com', password: '123456789');
        final userId = await userQuery.insertUser(user);
        final groupId = await groupQuery.createGroup('temp2');

        await groupQuery.joinGroup(userId, groupId);
        Future.delayed(Duration(milliseconds: 250));

        final list = await groupQuery.getAllGroups(userId);
        expect(list.length, equals(1));
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
