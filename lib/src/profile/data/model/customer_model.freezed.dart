// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) {
  return BaseCustomerModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerModel {
  String get id;
  String get name;
  @RoleConverter()
  Role get role;
  String? get email;
  String? get phone;
  String? get avatar;
  String? get referralCode;

  /// Create a copy of CustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerModelCopyWith<CustomerModel> get copyWith =>
      _$CustomerModelCopyWithImpl<CustomerModel>(
          this as CustomerModel, _$identity);

  /// Serializes this CustomerModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, role, email, phone, avatar, referralCode);

  @override
  String toString() {
    return 'CustomerModel(id: $id, name: $name, role: $role, email: $email, phone: $phone, avatar: $avatar, referralCode: $referralCode)';
  }
}

/// @nodoc
abstract mixin class $CustomerModelCopyWith<$Res> {
  factory $CustomerModelCopyWith(
          CustomerModel value, $Res Function(CustomerModel) _then) =
      _$CustomerModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      @RoleConverter() Role role,
      String? email,
      String? phone,
      String? avatar,
      String? referralCode});
}

/// @nodoc
class _$CustomerModelCopyWithImpl<$Res>
    implements $CustomerModelCopyWith<$Res> {
  _$CustomerModelCopyWithImpl(this._self, this._then);

  final CustomerModel _self;
  final $Res Function(CustomerModel) _then;

  /// Create a copy of CustomerModel
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class BaseCustomerModel extends CustomerModel {
  const BaseCustomerModel(
      {required this.id,
      required this.name,
      @RoleConverter() required this.role,
      this.email,
      this.phone,
      this.avatar,
      this.referralCode})
      : super._();
  factory BaseCustomerModel.fromJson(Map<String, dynamic> json) =>
      _$BaseCustomerModelFromJson(json);

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

  /// Create a copy of CustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BaseCustomerModelCopyWith<BaseCustomerModel> get copyWith =>
      _$BaseCustomerModelCopyWithImpl<BaseCustomerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BaseCustomerModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BaseCustomerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, role, email, phone, avatar, referralCode);

  @override
  String toString() {
    return 'CustomerModel.base(id: $id, name: $name, role: $role, email: $email, phone: $phone, avatar: $avatar, referralCode: $referralCode)';
  }
}

/// @nodoc
abstract mixin class $BaseCustomerModelCopyWith<$Res>
    implements $CustomerModelCopyWith<$Res> {
  factory $BaseCustomerModelCopyWith(
          BaseCustomerModel value, $Res Function(BaseCustomerModel) _then) =
      _$BaseCustomerModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @RoleConverter() Role role,
      String? email,
      String? phone,
      String? avatar,
      String? referralCode});
}

/// @nodoc
class _$BaseCustomerModelCopyWithImpl<$Res>
    implements $BaseCustomerModelCopyWith<$Res> {
  _$BaseCustomerModelCopyWithImpl(this._self, this._then);

  final BaseCustomerModel _self;
  final $Res Function(BaseCustomerModel) _then;

  /// Create a copy of CustomerModel
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
  }) {
    return _then(BaseCustomerModel(
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
    ));
  }
}

// dart format on
