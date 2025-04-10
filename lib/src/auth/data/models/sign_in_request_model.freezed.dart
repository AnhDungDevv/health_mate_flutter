// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
SignInRequestModel _$SignInRequestModelFromJson(Map<String, dynamic> json) {
  return SignInRequestModelData.fromJson(json);
}

/// @nodoc
mixin _$SignInRequestModel {
  String get email;
  String get password;

  /// Create a copy of SignInRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignInRequestModelCopyWith<SignInRequestModel> get copyWith =>
      _$SignInRequestModelCopyWithImpl<SignInRequestModel>(
          this as SignInRequestModel, _$identity);

  /// Serializes this SignInRequestModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignInRequestModel &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @override
  String toString() {
    return 'SignInRequestModel(email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class $SignInRequestModelCopyWith<$Res> {
  factory $SignInRequestModelCopyWith(
          SignInRequestModel value, $Res Function(SignInRequestModel) _then) =
      _$SignInRequestModelCopyWithImpl;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$SignInRequestModelCopyWithImpl<$Res>
    implements $SignInRequestModelCopyWith<$Res> {
  _$SignInRequestModelCopyWithImpl(this._self, this._then);

  final SignInRequestModel _self;
  final $Res Function(SignInRequestModel) _then;

  /// Create a copy of SignInRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_self.copyWith(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class SignInRequestModelData implements SignInRequestModel {
  const SignInRequestModelData({required this.email, required this.password});
  factory SignInRequestModelData.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestModelDataFromJson(json);

  @override
  final String email;
  @override
  final String password;

  /// Create a copy of SignInRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignInRequestModelDataCopyWith<SignInRequestModelData> get copyWith =>
      _$SignInRequestModelDataCopyWithImpl<SignInRequestModelData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SignInRequestModelDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignInRequestModelData &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @override
  String toString() {
    return 'SignInRequestModel.data(email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class $SignInRequestModelDataCopyWith<$Res>
    implements $SignInRequestModelCopyWith<$Res> {
  factory $SignInRequestModelDataCopyWith(SignInRequestModelData value,
          $Res Function(SignInRequestModelData) _then) =
      _$SignInRequestModelDataCopyWithImpl;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$SignInRequestModelDataCopyWithImpl<$Res>
    implements $SignInRequestModelDataCopyWith<$Res> {
  _$SignInRequestModelDataCopyWithImpl(this._self, this._then);

  final SignInRequestModelData _self;
  final $Res Function(SignInRequestModelData) _then;

  /// Create a copy of SignInRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(SignInRequestModelData(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
