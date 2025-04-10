// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentModel {
  String get id;
  String get userId;
  double get amount;
  String get method;
  String get status;
  DateTime get createdAt;

  /// Create a copy of PaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentModelCopyWith<PaymentModel> get copyWith =>
      _$PaymentModelCopyWithImpl<PaymentModel>(
          this as PaymentModel, _$identity);

  /// Serializes this PaymentModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, amount, method, status, createdAt);

  @override
  String toString() {
    return 'PaymentModel(id: $id, userId: $userId, amount: $amount, method: $method, status: $status, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $PaymentModelCopyWith<$Res> {
  factory $PaymentModelCopyWith(
          PaymentModel value, $Res Function(PaymentModel) _then) =
      _$PaymentModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId,
      double amount,
      String method,
      String status,
      DateTime createdAt});
}

/// @nodoc
class _$PaymentModelCopyWithImpl<$Res> implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._self, this._then);

  final PaymentModel _self;
  final $Res Function(PaymentModel) _then;

  /// Create a copy of PaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? amount = null,
    Object? method = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      method: null == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PaymentModel implements PaymentModel {
  const _PaymentModel(
      {required this.id,
      required this.userId,
      required this.amount,
      required this.method,
      required this.status,
      required this.createdAt});
  factory _PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final double amount;
  @override
  final String method;
  @override
  final String status;
  @override
  final DateTime createdAt;

  /// Create a copy of PaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentModelCopyWith<_PaymentModel> get copyWith =>
      __$PaymentModelCopyWithImpl<_PaymentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaymentModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, amount, method, status, createdAt);

  @override
  String toString() {
    return 'PaymentModel(id: $id, userId: $userId, amount: $amount, method: $method, status: $status, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$PaymentModelCopyWith<$Res>
    implements $PaymentModelCopyWith<$Res> {
  factory _$PaymentModelCopyWith(
          _PaymentModel value, $Res Function(_PaymentModel) _then) =
      __$PaymentModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      double amount,
      String method,
      String status,
      DateTime createdAt});
}

/// @nodoc
class __$PaymentModelCopyWithImpl<$Res>
    implements _$PaymentModelCopyWith<$Res> {
  __$PaymentModelCopyWithImpl(this._self, this._then);

  final _PaymentModel _self;
  final $Res Function(_PaymentModel) _then;

  /// Create a copy of PaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? amount = null,
    Object? method = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_PaymentModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      method: null == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
