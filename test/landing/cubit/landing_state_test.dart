/*
// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:frog_chat/landing/cubit/cubit.dart';

void main() {
  group('LandingState', () {
    test('supports value equality', () {
      expect(
        LandingState(),
        equals(
          const LandingState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const LandingState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const landingState = LandingState(
            customProperty: 'My property',
          );
          expect(
            landingState.copyWith(),
            equals(landingState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const landingState = LandingState(
            customProperty: 'My property',
          );
          final otherLandingState = LandingState(
            customProperty: 'My property 2',
          );
          expect(landingState, isNot(equals(otherLandingState)));

          expect(
            landingState.copyWith(
              customProperty: otherLandingState.customProperty,
            ),
            equals(otherLandingState),
          );
        },
      );
    });
  });
}
 */