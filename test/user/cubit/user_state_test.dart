import 'package:flutter_test/flutter_test.dart';
import 'package:frog_chat/user/cubit/cubit.dart';

void main() {

  group('UserState', () {
    test('supports value equality', () {
        expect(UserState, equals(UserState),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(UserState, isNotNull);
      });

      test('default value', () {
        const userState = (token: '', userId: '');
        expect(userState.token, isEmpty);
        expect(userState.userId, isEmpty);
      });
    });
    
  });
}
