// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frog_chat/create_group/cubit/cubit.dart';

void main() {
  group('CreateGroupCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          CreateGroupCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final createGroupCubit = CreateGroupCubit();
      expect(createGroupCubit.state.groupName, equals('Default Value'));
    });

    blocTest<CreateGroupCubit, CreateGroupState>(
      'yourCustomFunction emits nothing',
      build: CreateGroupCubit.new,
      //act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <CreateGroupState>[],
    );
  });
}
