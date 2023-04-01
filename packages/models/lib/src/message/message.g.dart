// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      id: json['id'] as String?,
      groupId: json['groupId'] as String,
      userId: json['userId'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['groupId'] = instance.groupId;
  val['userId'] = instance.userId;
  val['message'] = instance.message;
  return val;
}
