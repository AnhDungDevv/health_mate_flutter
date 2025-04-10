// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BannerModel {
  String get title;
  String get subtitle;
  String get image;
  String get icon;

  /// Create a copy of BannerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BannerModelCopyWith<BannerModel> get copyWith =>
      _$BannerModelCopyWithImpl<BannerModel>(this as BannerModel, _$identity);

  /// Serializes this BannerModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BannerModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, subtitle, image, icon);

  @override
  String toString() {
    return 'BannerModel(title: $title, subtitle: $subtitle, image: $image, icon: $icon)';
  }
}

/// @nodoc
abstract mixin class $BannerModelCopyWith<$Res> {
  factory $BannerModelCopyWith(
          BannerModel value, $Res Function(BannerModel) _then) =
      _$BannerModelCopyWithImpl;
  @useResult
  $Res call({String title, String subtitle, String image, String icon});
}

/// @nodoc
class _$BannerModelCopyWithImpl<$Res> implements $BannerModelCopyWith<$Res> {
  _$BannerModelCopyWithImpl(this._self, this._then);

  final BannerModel _self;
  final $Res Function(BannerModel) _then;

  /// Create a copy of BannerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? image = null,
    Object? icon = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BannerModel implements BannerModel {
  const _BannerModel(
      {required this.title,
      required this.subtitle,
      required this.image,
      required this.icon});
  factory _BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);

  @override
  final String title;
  @override
  final String subtitle;
  @override
  final String image;
  @override
  final String icon;

  /// Create a copy of BannerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BannerModelCopyWith<_BannerModel> get copyWith =>
      __$BannerModelCopyWithImpl<_BannerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BannerModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BannerModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, subtitle, image, icon);

  @override
  String toString() {
    return 'BannerModel(title: $title, subtitle: $subtitle, image: $image, icon: $icon)';
  }
}

/// @nodoc
abstract mixin class _$BannerModelCopyWith<$Res>
    implements $BannerModelCopyWith<$Res> {
  factory _$BannerModelCopyWith(
          _BannerModel value, $Res Function(_BannerModel) _then) =
      __$BannerModelCopyWithImpl;
  @override
  @useResult
  $Res call({String title, String subtitle, String image, String icon});
}

/// @nodoc
class __$BannerModelCopyWithImpl<$Res> implements _$BannerModelCopyWith<$Res> {
  __$BannerModelCopyWithImpl(this._self, this._then);

  final _BannerModel _self;
  final $Res Function(_BannerModel) _then;

  /// Create a copy of BannerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? image = null,
    Object? icon = null,
  }) {
    return _then(_BannerModel(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
