// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:chat_app/join_group/join_group.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('JoinGroupBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => JoinGroupCubit(),
          child: MaterialApp(home: JoinGroupBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
