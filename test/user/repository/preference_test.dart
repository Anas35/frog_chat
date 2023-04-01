import 'package:frog_chat/user/repository/preference.dart';
import 'package:test/test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

  const token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwMSIsImlhdCI6MTY3Nzk4MzEzNn0.c9I-U9muyIQoDVu5YjEOi2MeAFOGyuWteuiyIrFKeiw';

  group('Preference', () {

    test('Get Token is null', () async {
      SharedPreferences.setMockInitialValues({});
      final sharedPreferences = await SharedPreferences.getInstance();
      final preference = Preference(sharedPreferences: sharedPreferences);
      expect(preference.getToken(), isNull);
    });

    test('Can set and fetch new Token', () async {
      SharedPreferences.setMockInitialValues({});
      final sharedPreferences = await SharedPreferences.getInstance();
      final preference = Preference(sharedPreferences: sharedPreferences);
      await preference.setToken(token);

      final fetchToken = preference.getToken();

      expect(fetchToken, isNotNull);
      expect(preference.fetchUserId(fetchToken!), isNotNull);
    });

  });
  
}