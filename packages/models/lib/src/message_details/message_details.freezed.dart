// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageDetails _$MessageDetailsFromJson(Map<String, dynamic> json) {
  return _MessageDetails.fromJson(json);
}

/// @nodoc
mixin _$MessageDetails {
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get messageId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageDetailsCopyWith<MessageDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageDetailsCopyWith<$Res> {
  factory $MessageDetailsCopyWith(
          MessageDetails value, $Res Function(MessageDetails) then) =
      _$MessageDetailsCopyWithImpl<$Res, MessageDetails>;
  @useResult
  $Res call({String userId, String userName, String message, String messageId});
}

/// @nodoc
class _$MessageDetailsCopyWithImpl<$Res, $Val extends MessageDetails>
    implements $MessageDetailsCopyWith<$Res> {
  _$MessageDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? message = null,
    Object? messageId = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageDetailsCopyWith<$Res>
    implements $MessageDetailsCopyWith<$Res> {
  factory _$$_MessageDetailsCopyWith(
          _$_MessageDetails value, $Res Function(_$_MessageDetails) then) =
      __$$_MessageDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String userName, String message, String messageId});
}

/// @nodoc
class __$$_MessageDetailsCopyWithImpl<$Res>
    extends _$MessageDetailsCopyWithImpl<$Res, _$_MessageDetails>
    implements _$$_MessageDetailsCopyWith<$Res> {
  __$$_MessageDetailsCopyWithImpl(
      _$_MessageDetails _value, $Res Function(_$_MessageDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? message = null,
    Object? messageId = null,
  }) {
    return _then(_$_MessageDetails(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessageDetails implements _MessageDetails {
  const _$_MessageDetails(
      {required this.userId,
      required this.userName,
      required this.message,
      required this.messageId});

  factory _$_MessageDetails.fromJson(Map<String, dynamic> json) =>
      _$$_MessageDetailsFromJson(json);

  @override
  final String userId;
  @override
  final String userName;
  @override
  final String message;
  @override
  final String messageId;

  @override
  String toString() {
    return 'MessageDetails(userId: $userId, userName: $userName, message: $message, messageId: $messageId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageDetails &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, userName, message, messageId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageDetailsCopyWith<_$_MessageDetails> get copyWith =>
      __$$_MessageDetailsCopyWithImpl<_$_MessageDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageDetailsToJson(
      this,
    );
  }
}

abstract class _MessageDetails implements MessageDetails {
  const factory _MessageDetails(
      {required final String userId,
      required final String userName,
      required final String message,
      required final String messageId}) = _$_MessageDetails;

  factory _MessageDetails.fromJson(Map<String, dynamic> json) =
      _$_MessageDetails.fromJson;

  @override
  String get userId;
  @override
  String get userName;
  @override
  String get message;
  @override
  String get messageId;
  @override
  @JsonKey(ignore: true)
  _$$_MessageDetailsCopyWith<_$_MessageDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
