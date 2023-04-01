// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:frog_chat/group_list/cubit/cubit.dart';

void main() {
  group('GroupListState', () {
    test('supports value equality', () {
      expect(
        GroupListState(),
        equals(
          const GroupListState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const GroupListState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const groupListState = GroupListState(
       //     customProperty: 'My property',
          );
          expect(
            groupListState.copyWith(),
            equals(groupListState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const groupListState = GroupListState(
         //   customProperty: 'My property',
          );
          final otherGroupListState = GroupListState(
           // customProperty: 'My property 2',
          );
          expect(groupListState, isNot(equals(otherGroupListState)));

          expect(
            groupListState.copyWith(
             // customProperty: otherGroupListState.customProperty,
            ),
            equals(otherGroupListState),
          );
        },
      );
    });
  });
}
