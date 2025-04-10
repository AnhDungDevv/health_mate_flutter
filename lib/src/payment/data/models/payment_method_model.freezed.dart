// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_method_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentMethodModel {
  String get id;
  String get name;
  bool get isActive;
  String get icon;

  /// Create a copy of PaymentMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentMethodModelCopyWith<PaymentMethodModel> get copyWith =>
      _$PaymentMethodModelCopyWithImpl<PaymentMethodModel>(
          this as PaymentMethodModel, _$identity);

  /// Serializes this PaymentMethodModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentMethodModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, isActive, icon);

  @override
  String toString() {
    return 'PaymentMethodModel(id: $id, name: $name, isActive: $isActive, icon: $icon)';
  }
}

/// @nodoc
abstract mixin class $PaymentMethodModelCopyWith<$Res> {
  factory $PaymentMethodModelCopyWith(
          PaymentMethodModel value, $Res Function(PaymentMethodModel) _then) =
      _$PaymentMethodModelCopyWithImpl;
  @useResult
  $Res call({String id, String name, bool isActive, String icon});
}

/// @nodoc
class _$PaymentMethodModelCopyWithImpl<$Res>
    implements $PaymentMethodModelCopyWith<$Res> {
  _$PaymentMethodModelCopyWithImpl(this._self, this._then);

  final PaymentMethodModel _self;
  final $Res Function(PaymentMethodModel) _then;

  /// Create a copy of PaymentMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isActive = null,
    Object? icon = null,
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
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      icon: null == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PaymentMethodModel implements PaymentMethodModel {
  const _PaymentMethodModel(
      {required this.id,
      required this.name,
      required this.isActive,
      required this.icon});
  factory _PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final bool isActive;
  @override
  final String icon;

  /// Create a copy of PaymentMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentMethodModelCopyWith<_PaymentMethodModel> get copyWith =>
      __$PaymentMethodModelCopyWithImpl<_PaymentMethodModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaymentMethodModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentMethodModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, isActive, icon);

  @override
  String toString() {
    return 'PaymentMethodModel(id: $id, name: $name, isActive: $isActive, icon: $icon)';
  }
}

/// @nodoc
abstract mixin class _$PaymentMethodModelCopyWith<$Res>
    implements $PaymentMethodModelCopyWith<$Res> {
  factory _$PaymentMethodModelCopyWith(
          _PaymentMethodModel value, $Res Function(_PaymentMethodModel) _then) =
      __$PaymentMethodModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name, bool isActive, String icon});
}

/// @nodoc
class __$PaymentMethodModelCopyWithImpl<$Res>
    implements _$PaymentMethodModelCopyWith<$Res> {
  __$PaymentMethodModelCopyWithImpl(this._self, this._then);

  final _PaymentMethodModel _self;
  final $Res Function(_PaymentMethodModel) _then;

  /// Create a copy of PaymentMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isActive = null,
    Object? icon = null,
  }) {
    return _then(_PaymentMethodModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      icon: null == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
