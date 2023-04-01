/**
 * // ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frog_chat/landing/landing.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LandingPage', () {
    group('route', () {
      test('is routable', () {
        expect(LandingPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders LandingView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: LandingPage()));
      expect(find.byType(LandingView), findsOneWidget);
    });
  });
}

 */