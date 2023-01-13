import 'package:broadcast/broadcast.dart';
import 'package:dart_frog/dart_frog.dart';

final broadcast = provider<Broadcast>((_) => Broadcast());

Handler middleware(Handler handler) {
  return handler
    .use(requestLogger())
    .use(broadcast);
}
