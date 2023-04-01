// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frog_chat/group_list/group_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GroupListBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => GroupListCubit(),
         // child: MaterialApp(home: GroupListBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
