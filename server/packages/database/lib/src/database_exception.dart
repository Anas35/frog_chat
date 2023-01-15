import 'package:mysql_client/exception.dart';

class DatabaseException implements Exception {
  final String message;

  const DatabaseException(this.message);

  static Future<T> wrapper<T>({required Future<T> Function() body, required String message}) async {
    try {
      final result = await body();
      return result;
    } on StateError catch (e) {
      throw DatabaseException('StateError: ${e.message}');
    } on MySQLException catch (e) {
      throw DatabaseException('MySqlException ${e.message}');
    } catch (e) {
      print(e);
      throw e is String ? DatabaseException(e) : DatabaseException(message);
    }
  }
}