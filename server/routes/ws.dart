import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

import '_middleware.dart';

Future<Response> onRequest(RequestContext context) async {
  final roomId =  context.request.uri.queryParameters;

  final handler = webSocketHandler((channel, protocol) {
      // A new client has connected to our server.
      // Subscribe the new client to receive notifications
      // whenever the cubit state changes.
      final clients = context.read<Broadcast>()
        ..subscribe(roomId['groupId']!, channel);

      // Listen for messages from the client.
      channel.stream.listen((event) async {
          //Broadcast to current subcribe client
          clients.broadcast(roomId['groupId']!, event as String);
        },
        onDone: () => clients.unsubscribe(roomId['groupId']!, channel),
      );
    },
  );
  
  return handler(context);
}
