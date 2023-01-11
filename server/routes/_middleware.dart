import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

final broadcast = provider<Broadcast>((_) => Broadcast());

Handler middleware(Handler handler) {
  return handler
    .use(requestLogger())
    .use(broadcast);
}

class Broadcast {

  final _channels = <String, List<WebSocketChannel>>{};

  void broadcast(String groupId, String message) {
    for (final channel in _channels[groupId] ?? <WebSocketChannel>[]) {
      channel.sink.add(message);
    }
  }

  void subscribe(String groupId, WebSocketChannel channel) {
    _channels.update(
      groupId, (value) => [...value, channel], ifAbsent: () => [channel],
    );
  }

  void unsubscribe(String groupId, WebSocketChannel channel) {
    _channels[groupId]?.remove(channel);
  }
}
