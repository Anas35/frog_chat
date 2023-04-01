import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';
import 'package:server/authentication/authentication.dart';

final messageQuery = provider((context) {
  return MessageQuery(context.read<MySQLConnection>());
});

Handler middleware(Handler handler) {
  return handler
    .use(authenticate())
    .use(messageQuery);
}
