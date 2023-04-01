import 'package:mysql_client/exception.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:test/test.dart';

/*
dart --define=host=127.0.0.1 --define=port=3306 --define=userName=user --define=password=123456 test test/ --concurrency=1
*/

import 'utils/mock_db.dart';

/// Base test for database packages. Test is perfomed using actual MySql table,
/// that required host to have local mysql connection enable.
///
/// Must define database connection arguments using `--define``
///
/// Run test as,
/// 'dart --define=host=[HOST] --define=port=[PORT] --define=userName=[USERNAME] --define=password=[PASSWORD] test test/ --concurrency=1'
void main() {
  /// mock Implementation of Database that overrides connection
  final database = MockDatabase();

  /// Base test that connect database and perform queries
  group('Database ', () {
    test('can connect', () async {
      await database.initialize();
      expect(database.sqlConnection.connected, isTrue);
    });

    test('can initialize and drop database', () async {
      await database.initializeTable();
      expect(database.sqlConnection.execute("use database testDb;"), completion(isA<IResultSet>()));

      await database.dropDatabase();
      expect(database.sqlConnection.execute("use database testDb"), throwsA(isA<MySQLException>()));
    });
  });
}
