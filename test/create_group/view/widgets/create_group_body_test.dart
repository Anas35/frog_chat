// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frog_chat/create_group/create_group.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CreateGroupBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => CreateGroupCubit(),
          child: MaterialApp(home: CreateGroupBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
