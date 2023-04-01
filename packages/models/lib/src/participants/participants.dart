import 'package:freezed_annotation/freezed_annotation.dart';

part 'participants.freezed.dart';

part 'participants.g.dart';

@freezed
class Participants with _$Participants {

  const factory Participants({
    String? id,
    required String groupId,
    required String userId,
  }) = _Participants;

  factory Participants.fromJson(Map<String, Object?> json) => _$ParticipantsFromJson(json);

}
