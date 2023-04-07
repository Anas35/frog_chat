// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frog_chat/group_list/cubit/cubit.dart';

void main() {
  group('GroupListCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          GroupListCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final groupListCubit = GroupListCubit();
      expect(groupListCubit.state.groups, equals([]));
    });

    blocTest<GroupListCubit, GroupListState>(
      'yourCustomFunction emits nothing',
      build: GroupListCubit.new,
      //act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <GroupListState>[],
    );
  });
}
