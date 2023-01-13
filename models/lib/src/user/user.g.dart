// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      id: json['id'] as String,
      name: json['name'] as String,
      groups: (json['groups'] as List<dynamic>?)
              ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'groups': instance.groups,
    };
