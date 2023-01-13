// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return UserData.fromJson(json);
    case 'empty':
      return UserEmpty.fromJson(json);
    case 'name':
      return UserWithName.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'User',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$User {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, List<Group> groups) $default, {
    required TResult Function() empty,
    required TResult Function(String name) name,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String name, List<Group> groups)? $default, {
    TResult? Function()? empty,
    TResult? Function(String name)? name,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, List<Group> groups)? $default, {
    TResult Function()? empty,
    TResult Function(String name)? name,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(UserData value) $default, {
    required TResult Function(UserEmpty value) empty,
    required TResult Function(UserWithName value) name,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(UserData value)? $default, {
    TResult? Function(UserEmpty value)? empty,
    TResult? Function(UserWithName value)? name,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(UserData value)? $default, {
    TResult Function(UserEmpty value)? empty,
    TResult Function(UserWithName value)? name,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserDataCopyWith<$Res> {
  factory _$$UserDataCopyWith(
          _$UserData value, $Res Function(_$UserData) then) =
      __$$UserDataCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, String name, List<Group> groups});
}

/// @nodoc
class __$$UserDataCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserData>
    implements _$$UserDataCopyWith<$Res> {
  __$$UserDataCopyWithImpl(_$UserData _value, $Res Function(_$UserData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? groups = null,
  }) {
    return _then(_$UserData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserData implements UserData {
  const _$UserData(
      {required this.id,
      required this.name,
      final List<Group> groups = const [],
      final String? $type})
      : _groups = groups,
        $type = $type ?? 'default';

  factory _$UserData.fromJson(Map<String, dynamic> json) =>
      _$$UserDataFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<Group> _groups;
  @override
  @JsonKey()
  List<Group> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'User(id: $id, name: $name, groups: $groups)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._groups, _groups));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_groups));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataCopyWith<_$UserData> get copyWith =>
      __$$UserDataCopyWithImpl<_$UserData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, List<Group> groups) $default, {
    required TResult Function() empty,
    required TResult Function(String name) name,
  }) {
    return $default(id, this.name, groups);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String name, List<Group> groups)? $default, {
    TResult? Function()? empty,
    TResult? Function(String name)? name,
  }) {
    return $default?.call(id, this.name, groups);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, List<Group> groups)? $default, {
    TResult Function()? empty,
    TResult Function(String name)? name,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, this.name, groups);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(UserData value) $default, {
    required TResult Function(UserEmpty value) empty,
    required TResult Function(UserWithName value) name,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(UserData value)? $default, {
    TResult? Function(UserEmpty value)? empty,
    TResult? Function(UserWithName value)? name,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(UserData value)? $default, {
    TResult Function(UserEmpty value)? empty,
    TResult Function(UserWithName value)? name,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataToJson(
      this,
    );
  }
}

abstract class UserData implements User {
  const factory UserData(
      {required final String id,
      required final String name,
      final List<Group> groups}) = _$UserData;

  factory UserData.fromJson(Map<String, dynamic> json) = _$UserData.fromJson;

  String get id;
  String get name;
  List<Group> get groups;
  @JsonKey(ignore: true)
  _$$UserDataCopyWith<_$UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserEmptyCopyWith<$Res> {
  factory _$$UserEmptyCopyWith(
          _$UserEmpty value, $Res Function(_$UserEmpty) then) =
      __$$UserEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserEmptyCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserEmpty>
    implements _$$UserEmptyCopyWith<$Res> {
  __$$UserEmptyCopyWithImpl(
      _$UserEmpty _value, $Res Function(_$UserEmpty) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$UserEmpty implements UserEmpty {
  const _$UserEmpty({final String? $type}) : $type = $type ?? 'empty';

  factory _$UserEmpty.fromJson(Map<String, dynamic> json) =>
      _$$UserEmptyFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'User.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserEmpty);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, List<Group> groups) $default, {
    required TResult Function() empty,
    required TResult Function(String name) name,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String name, List<Group> groups)? $default, {
    TResult? Function()? empty,
    TResult? Function(String name)? name,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, List<Group> groups)? $default, {
    TResult Function()? empty,
    TResult Function(String name)? name,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(UserData value) $default, {
    required TResult Function(UserEmpty value) empty,
    required TResult Function(UserWithName value) name,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(UserData value)? $default, {
    TResult? Function(UserEmpty value)? empty,
    TResult? Function(UserWithName value)? name,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(UserData value)? $default, {
    TResult Function(UserEmpty value)? empty,
    TResult Function(UserWithName value)? name,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserEmptyToJson(
      this,
    );
  }
}

abstract class UserEmpty implements User {
  const factory UserEmpty() = _$UserEmpty;

  factory UserEmpty.fromJson(Map<String, dynamic> json) = _$UserEmpty.fromJson;
}

/// @nodoc
abstract class _$$UserWithNameCopyWith<$Res> {
  factory _$$UserWithNameCopyWith(
          _$UserWithName value, $Res Function(_$UserWithName) then) =
      __$$UserWithNameCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$UserWithNameCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserWithName>
    implements _$$UserWithNameCopyWith<$Res> {
  __$$UserWithNameCopyWithImpl(
      _$UserWithName _value, $Res Function(_$UserWithName) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$UserWithName(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserWithName implements UserWithName {
  const _$UserWithName({required this.name, final String? $type})
      : $type = $type ?? 'name';

  factory _$UserWithName.fromJson(Map<String, dynamic> json) =>
      _$$UserWithNameFromJson(json);

  @override
  final String name;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'User.name(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserWithName &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserWithNameCopyWith<_$UserWithName> get copyWith =>
      __$$UserWithNameCopyWithImpl<_$UserWithName>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, List<Group> groups) $default, {
    required TResult Function() empty,
    required TResult Function(String name) name,
  }) {
    return name(this.name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String name, List<Group> groups)? $default, {
    TResult? Function()? empty,
    TResult? Function(String name)? name,
  }) {
    return name?.call(this.name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, List<Group> groups)? $default, {
    TResult Function()? empty,
    TResult Function(String name)? name,
    required TResult orElse(),
  }) {
    if (name != null) {
      return name(this.name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(UserData value) $default, {
    required TResult Function(UserEmpty value) empty,
    required TResult Function(UserWithName value) name,
  }) {
    return name(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(UserData value)? $default, {
    TResult? Function(UserEmpty value)? empty,
    TResult? Function(UserWithName value)? name,
  }) {
    return name?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(UserData value)? $default, {
    TResult Function(UserEmpty value)? empty,
    TResult Function(UserWithName value)? name,
    required TResult orElse(),
  }) {
    if (name != null) {
      return name(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserWithNameToJson(
      this,
    );
  }
}

abstract class UserWithName implements User {
  const factory UserWithName({required final String name}) = _$UserWithName;

  factory UserWithName.fromJson(Map<String, dynamic> json) =
      _$UserWithName.fromJson;

  String get name;
  @JsonKey(ignore: true)
  _$$UserWithNameCopyWith<_$UserWithName> get copyWith =>
      throw _privateConstructorUsedError;
}
