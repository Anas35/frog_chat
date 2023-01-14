import 'package:mysql_client/exception.dart';

class DatabaseException implements Exception {
  final String message;

  const DatabaseException(this.message);

  static Future<T> wrapper<T>({required Future<T> Function() body, required String message}) async {
    try {
      final result = await body();
      return result;
    } on MySQLException catch (e) {
      throw DatabaseException(e.message);
    } catch (e) {
      throw DatabaseException('message: $e');
    }
  }
}