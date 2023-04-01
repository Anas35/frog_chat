// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      name: json['name'] as String? ?? '',
      email: json['email'] as String,
      password: json['password'] as String,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'email': instance.email,
    'password': instance.password,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}
