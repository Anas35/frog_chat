/**
 * // ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frog_chat/login/login.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginPage', () {
    group('route', () {
      test('is routable', () {
        expect(LoginPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders LoginView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginPage()));
      expect(find.byType(LoginView), findsOneWidget);
    });
  });
}

 */