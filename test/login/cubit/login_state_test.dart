/**
 * // ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:frog_chat/login/cubit/cubit.dart';

void main() {
  group('LoginState', () {
    test('supports value equality', () {
      expect(
        AuthenticationState(),
        equals(
          const AuthenticationState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const AuthenticationState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const loginState = AuthenticationState(
            customProperty: 'My property',
          );
          expect(
            loginState.copyWith(),
            equals(loginState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const loginState = AuthenticationState(
            customProperty: 'My property',
          );
          final otherLoginState = AuthenticationState(
            customProperty: 'My property 2',
          );
          expect(loginState, isNot(equals(otherLoginState)));

          expect(
            loginState.copyWith(
              customProperty: otherLoginState.customProperty,
            ),
            equals(otherLoginState),
          );
        },
      );
    });
  });
}

 */