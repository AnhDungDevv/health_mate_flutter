// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
AuthDataModel _$AuthDataModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'success':
      return AuthDataModelSuccess.fromJson(json);
    case 'error':
      return AuthDataModelError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AuthDataModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AuthDataModel {
  String get status;
  String get message;

  /// Create a copy of AuthDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthDataModelCopyWith<AuthDataModel> get copyWith =>
      _$AuthDataModelCopyWithImpl<AuthDataModel>(
          this as AuthDataModel, _$identity);

  /// Serializes this AuthDataModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthDataModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @override
  String toString() {
    return 'AuthDataModel(status: $status, message: $message)';
  }
}

/// @nodoc
abstract mixin class $AuthDataModelCopyWith<$Res> {
  factory $AuthDataModelCopyWith(
          AuthDataModel value, $Res Function(AuthDataModel) _then) =
      _$AuthDataModelCopyWithImpl;
  @useResult
  $Res call({String status, String message});
}

/// @nodoc
class _$AuthDataModelCopyWithImpl<$Res>
    implements $AuthDataModelCopyWith<$Res> {
  _$AuthDataModelCopyWithImpl(this._self, this._then);

  final AuthDataModel _self;
  final $Res Function(AuthDataModel) _then;

  /// Create a copy of AuthDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class AuthDataModelSuccess extends AuthDataModel implements AuthResponse {
  const AuthDataModelSuccess(
      {required this.accessToken,
      required this.refreshToken,
      required this.user,
      required this.expiresIn,
      required this.status,
      required this.message,
      final String? $type})
      : $type = $type ?? 'success',
        super._();
  factory AuthDataModelSuccess.fromJson(Map<String, dynamic> json) =>
      _$AuthDataModelSuccessFromJson(json);

  final String accessToken;
  final String refreshToken;
  final UserModel user;
  final int expiresIn;
  @override
  final String status;
  @override
  final String message;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of AuthDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthDataModelSuccessCopyWith<AuthDataModelSuccess> get copyWith =>
      _$AuthDataModelSuccessCopyWithImpl<AuthDataModelSuccess>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AuthDataModelSuccessToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthDataModelSuccess &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, accessToken, refreshToken, user, expiresIn, status, message);

  @override
  String toString() {
    return 'AuthDataModel.success(accessToken: $accessToken, refreshToken: $refreshToken, user: $user, expiresIn: $expiresIn, status: $status, message: $message)';
  }
}

/// @nodoc
abstract mixin class $AuthDataModelSuccessCopyWith<$Res>
    implements $AuthDataModelCopyWith<$Res> {
  factory $AuthDataModelSuccessCopyWith(AuthDataModelSuccess value,
          $Res Function(AuthDataModelSuccess) _then) =
      _$AuthDataModelSuccessCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String accessToken,
      String refreshToken,
      UserModel user,
      int expiresIn,
      String status,
      String message});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$AuthDataModelSuccessCopyWithImpl<$Res>
    implements $AuthDataModelSuccessCopyWith<$Res> {
  _$AuthDataModelSuccessCopyWithImpl(this._self, this._then);

  final AuthDataModelSuccess _self;
  final $Res Function(AuthDataModelSuccess) _then;

  /// Create a copy of AuthDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? user = null,
    Object? expiresIn = null,
    Object? status = null,
    Object? message = null,
  }) {
    return _then(AuthDataModelSuccess(
      accessToken: null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      expiresIn: null == expiresIn
          ? _self.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of AuthDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class AuthDataModelError extends AuthDataModel implements AuthResponse {
  const AuthDataModelError(
      {required this.status, required this.message, final String? $type})
      : $type = $type ?? 'error',
        super._();
  factory AuthDataModelError.fromJson(Map<String, dynamic> json) =>
      _$AuthDataModelErrorFromJson(json);

  @override
  final String status;
  @override
  final String message;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of AuthDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthDataModelErrorCopyWith<AuthDataModelError> get copyWith =>
      _$AuthDataModelErrorCopyWithImpl<AuthDataModelError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AuthDataModelErrorToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthDataModelError &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @override
  String toString() {
    return 'AuthDataModel.error(status: $status, message: $message)';
  }
}

/// @nodoc
abstract mixin class $AuthDataModelErrorCopyWith<$Res>
    implements $AuthDataModelCopyWith<$Res> {
  factory $AuthDataModelErrorCopyWith(
          AuthDataModelError value, $Res Function(AuthDataModelError) _then) =
      _$AuthDataModelErrorCopyWithImpl;
  @override
  @useResult
  $Res call({String status, String message});
}

/// @nodoc
class _$AuthDataModelErrorCopyWithImpl<$Res>
    implements $AuthDataModelErrorCopyWith<$Res> {
  _$AuthDataModelErrorCopyWithImpl(this._self, this._then);

  final AuthDataModelError _self;
  final $Res Function(AuthDataModelError) _then;

  /// Create a copy of AuthDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? message = null,
  }) {
    return _then(AuthDataModelError(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
