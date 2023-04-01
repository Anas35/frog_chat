// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frog_chat/create_group/create_group.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CreateGroupPage', () {
    group('route', () {
      test('is routable', () {
     //   expect(CreateGroupPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders CreateGroupView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: CreateGroupPage()));
     // expect(find.byType(CreateGroupView), findsOneWidget);
    });
  });
}
