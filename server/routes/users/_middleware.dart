import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';
import 'package:server/authentication/authentication.dart';

Handler middleware(Handler handler) {
  return handler
    .use(authenticate())
    .use(userQuery)
    .use(groupQuery);
}

final userQuery = provider((context) {
  return UserQuery(context.read<MySQLConnection>());
});

final groupQuery = provider((context) {
  return GroupQuery(context.read<MySQLConnection>());
});
