// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'application_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required String id,
      String? email,
      String? name,
      String? pushToken,
      bool? onBoarding,
      String? photourl,
      String? mobileNo,
      bool? onBoard}) {
    return _User(
      id: id,
      email: email,
      name: name,
      pushToken: pushToken,
      onBoarding: onBoarding,
      photourl: photourl,
      mobileNo: mobileNo,
      onBoard: onBoard,
    );
  }

  User fromJson(Map<String, Object?> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get pushToken => throw _privateConstructorUsedError;
  bool? get onBoarding => throw _privateConstructorUsedError;
  String? get photourl => throw _privateConstructorUsedError;
  String? get mobileNo => throw _privateConstructorUsedError;
  bool? get onBoard => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? email,
      String? name,
      String? pushToken,
      bool? onBoarding,
      String? photourl,
      String? mobileNo,
      bool? onBoard});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? pushToken = freezed,
    Object? onBoarding = freezed,
    Object? photourl = freezed,
    Object? mobileNo = freezed,
    Object? onBoard = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      pushToken: pushToken == freezed
          ? _value.pushToken
          : pushToken // ignore: cast_nullable_to_non_nullable
              as String?,
      onBoarding: onBoarding == freezed
          ? _value.onBoarding
          : onBoarding // ignore: cast_nullable_to_non_nullable
              as bool?,
      photourl: photourl == freezed
          ? _value.photourl
          : photourl // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: mobileNo == freezed
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      onBoard: onBoard == freezed
          ? _value.onBoard
          : onBoard // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String? email,
      String? name,
      String? pushToken,
      bool? onBoarding,
      String? photourl,
      String? mobileNo,
      bool? onBoard});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? pushToken = freezed,
    Object? onBoarding = freezed,
    Object? photourl = freezed,
    Object? mobileNo = freezed,
    Object? onBoard = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      pushToken: pushToken == freezed
          ? _value.pushToken
          : pushToken // ignore: cast_nullable_to_non_nullable
              as String?,
      onBoarding: onBoarding == freezed
          ? _value.onBoarding
          : onBoarding // ignore: cast_nullable_to_non_nullable
              as bool?,
      photourl: photourl == freezed
          ? _value.photourl
          : photourl // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: mobileNo == freezed
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      onBoard: onBoard == freezed
          ? _value.onBoard
          : onBoard // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  _$_User(
      {required this.id,
      this.email,
      this.name,
      this.pushToken,
      this.onBoarding,
      this.photourl,
      this.mobileNo,
      this.onBoard})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String id;
  @override
  final String? email;
  @override
  final String? name;
  @override
  final String? pushToken;
  @override
  final bool? onBoarding;
  @override
  final String? photourl;
  @override
  final String? mobileNo;
  @override
  final bool? onBoard;

  @override
  String toString() {
    return 'User(id: $id, email: $email, name: $name, pushToken: $pushToken, onBoarding: $onBoarding, photourl: $photourl, mobileNo: $mobileNo, onBoard: $onBoard)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.pushToken, pushToken) &&
            const DeepCollectionEquality()
                .equals(other.onBoarding, onBoarding) &&
            const DeepCollectionEquality().equals(other.photourl, photourl) &&
            const DeepCollectionEquality().equals(other.mobileNo, mobileNo) &&
            const DeepCollectionEquality().equals(other.onBoard, onBoard));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(pushToken),
      const DeepCollectionEquality().hash(onBoarding),
      const DeepCollectionEquality().hash(photourl),
      const DeepCollectionEquality().hash(mobileNo),
      const DeepCollectionEquality().hash(onBoard));

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User extends User {
  factory _User(
      {required String id,
      String? email,
      String? name,
      String? pushToken,
      bool? onBoarding,
      String? photourl,
      String? mobileNo,
      bool? onBoard}) = _$_User;
  _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get id;
  @override
  String? get email;
  @override
  String? get name;
  @override
  String? get pushToken;
  @override
  bool? get onBoarding;
  @override
  String? get photourl;
  @override
  String? get mobileNo;
  @override
  bool? get onBoard;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
