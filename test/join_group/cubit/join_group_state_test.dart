/*// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:frog_chat/join_group/cubit/cubit.dart';

void main() {
  group('JoinGroupState', () {
    test('supports value equality', () {
      expect(
        JoinGroupState(),
        equals(
          const JoinGroupState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const JoinGroupState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const joinGroupState = JoinGroupState(
            groupId: 'My property',
          );
          expect(
            joinGroupState.copyWith(),
            equals(joinGroupState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const joinGroupState = JoinGroupState(
            groupId: 'My property',
          );
          final otherJoinGroupState = JoinGroupState(
            groupId: 'My property 2',
          );
          expect(joinGroupState, isNot(equals(otherJoinGroupState)));

          expect(
            joinGroupState.copyWith(
              groupId: otherJoinGroupState.groupId,
            ),
            equals(otherJoinGroupState),
          );
        },
      );
    });
  });
}
 */