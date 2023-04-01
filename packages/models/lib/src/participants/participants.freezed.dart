// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'participants.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Participants _$ParticipantsFromJson(Map<String, dynamic> json) {
  return _Participants.fromJson(json);
}

/// @nodoc
mixin _$Participants {
  String? get id => throw _privateConstructorUsedError;
  String get groupId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParticipantsCopyWith<Participants> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipantsCopyWith<$Res> {
  factory $ParticipantsCopyWith(
          Participants value, $Res Function(Participants) then) =
      _$ParticipantsCopyWithImpl<$Res, Participants>;
  @useResult
  $Res call({String? id, String groupId, String userId});
}

/// @nodoc
class _$ParticipantsCopyWithImpl<$Res, $Val extends Participants>
    implements $ParticipantsCopyWith<$Res> {
  _$ParticipantsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? groupId = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ParticipantsCopyWith<$Res>
    implements $ParticipantsCopyWith<$Res> {
  factory _$$_ParticipantsCopyWith(
          _$_Participants value, $Res Function(_$_Participants) then) =
      __$$_ParticipantsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String groupId, String userId});
}

/// @nodoc
class __$$_ParticipantsCopyWithImpl<$Res>
    extends _$ParticipantsCopyWithImpl<$Res, _$_Participants>
    implements _$$_ParticipantsCopyWith<$Res> {
  __$$_ParticipantsCopyWithImpl(
      _$_Participants _value, $Res Function(_$_Participants) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? groupId = null,
    Object? userId = null,
  }) {
    return _then(_$_Participants(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Participants implements _Participants {
  const _$_Participants({this.id, required this.groupId, required this.userId});

  factory _$_Participants.fromJson(Map<String, dynamic> json) =>
      _$$_ParticipantsFromJson(json);

  @override
  final String? id;
  @override
  final String groupId;
  @override
  final String userId;

  @override
  String toString() {
    return 'Participants(id: $id, groupId: $groupId, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Participants &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, groupId, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ParticipantsCopyWith<_$_Participants> get copyWith =>
      __$$_ParticipantsCopyWithImpl<_$_Participants>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ParticipantsToJson(
      this,
    );
  }
}

abstract class _Participants implements Participants {
  const factory _Participants(
      {final String? id,
      required final String groupId,
      required final String userId}) = _$_Participants;

  factory _Participants.fromJson(Map<String, dynamic> json) =
      _$_Participants.fromJson;

  @override
  String? get id;
  @override
  String get groupId;
  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$_ParticipantsCopyWith<_$_Participants> get copyWith =>
      throw _privateConstructorUsedError;
}
