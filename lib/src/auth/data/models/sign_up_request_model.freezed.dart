// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
SignUpRequestModel _$SignUpRequestModelFromJson(Map<String, dynamic> json) {
  return SignUpRequestModelData.fromJson(json);
}

/// @nodoc
mixin _$SignUpRequestModel {
  String? get name;
  String? get email;
  String? get password;
  String? get phone;
  String? get referralCode;
  String? get avatar;
  @RoleConverter()
  Role get role;
  String? get country;
  String? get bio;
  String? get city;

  /// Create a copy of SignUpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignUpRequestModelCopyWith<SignUpRequestModel> get copyWith =>
      _$SignUpRequestModelCopyWithImpl<SignUpRequestModel>(
          this as SignUpRequestModel, _$identity);

  /// Serializes this SignUpRequestModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignUpRequestModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, password, phone,
      referralCode, avatar, role, country, bio, city);

  @override
  String toString() {
    return 'SignUpRequestModel(name: $name, email: $email, password: $password, phone: $phone, referralCode: $referralCode, avatar: $avatar, role: $role, country: $country, bio: $bio, city: $city)';
  }
}

/// @nodoc
abstract mixin class $SignUpRequestModelCopyWith<$Res> {
  factory $SignUpRequestModelCopyWith(
          SignUpRequestModel value, $Res Function(SignUpRequestModel) _then) =
      _$SignUpRequestModelCopyWithImpl;
  @useResult
  $Res call(
      {String? name,
      String? email,
      String? password,
      String? phone,
      String? referralCode,
      String? avatar,
      @RoleConverter() Role role,
      String? country,
      String? bio,
      String? city});
}

/// @nodoc
class _$SignUpRequestModelCopyWithImpl<$Res>
    implements $SignUpRequestModelCopyWith<$Res> {
  _$SignUpRequestModelCopyWithImpl(this._self, this._then);

  final SignUpRequestModel _self;
  final $Res Function(SignUpRequestModel) _then;

  /// Create a copy of SignUpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? phone = freezed,
    Object? referralCode = freezed,
    Object? avatar = freezed,
    Object? role = null,
    Object? country = freezed,
    Object? bio = freezed,
    Object? city = freezed,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      referralCode: freezed == referralCode
          ? _self.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class SignUpRequestModelData implements SignUpRequestModel {
  const SignUpRequestModelData(
      {this.name,
      this.email,
      this.password,
      this.phone,
      this.referralCode,
      this.avatar,
      @RoleConverter() required this.role,
      this.country,
      this.bio,
      this.city});
  factory SignUpRequestModelData.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestModelDataFromJson(json);

  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? phone;
  @override
  final String? referralCode;
  @override
  final String? avatar;
  @override
  @RoleConverter()
  final Role role;
  @override
  final String? country;
  @override
  final String? bio;
  @override
  final String? city;

  /// Create a copy of SignUpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignUpRequestModelDataCopyWith<SignUpRequestModelData> get copyWith =>
      _$SignUpRequestModelDataCopyWithImpl<SignUpRequestModelData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SignUpRequestModelDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignUpRequestModelData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, password, phone,
      referralCode, avatar, role, country, bio, city);

  @override
  String toString() {
    return 'SignUpRequestModel.data(name: $name, email: $email, password: $password, phone: $phone, referralCode: $referralCode, avatar: $avatar, role: $role, country: $country, bio: $bio, city: $city)';
  }
}

/// @nodoc
abstract mixin class $SignUpRequestModelDataCopyWith<$Res>
    implements $SignUpRequestModelCopyWith<$Res> {
  factory $SignUpRequestModelDataCopyWith(SignUpRequestModelData value,
          $Res Function(SignUpRequestModelData) _then) =
      _$SignUpRequestModelDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? name,
      String? email,
      String? password,
      String? phone,
      String? referralCode,
      String? avatar,
      @RoleConverter() Role role,
      String? country,
      String? bio,
      String? city});
}

/// @nodoc
class _$SignUpRequestModelDataCopyWithImpl<$Res>
    implements $SignUpRequestModelDataCopyWith<$Res> {
  _$SignUpRequestModelDataCopyWithImpl(this._self, this._then);

  final SignUpRequestModelData _self;
  final $Res Function(SignUpRequestModelData) _then;

  /// Create a copy of SignUpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? phone = freezed,
    Object? referralCode = freezed,
    Object? avatar = freezed,
    Object? role = null,
    Object? country = freezed,
    Object? bio = freezed,
    Object? city = freezed,
  }) {
    return _then(SignUpRequestModelData(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      referralCode: freezed == referralCode
          ? _self.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
