import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';

part 'message_details.freezed.dart';

part 'message_details.g.dart';

@freezed
class MessageDetails with _$MessageDetails {

  const factory MessageDetails({
    required String userId,
    required String userName,
    required String message,
    required String messageId,
  }) = _MessageDetails;


  factory MessageDetails.fromJson(Map<String, Object?> json) => _$MessageDetailsFromJson(json);

}
