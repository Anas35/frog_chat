import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';

part 'message_details.freezed.dart';

part 'message_details.g.dart';

@freezed
class MessageDetails with _$MessageDetails {

  const factory MessageDetails({
    required User user,
    required String message,
  }) = _MessageDetails;


  factory MessageDetails.fromJson(Map<String, Object?> json) => _$MessageDetailsFromJson(json);

}
