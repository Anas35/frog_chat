import 'package:freezed_annotation/freezed_annotation.dart';

part 'group.freezed.dart';

part 'group.g.dart';

@freezed
class Group with _$Group {

  const factory Group({
    required String groupId,
    required String groupName,
  }) = _Group;

  factory Group.fromJson(Map<String, Object?> json) => _$GroupFromJson(json);

}
