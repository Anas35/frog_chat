// ignore_for_file: non_constant_identifier_names

import 'package:dotenv/dotenv.dart';

/// Env
class Config {

  static final _env = DotEnv()..load();

  /// Host
  static final HOST = _env['host']!;

  /// Port
  static final PORT = int.parse(_env['port']!);

  ///
  static final USERNAME = _env['userName']!;

  /// 
  static final PASSWORD = _env['password']!;

  /// JWT Secret token
  static final JWT_SCERET = _env['JWT_SCERET']!;
  
}
