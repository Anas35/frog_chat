import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

part 'message.g.dart';

@freezed
class Message with _$Message {

  const factory Message({
    String? id,
    required String groupId,
    required String userId,
    required String message,
  }) = _Message;

  factory Message.fromJson(Map<String, Object?> json) => _$MessageFromJson(json);

}
