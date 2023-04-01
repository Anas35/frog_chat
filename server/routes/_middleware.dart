import 'package:broadcast/broadcast.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';
import 'package:server/authentication/authentication.dart';

final broadcast = provider<Broadcast>((_) => Broadcast());

final authentication = provider((context) {
  final authenticationQuery = UserQuery(context.read<MySQLConnection>());
  return Authentication(authenticationQuery);
});

Handler middleware(Handler handler) {
  return handler
    .use(requestLogger())
    .use(authentication)
    .use(broadcast);
}
