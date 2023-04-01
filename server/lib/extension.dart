/**
 * // ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

extension Validation on RequestContext {

  Future<Response?> validate(Model model) async {
    final body = await request.json() as Map<String, Object?>;
    final validateRules = await model.validatationRules(body);
    if (!model.authorize()) {
      return Response.json(
        statusCode: HttpStatus.unauthorized,
        body: {
          'message': 'UnAuthorzied User',
        },
      );
    } else if (validateRules.$1 == false) {
      return Response.json(
        statusCode: HttpStatus.badRequest,
        body: {
          'message': validateRules.$2,
        },
      );
    }
    return null;
  }

}

class RegisterModel extends Model {

  @override
  bool authorize() => true;

  @override
  Map<String, List<Rules>> fieldList = {
    'name': [Rules.required],
    'email': [Rules.required, Rules.email],
    'password': [Rules.required, Rules.password],
  };

}

abstract class Model {

  bool authorize();

  Map<String, List<Rules>> _fieldList = {};

  Map<String, List<Rules>> get fieldList => _fieldList;

  set fieldList(Map<String, List<Rules>> value) {
    _fieldList = value;
  }

  Future<(bool, String?)> validatationRules(Map<String, Object?> body) async {
    for (final field in fieldList.entries) {
      final name = field.key;

      for (final rule in field.value) {
        switch (rule) {
          case Rules.required:
            if (!body.containsKey(name)) {
              return (false, '$field is required'); 
            }
          case Rules.email:
            final validate = validateEmail(body[name]! as String);
            if(!validate) {
              return (false, 'Enter a valid Email Address');
            }
          case Rules.password:
            final validate = validatePassword(body[name]! as String);
            if(!validate) {
              return (false, 'Enter a valid Email Address');
            }
        }
      }
    }
    return (true, null);
  }

}


  bool validateEmail(String field) => true;

  bool validatePassword(String field) => true;

enum Rules {
  required,
  email,
  password,
}

 */
