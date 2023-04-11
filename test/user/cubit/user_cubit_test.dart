import 'package:bloc_test/bloc_test.dart';
import 'package:frog_chat/user/repository/preference.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frog_chat/user/cubit/cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockPreference extends Mock implements Preference {}

void main() {
  
  late Preference preference;

  setUp(() {
    preference = MockPreference();
  });

  group('UserCubit', () {

    test('initial state is LoginState', () {
      final userCubit = UserCubit(
        preference: preference,
      );
      expect(userCubit.state, UserState);
    });

    blocTest<UserCubit, UserState>(
      'can reflect state change',
      setUp: () {
        when(() => preference.getToken()).thenReturn('token');
        when(() => preference.fetchUserId(any())).thenReturn('id');
      },
      build: () => UserCubit(preference: preference),
      act: (cubit) => cubit.getState(),
      expect: () => const <UserState>[
        (token: 'token', userId: 'id'),
      ],
      verify: (_) {
        verify(() => preference.getToken()).called(1);
        verify(() => preference.fetchUserId(any())).called(1);
      },
    );

  });
}
