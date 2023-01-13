import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {

  const factory User({
    required String id,
    required String name,
    @Default([]) List<Group> groups,
  }) = UserData;

  const factory User.empty() = UserEmpty;

  const factory User.name({required String name}) = UserWithName;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

}
