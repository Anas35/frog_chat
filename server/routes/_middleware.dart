import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';
import 'package:stream_channel/stream_channel.dart';

final databaseProvider = provider<Future<DatabaseConnection>>(
  (_) => DatabaseConnection.init(),
);

final broadcast = provider<Broadcast>((_) => Broadcast());

Handler middleware(Handler handler) {
  return handler
    .use(requestLogger())
    .use(broadcast);
}

class Broadcast {

  final _channels = <String, List<StreamChannel<dynamic>>>{};

  void broadcast(String id, String message) {
    for (final channel in _channels[id] ?? []) {
      channel.sink.add(message);
    }
  }

  void subscribe(String id, StreamChannel<dynamic> channel) {
    _channels.update(
      id, (value) => [...value, channel], ifAbsent: () => [channel],
    );
  }

  void unsubscribe(String id, StreamChannel<dynamic> channel) {
    _channels[id]?.remove(channel);
  }
}
