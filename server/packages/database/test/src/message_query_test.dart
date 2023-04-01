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
  late final MessageQuery messageQuery;

  final userId = '1';
  late final String groupId;  

  /// Base test that connect database and perform queries
  group('MessageQuery', () {

    /// Connect Database and initialize the schema
    setUpAll(() async {
      return Future<void>(() async {
        await database.initialize();
        await database.initializeTable();
        groupQuery = GroupQuery(database.sqlConnection);
        userQuery = UserQuery(database.sqlConnection);
        messageQuery = MessageQuery(database.sqlConnection);
        
        final user = User(name: 'temp', email: 'temp987@gmail.com', password: '123456789');
        
        await userQuery.insertUser(user);
        groupId = await groupQuery.createGroup('groupName');

        await groupQuery.joinGroup(userId, groupId);
      });
    });

    group('create message', () {
      
      test('should create normally', () async {
        final message = Message(groupId: groupId, userId: userId, message: '1');
        await expectLater(() async => await messageQuery.createMessage(message), returnsNormally);
      });

      test('should return message id', () async {
        final message = Message(groupId: groupId, userId: userId, message: '2');
        final messageId = await messageQuery.createMessage(message);
        await expectLater(messageId, isNotEmpty);
      });

    });

    
    group('get message', () {
      
      test('can fetch', () async {
        final message = Message(groupId: groupId, userId: userId, message: '3');
        final messageId = await messageQuery.createMessage(message);
        await Future.delayed(Duration(milliseconds: 250));

        final details = await messageQuery.getMessage(messageId);
        expect(details.messageId, messageId);
      });

    });

    
    group('group messages', () {
      
      test('can fetch all message', () async {
        final messages = await messageQuery.getGroupMessages(groupId);

        await expectLater(messages.length, greaterThan(0));
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