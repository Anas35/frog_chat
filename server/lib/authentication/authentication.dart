import 'dart:io';

import 'package:bcrypt/bcrypt.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:database/database.dart';
import 'package:models/models.dart';
import 'package:server/config/config.dart';
import 'package:validation/validation.dart';

/// Authentication that authenticate using JWT
class Authentication {
  /// Basic constructor
  const Authentication(this.authenticationQuery);

  ///
  final UserQuery authenticationQuery;

  ///
  Future<String> register(User user) async {
    Validation.validateRegister(user);
    final userId = await authenticationQuery.insertUser(_bcryptedUser(user));
    return _generateJWTToken(userId);
  }

  ///
  Future<String> logIn(User user) async {
    Validation.validateLogIn(user);
    final responseUser = await authenticationQuery.fetchUser(user.email);

    if (BCrypt.checkpw(user.password, responseUser.password)) {
      return _generateJWTToken(responseUser.id!);
    }

    throw const DatabaseException(
      'Incorrect password, Please enter a correct password',
    );
  }

  /// JWT Token
  String _generateJWTToken(String userId) {
    return JWT({'id': userId}).sign(SecretKey(Config.JWT_SCERET));
  }

  User _bcryptedUser(User user) {
    final bcrypt = BCrypt.hashpw(user.password, BCrypt.gensalt());
    return user.copyWith(password: bcrypt);
  }
}

///
Middleware authenticate() {
  return (handler) {
    return (context) async {
      final authorization = context.request.headers['Authorization'];
      try {
        final token = authorization?.split(' ').last ?? '';
        JWT.verify(token, SecretKey(Config.JWT_SCERET));
        return handler(context);
      } catch (e) {
        return Response(
          statusCode: HttpStatus.unauthorized,
          body: "Token can't be verify",
        );
      }

    };
  };
}
