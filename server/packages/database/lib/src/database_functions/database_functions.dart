import 'package:mysql_client/mysql_client.dart';

abstract class DatabaseFunction {

  Future<IResultSet> get(String id);

  Future<IResultSet> insert(Map<String, Object?> json);

}
