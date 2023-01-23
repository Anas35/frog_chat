// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:chat_app/join_group/join_group.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('JoinGroupPage', () {
    group('route', () {
      test('is routable', () {
        expect(JoinGroupPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders JoinGroupView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: JoinGroupPage()));
      expect(find.byType(JoinGroupView), findsOneWidget);
    });
  });
}
