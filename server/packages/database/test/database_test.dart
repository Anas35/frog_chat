import 'package:database/database.dart';
import 'package:models/models.dart';
import 'package:test/test.dart';

/*
dart --define=host=127.0.0.1 --define=port=3306 --define=userName=user --define=password=123456 test test/database_test.dart
*/

import 'utils/mock_db.dart';

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

  /// Base test that connect database and perform queries
  group('Database Test', () {

    late User user;
    late Group grp;

    /// Connect Database and initialize the schema
    setUpAll(() async {
      return Future<void>(() async {
        await database.init();
        await database.initializeTable();

        user = await database.createUser('user');
        grp = await database.createGroup('group');
      });
    });

    /// Test all the queries that depends on UserFunction
    group('user', () {

      test('user is inserted User Table', () async {
        await expectLater(user.name, 'user');
      });

      test('failed when username already exist', () async {
        await Future.delayed(Duration(milliseconds: 500));
        await expectLater(
          () => database.createUser('user'),
          throwsA(isA<DatabaseException>().having(
            (e) => e.message,
            'message',
            'UserName already exist',
          )),
        );
      });

      test('fetch user correctly', () async {
        final fetchUser = await database.getUser(user.id);
        expect(fetchUser.copyWith(id: fetchUser.id.toLowerCase()), user);
      });

      test('throw exception if user does not exist', () async {
        await expectLater(
          () async => await database.getUser('no-id'),
          throwsA(isA<DatabaseException>().having(
            (e) => e.message,
            'message',
            equals('No User exist'),
          )),
        );
      });

      test('initially Groups should be empty', () async {
        final groups = await database.getGroups(user.id);
        expect(groups, isEmpty);
      });
    });

    /// Test all the queries that depends on GroupFunction

    group('group', () {

      test('Create new group', () async {
        expect(grp.groupId, isNotEmpty);
        expect(grp.groupId.length, equals(6));
        expect(grp.groupName, 'group');
      });

      test('Join group', () async {
        final participant = Participants(groupId: grp.groupId, userId: user.id);
        final result = await database.joinGroup(participant);

        expect(result, grp);
      });

      test('initially messages should be empty', () async {
        final messages = await database.getGroupMessages(grp.groupId);
        expect(messages, isEmpty);
      });

      test('Groups of User', () async {
        final groups = await database.getGroups(user.id);
        expect(groups, isNotEmpty);
        expect(groups.length, equals(1));
      });
    });

    /// Test all the queries that depends on MessageFunction

    group('message', () {

      late String messageId;

      setUpAll(() async {
        return Future<void>(() async {
        messageId = await database.createMessage(
          Message(groupId: grp.groupId, userId: user.id, message: 'Hello!')
        );
        });
      });

      test('Create new message', () async {
        expect(messageId, isNotNull);
      });

      test('fetch message details', () async {
        final messageDeatils = await database.getMessage(messageId);

        expect(messageDeatils?.user.id.toLowerCase(), user.id);
        expect(messageDeatils?.message, 'Hello!');
      });

      test('messages should not be empty', () async {
          final messages = await database.getGroupMessages(grp.groupId);
          expect(messages, isNotEmpty);
          expect(messages.length, equals(1));
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
