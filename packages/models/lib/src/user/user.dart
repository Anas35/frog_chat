import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {

  @JsonSerializable(includeIfNull: false)
  const factory User({
    @Default('') String name,
    required String email,
    required String password,
    String? id,
  }) = _UserData;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

}