/**
 * // ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chat_app/join_group/cubit/cubit.dart';

void main() {
  group('JoinGroupCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          JoinGroupCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final joinGroupCubit = JoinGroupCubit();
      expect(joinGroupCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<JoinGroupCubit, JoinGroupState>(
      'yourCustomFunction emits nothing',
      build: JoinGroupCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <JoinGroupState>[],
    );
  });
}

 */