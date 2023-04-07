import 'package:api_wrapper/api_wrapper.dart';
import 'package:frog_chat/authentication/authentication.dart';
import 'package:frog_chat/home_view.dart';
import 'package:frog_chat/selected_group/selected_group_cubit.dart';
import 'package:frog_chat/user/repository/preference.dart';
import 'package:flutter/material.dart';
import 'package:frog_chat/user/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPreference extends Mock implements Preference {}

class MockApiWrapper extends Mock implements ApiWrapper {}

void main() {
  group('UserView', () {

    group('route', () {
      test('is routable', () {
        expect(RedirectView.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders UserView', (tester) async {
      await tester.pumpWidget(
        RepositoryProvider<Preference>(
          create: (_) => MockPreference(),
          child: const MaterialApp(
            home: RedirectView(),
          ),
        ),
      );
      expect(find.byType(RedirectView), findsOneWidget);
    });
    
    testWidgets('renders UserView', (tester) async {
      await tester.pumpWidget(
        BlocProvider(
          create: (_) => UserCubit(
            preference: MockPreference(),
          ),
          child: const MaterialApp(
            home: RedirectView(),
          ),
        ),
      );
      expect(find.byType(RedirectView), findsOneWidget);
    });

    testWidgets('Render Default Authentication View', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (_) => UserCubit(preference: MockPreference()),
            child: const RedirectView(),
          ),
        ),
      );
      expect(find.byType(LandingView), findsOneWidget);
    });

    testWidgets('Render Home View', (tester) async {
      final preference = MockPreference();
      final api = MockApiWrapper();

      when(preference.getToken).thenReturn('token');
      when(() => preference.fetchUserId(any())).thenReturn('user-id');
      when(() => api.getAllGroups(any(), any())).thenAnswer((_) async => []);

      await tester.pumpWidget(
        MaterialApp(
          home: RepositoryProvider<ApiWrapper>.value(
            value: api,
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => UserCubit(
                    preference: preference,
                  )..getState(),
                ),
                BlocProvider(
                  create: (context) => SelectedGroupCubit(),
                ),
              ],
              child: const RedirectView(),
            ),
          ),
        ),
      );
      expect(find.byType(HomeView), findsOneWidget);
    });
  });
}
