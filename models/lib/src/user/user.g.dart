// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserData _$$UserDataFromJson(Map<String, dynamic> json) => _$UserData(
      id: json['id'] as String,
      name: json['name'] as String,
      groups: (json['groups'] as List<dynamic>?)
              ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserDataToJson(_$UserData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'groups': instance.groups,
      'runtimeType': instance.$type,
    };

_$UserEmpty _$$UserEmptyFromJson(Map<String, dynamic> json) => _$UserEmpty(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserEmptyToJson(_$UserEmpty instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$UserWithName _$$UserWithNameFromJson(Map<String, dynamic> json) =>
    _$UserWithName(
      name: json['name'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserWithNameToJson(_$UserWithName instance) =>
    <String, dynamic>{
      'name': instance.name,
      'runtimeType': instance.$type,
    };
