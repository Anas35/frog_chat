import 'database_functions/database_functions.dart';
import 'package:database/src/sql_connection.dart';

class DatabaseConnection extends SqlConnection 
  with UserFunction, GroupFunction, MessageFunction {}