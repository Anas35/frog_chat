// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frog_chat/group_list/group_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GroupListPage', () {
    group('route', () {
      test('is routable', () {
        expect(GroupListView.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders GroupListView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: GroupListView()));
      expect(find.byType(GroupListView), findsOneWidget);
    });
  });
}
