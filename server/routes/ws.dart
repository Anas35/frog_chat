import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:database/database.dart';

import '_middleware.dart';

Future<Response> onRequest(RequestContext context) async {
  final ids = await context.request.json() as Map<String, String>;
  final databaseConnection = context.read<DatabaseConnection>();
  final messageFunction = MessageFunction(databaseConnection.sqlConnection);

  final messages = await messageFunction.fetchMessage(ids);

  final handler = webSocketHandler((channel, protocol) {
      // A new client has connected to our server.
      // Subscribe the new client to receive notifications
      // whenever the cubit state changes.
      final clients = context.read<Broadcast>()
        ..subscribe(ids['groupId']!, channel);

      // Send the current count to the new client.
      for (final message in messages.rows) {
        channel.sink.add('${message.assoc()}');
      }

      // Listen for messages from the client.
      channel.stream.listen(
        (event) async {
          clients.broadcast(ids['groupId']!, '$event');
          await messageFunction.insert(
            jsonDecode('$event') as Map<String, Object?>,
          );
        },
        onDone: () => clients.unsubscribe(ids['groupId']!, channel),
      );
    },
  );

  return handler(context);
}
