// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expertise_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ExpertiseModel _$ExpertiseModelFromJson(Map<String, dynamic> json) {
  return BasicExpertiseModel.fromJson(json);
}

/// @nodoc
mixin _$ExpertiseModel {
  String? get id;
  String get category;
  String get videoURL;
  @JsonKey(fromJson: _fileFromJson, toJson: _fileToJson)
  File? get identityProofFile;

  /// Create a copy of ExpertiseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExpertiseModelCopyWith<ExpertiseModel> get copyWith =>
      _$ExpertiseModelCopyWithImpl<ExpertiseModel>(
          this as ExpertiseModel, _$identity);

  /// Serializes this ExpertiseModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExpertiseModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.videoURL, videoURL) ||
                other.videoURL == videoURL) &&
            (identical(other.identityProofFile, identityProofFile) ||
                other.identityProofFile == identityProofFile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, category, videoURL, identityProofFile);

  @override
  String toString() {
    return 'ExpertiseModel(id: $id, category: $category, videoURL: $videoURL, identityProofFile: $identityProofFile)';
  }
}

/// @nodoc
abstract mixin class $ExpertiseModelCopyWith<$Res> {
  factory $ExpertiseModelCopyWith(
          ExpertiseModel value, $Res Function(ExpertiseModel) _then) =
      _$ExpertiseModelCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String category,
      String videoURL,
      @JsonKey(fromJson: _fileFromJson, toJson: _fileToJson)
      File? identityProofFile});
}

/// @nodoc
class _$ExpertiseModelCopyWithImpl<$Res>
    implements $ExpertiseModelCopyWith<$Res> {
  _$ExpertiseModelCopyWithImpl(this._self, this._then);

  final ExpertiseModel _self;
  final $Res Function(ExpertiseModel) _then;

  /// Create a copy of ExpertiseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? category = null,
    Object? videoURL = null,
    Object? identityProofFile = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      videoURL: null == videoURL
          ? _self.videoURL
          : videoURL // ignore: cast_nullable_to_non_nullable
              as String,
      identityProofFile: freezed == identityProofFile
          ? _self.identityProofFile
          : identityProofFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class BasicExpertiseModel extends ExpertiseModel {
  const BasicExpertiseModel(
      {this.id,
      required this.category,
      required this.videoURL,
      @JsonKey(fromJson: _fileFromJson, toJson: _fileToJson)
      this.identityProofFile})
      : super._();
  factory BasicExpertiseModel.fromJson(Map<String, dynamic> json) =>
      _$BasicExpertiseModelFromJson(json);

  @override
  final String? id;
  @override
  final String category;
  @override
  final String videoURL;
  @override
  @JsonKey(fromJson: _fileFromJson, toJson: _fileToJson)
  final File? identityProofFile;

  /// Create a copy of ExpertiseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BasicExpertiseModelCopyWith<BasicExpertiseModel> get copyWith =>
      _$BasicExpertiseModelCopyWithImpl<BasicExpertiseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BasicExpertiseModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BasicExpertiseModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.videoURL, videoURL) ||
                other.videoURL == videoURL) &&
            (identical(other.identityProofFile, identityProofFile) ||
                other.identityProofFile == identityProofFile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, category, videoURL, identityProofFile);

  @override
  String toString() {
    return 'ExpertiseModel.basic(id: $id, category: $category, videoURL: $videoURL, identityProofFile: $identityProofFile)';
  }
}

/// @nodoc
abstract mixin class $BasicExpertiseModelCopyWith<$Res>
    implements $ExpertiseModelCopyWith<$Res> {
  factory $BasicExpertiseModelCopyWith(
          BasicExpertiseModel value, $Res Function(BasicExpertiseModel) _then) =
      _$BasicExpertiseModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String category,
      String videoURL,
      @JsonKey(fromJson: _fileFromJson, toJson: _fileToJson)
      File? identityProofFile});
}

/// @nodoc
class _$BasicExpertiseModelCopyWithImpl<$Res>
    implements $BasicExpertiseModelCopyWith<$Res> {
  _$BasicExpertiseModelCopyWithImpl(this._self, this._then);

  final BasicExpertiseModel _self;
  final $Res Function(BasicExpertiseModel) _then;

  /// Create a copy of ExpertiseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? category = null,
    Object? videoURL = null,
    Object? identityProofFile = freezed,
  }) {
    return _then(BasicExpertiseModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      videoURL: null == videoURL
          ? _self.videoURL
          : videoURL // ignore: cast_nullable_to_non_nullable
              as String,
      identityProofFile: freezed == identityProofFile
          ? _self.identityProofFile
          : identityProofFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

// dart format on
