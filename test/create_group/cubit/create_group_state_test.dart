// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:frog_chat/create_group/cubit/cubit.dart';

void main() {
  group('CreateGroupState', () {
    test('supports value equality', () {
      expect(
        CreateGroupState(),
        equals(
          const CreateGroupState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CreateGroupState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const createGroupState = CreateGroupState(
            groupName: 'My property',
          );
          expect(
            createGroupState.copyWith(),
            equals(createGroupState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const createGroupState = CreateGroupState(
            groupName: 'My property',
          );
          final otherCreateGroupState = CreateGroupState(
            groupName: 'My property 2',
          );
          expect(createGroupState, isNot(equals(otherCreateGroupState)));

          expect(
            createGroupState.copyWith(
              groupName: otherCreateGroupState.groupName,
            ),
            equals(otherCreateGroupState),
          );
        },
      );
    });
  });
}
