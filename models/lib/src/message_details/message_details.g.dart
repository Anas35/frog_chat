// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageDetails _$$_MessageDetailsFromJson(Map<String, dynamic> json) =>
    _$_MessageDetails(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      message: json['message'] as String,
      messageId: json['messageId'] as String,
    );

Map<String, dynamic> _$$_MessageDetailsToJson(_$_MessageDetails instance) =>
    <String, dynamic>{
      'user': instance.user,
      'message': instance.message,
      'messageId': instance.messageId,
    };
