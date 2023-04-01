import 'package:flutter_test/flutter_test.dart';
import 'package:frog_chat/user/cubit/cubit.dart';

void main() {

  group('UserState', () {
    test('supports value equality', () {
        expect(const UserState(), equals(const UserState()),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(const UserState(), isNotNull);
      });

      test('default value', () {
        const userState = UserState();
        expect(userState.token, isEmpty);
        expect(userState.userId, isEmpty);
      });

    });

    group('copyWith', () {
      test('copies correctly when no argument specified', () {
          const userState = UserState(token: 'token');
          expect(userState.copyWith(), equals(userState));
        },
      );

      test('copies correctly when all arguments specified', () {
          const userState = UserState(token: 'token', userId: 'id');
          const otherUserState = UserState(token: 'new-token', userId: 'new-id');
          expect(userState, isNot(equals(otherUserState)));

          expect(
            userState.copyWith(
              token: otherUserState.token,
              userId: otherUserState.userId
            ),
            equals(otherUserState),
          );
        },
      );

    });
    
  });
}
