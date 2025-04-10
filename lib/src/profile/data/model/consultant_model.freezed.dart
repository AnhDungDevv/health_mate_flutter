// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ConsultantModel _$ConsultantModelFromJson(Map<String, dynamic> json) {
  return BaseConsultantModel.fromJson(json);
}

/// @nodoc
mixin _$ConsultantModel {
  String get id;
  String get name;
  @RoleConverter()
  Role get role;
  String? get email;
  String? get phone;
  String? get avatar;
  String? get referralCode;
  String? get bio;
  String? get country;
  String? get city;

  /// Create a copy of ConsultantModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConsultantModelCopyWith<ConsultantModel> get copyWith =>
      _$ConsultantModelCopyWithImpl<ConsultantModel>(
          this as ConsultantModel, _$identity);

  /// Serializes this ConsultantModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConsultantModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, role, email, phone,
      avatar, referralCode, bio, country, city);

  @override
  String toString() {
    return 'ConsultantModel(id: $id, name: $name, role: $role, email: $email, phone: $phone, avatar: $avatar, referralCode: $referralCode, bio: $bio, country: $country, city: $city)';
  }
}

/// @nodoc
abstract mixin class $ConsultantModelCopyWith<$Res> {
  factory $ConsultantModelCopyWith(
          ConsultantModel value, $Res Function(ConsultantModel) _then) =
      _$ConsultantModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      @RoleConverter() Role role,
      String? email,
      String? phone,
      String? avatar,
      String? referralCode,
      String? bio,
      String? country,
      String? city});
}

/// @nodoc
class _$ConsultantModelCopyWithImpl<$Res>
    implements $ConsultantModelCopyWith<$Res> {
  _$ConsultantModelCopyWithImpl(this._self, this._then);

  final ConsultantModel _self;
  final $Res Function(ConsultantModel) _then;

  /// Create a copy of ConsultantModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? role = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? avatar = freezed,
    Object? referralCode = freezed,
    Object? bio = freezed,
    Object? country = freezed,
    Object? city = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      referralCode: freezed == referralCode
          ? _self.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
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
class BaseConsultantModel extends ConsultantModel {
  const BaseConsultantModel(
      {required this.id,
      required this.name,
      @RoleConverter() required this.role,
      this.email,
      this.phone,
      this.avatar,
      this.referralCode,
      this.bio,
      this.country,
      this.city})
      : super._();
  factory BaseConsultantModel.fromJson(Map<String, dynamic> json) =>
      _$BaseConsultantModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @RoleConverter()
  final Role role;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? avatar;
  @override
  final String? referralCode;
  @override
  final String? bio;
  @override
  final String? country;
  @override
  final String? city;

  /// Create a copy of ConsultantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BaseConsultantModelCopyWith<BaseConsultantModel> get copyWith =>
      _$BaseConsultantModelCopyWithImpl<BaseConsultantModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BaseConsultantModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BaseConsultantModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, role, email, phone,
      avatar, referralCode, bio, country, city);

  @override
  String toString() {
    return 'ConsultantModel.base(id: $id, name: $name, role: $role, email: $email, phone: $phone, avatar: $avatar, referralCode: $referralCode, bio: $bio, country: $country, city: $city)';
  }
}

/// @nodoc
abstract mixin class $BaseConsultantModelCopyWith<$Res>
    implements $ConsultantModelCopyWith<$Res> {
  factory $BaseConsultantModelCopyWith(
          BaseConsultantModel value, $Res Function(BaseConsultantModel) _then) =
      _$BaseConsultantModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @RoleConverter() Role role,
      String? email,
      String? phone,
      String? avatar,
      String? referralCode,
      String? bio,
      String? country,
      String? city});
}

/// @nodoc
class _$BaseConsultantModelCopyWithImpl<$Res>
    implements $BaseConsultantModelCopyWith<$Res> {
  _$BaseConsultantModelCopyWithImpl(this._self, this._then);

  final BaseConsultantModel _self;
  final $Res Function(BaseConsultantModel) _then;

  /// Create a copy of ConsultantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? role = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? avatar = freezed,
    Object? referralCode = freezed,
    Object? bio = freezed,
    Object? country = freezed,
    Object? city = freezed,
  }) {
    return _then(BaseConsultantModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      referralCode: freezed == referralCode
          ? _self.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
