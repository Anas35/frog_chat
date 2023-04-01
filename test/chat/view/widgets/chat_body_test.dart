/**
 * // ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frog_chat/chat/chat.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ChatBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => ChatBloc(),
          child: MaterialApp(home: ChatBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}

 */