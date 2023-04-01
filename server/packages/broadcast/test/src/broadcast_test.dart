import 'package:broadcast/broadcast.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

class MockWebSocketChannel extends Mock implements WebSocketChannel {}

class MockWebSocketSink extends Mock implements WebSocketSink {}

void main() {
  group('Broadcast', () {
    late Broadcast broadcast;
    late MockWebSocketChannel channel1;
    late MockWebSocketChannel channel2;
    late MockWebSocketSink sink;

    setUp(() {
      broadcast = Broadcast();
      channel1 = MockWebSocketChannel();
      channel2 = MockWebSocketChannel();
      sink = MockWebSocketSink();

      when(() => channel1.sink).thenReturn(sink);
      when(() => channel2.sink).thenReturn(sink);
    });

    test('broadcast should send messages to subscribed channels', () {
      broadcast.subscribe('group1', channel1);
      broadcast.subscribe('group1', channel2);

      broadcast.broadcast('group1', 'Hello, world!');

      verify(() => channel1.sink.add('Hello, world!')).called(1);
      verify(() => channel2.sink.add('Hello, world!')).called(1);
    });

    test('broadcast should send messages only based on groups', () {
      broadcast.subscribe('group1', channel1);
      broadcast.subscribe('group2', channel2);

      broadcast.broadcast('group1', 'Hello, world!');

      verify(() => channel1.sink.add('Hello, world!')).called(1);
      verifyNever(() => channel2.sink.add('Hello, world!'));
    });

    test('unsubscribe should remove channel from the specified group', () {
      broadcast.subscribe('group1', channel1);
      broadcast.subscribe('group1', channel2);

      broadcast.unsubscribe('group1', channel1);
      broadcast.broadcast('group1', 'Hello, world!');
      
      verifyNever(() => channel1.sink.add('Hello, world!'));
      verify(() => channel2.sink.add('Hello, world!')).called(1);
    });
  });
}
