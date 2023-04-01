/**
 * // ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frog_chat/login/cubit/cubit.dart';

void main() {
  group('LoginCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          AuthenticationCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final loginCubit = AuthenticationCubit();
      expect(loginCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<AuthenticationCubit, AuthenticationState>(
      'yourCustomFunction emits nothing',
      build: AuthenticationCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <AuthenticationState>[],
    );
  });
}

 */