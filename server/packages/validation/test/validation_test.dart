import 'package:models/models.dart';
import 'package:validation/validation.dart';
import 'package:test/test.dart';

void main() {
  group('Register validation', () {
    test('valid', () {
      final user = User(name: 'temp12', email: 'abcd@gmail.com', password: '12345abcd');
      expect(() => Validation.validateRegister(user), returnsNormally);
    });

    test('invalid', () {
      final user = User(name: 'temp', email: 'abcdgmail.com', password: '12345');
      expect(() => Validation.validateRegister(user), throwsA(isA<ValidationException>()));
    });

    test('invalid when name is empty', () {
      final user = User(email: 'abcdgmail.com', password: '12345');
      expect(() => Validation.validateRegister(user), throwsA(isA<ValidationException>()));
    });
  });

  group('LogIn Validation', () {
    test('valid', () {
      final user = User(email: 'abcd@gmail.com', password: '12345abcd');
      expect(() => Validation.validateLogIn(user), returnsNormally);
    });

    test('invalid', () {
      final user = User(email: 'abcdgmail.com', password: '12345');
      expect(() => Validation.validateLogIn(user), throwsA(isA<ValidationException>()));
    });
  });
}
