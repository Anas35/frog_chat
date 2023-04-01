/**
 * // ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frog_chat/chat/chat.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ChatPage', () {
    group('route', () {
      test('is routable', () {
        expect(ChatPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders ChatView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ChatPage()));
      expect(find.byType(ChatView), findsOneWidget);
    });
  });
}

 */