// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommended_consultant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConsultantPreviewModel {
  String get id;
  String get name;
  String get image;
  String get specialty;
  double get rating;

  /// Create a copy of ConsultantPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConsultantPreviewModelCopyWith<ConsultantPreviewModel> get copyWith =>
      _$ConsultantPreviewModelCopyWithImpl<ConsultantPreviewModel>(
          this as ConsultantPreviewModel, _$identity);

  /// Serializes this ConsultantPreviewModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConsultantPreviewModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, image, specialty, rating);

  @override
  String toString() {
    return 'ConsultantPreviewModel(id: $id, name: $name, image: $image, specialty: $specialty, rating: $rating)';
  }
}

/// @nodoc
abstract mixin class $ConsultantPreviewModelCopyWith<$Res> {
  factory $ConsultantPreviewModelCopyWith(ConsultantPreviewModel value,
          $Res Function(ConsultantPreviewModel) _then) =
      _$ConsultantPreviewModelCopyWithImpl;
  @useResult
  $Res call(
      {String id, String name, String image, String specialty, double rating});
}

/// @nodoc
class _$ConsultantPreviewModelCopyWithImpl<$Res>
    implements $ConsultantPreviewModelCopyWith<$Res> {
  _$ConsultantPreviewModelCopyWithImpl(this._self, this._then);

  final ConsultantPreviewModel _self;
  final $Res Function(ConsultantPreviewModel) _then;

  /// Create a copy of ConsultantPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? specialty = null,
    Object? rating = null,
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
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      specialty: null == specialty
          ? _self.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ConsultantPreviewModel implements ConsultantPreviewModel {
  const _ConsultantPreviewModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.specialty,
      required this.rating});
  factory _ConsultantPreviewModel.fromJson(Map<String, dynamic> json) =>
      _$ConsultantPreviewModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String image;
  @override
  final String specialty;
  @override
  final double rating;

  /// Create a copy of ConsultantPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConsultantPreviewModelCopyWith<_ConsultantPreviewModel> get copyWith =>
      __$ConsultantPreviewModelCopyWithImpl<_ConsultantPreviewModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ConsultantPreviewModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConsultantPreviewModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, image, specialty, rating);

  @override
  String toString() {
    return 'ConsultantPreviewModel(id: $id, name: $name, image: $image, specialty: $specialty, rating: $rating)';
  }
}

/// @nodoc
abstract mixin class _$ConsultantPreviewModelCopyWith<$Res>
    implements $ConsultantPreviewModelCopyWith<$Res> {
  factory _$ConsultantPreviewModelCopyWith(_ConsultantPreviewModel value,
          $Res Function(_ConsultantPreviewModel) _then) =
      __$ConsultantPreviewModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id, String name, String image, String specialty, double rating});
}

/// @nodoc
class __$ConsultantPreviewModelCopyWithImpl<$Res>
    implements _$ConsultantPreviewModelCopyWith<$Res> {
  __$ConsultantPreviewModelCopyWithImpl(this._self, this._then);

  final _ConsultantPreviewModel _self;
  final $Res Function(_ConsultantPreviewModel) _then;

  /// Create a copy of ConsultantPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? specialty = null,
    Object? rating = null,
  }) {
    return _then(_ConsultantPreviewModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      specialty: null == specialty
          ? _self.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
