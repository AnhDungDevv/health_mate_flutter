// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommended_consultant_with_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecommendedConsultantWithStatus {
  ConsultantPreviewModel get consultant;
  bool get isOnline;

  /// Create a copy of RecommendedConsultantWithStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecommendedConsultantWithStatusCopyWith<RecommendedConsultantWithStatus>
      get copyWith => _$RecommendedConsultantWithStatusCopyWithImpl<
              RecommendedConsultantWithStatus>(
          this as RecommendedConsultantWithStatus, _$identity);

  /// Serializes this RecommendedConsultantWithStatus to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecommendedConsultantWithStatus &&
            (identical(other.consultant, consultant) ||
                other.consultant == consultant) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, consultant, isOnline);

  @override
  String toString() {
    return 'RecommendedConsultantWithStatus(consultant: $consultant, isOnline: $isOnline)';
  }
}

/// @nodoc
abstract mixin class $RecommendedConsultantWithStatusCopyWith<$Res> {
  factory $RecommendedConsultantWithStatusCopyWith(
          RecommendedConsultantWithStatus value,
          $Res Function(RecommendedConsultantWithStatus) _then) =
      _$RecommendedConsultantWithStatusCopyWithImpl;
  @useResult
  $Res call({ConsultantPreviewModel consultant, bool isOnline});

  $ConsultantPreviewModelCopyWith<$Res> get consultant;
}

/// @nodoc
class _$RecommendedConsultantWithStatusCopyWithImpl<$Res>
    implements $RecommendedConsultantWithStatusCopyWith<$Res> {
  _$RecommendedConsultantWithStatusCopyWithImpl(this._self, this._then);

  final RecommendedConsultantWithStatus _self;
  final $Res Function(RecommendedConsultantWithStatus) _then;

  /// Create a copy of RecommendedConsultantWithStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consultant = null,
    Object? isOnline = null,
  }) {
    return _then(_self.copyWith(
      consultant: null == consultant
          ? _self.consultant
          : consultant // ignore: cast_nullable_to_non_nullable
              as ConsultantPreviewModel,
      isOnline: null == isOnline
          ? _self.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of RecommendedConsultantWithStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConsultantPreviewModelCopyWith<$Res> get consultant {
    return $ConsultantPreviewModelCopyWith<$Res>(_self.consultant, (value) {
      return _then(_self.copyWith(consultant: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _RecommendedConsultantWithStatus
    implements RecommendedConsultantWithStatus {
  const _RecommendedConsultantWithStatus(
      {required this.consultant, required this.isOnline});
  factory _RecommendedConsultantWithStatus.fromJson(
          Map<String, dynamic> json) =>
      _$RecommendedConsultantWithStatusFromJson(json);

  @override
  final ConsultantPreviewModel consultant;
  @override
  final bool isOnline;

  /// Create a copy of RecommendedConsultantWithStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecommendedConsultantWithStatusCopyWith<_RecommendedConsultantWithStatus>
      get copyWith => __$RecommendedConsultantWithStatusCopyWithImpl<
          _RecommendedConsultantWithStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RecommendedConsultantWithStatusToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecommendedConsultantWithStatus &&
            (identical(other.consultant, consultant) ||
                other.consultant == consultant) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, consultant, isOnline);

  @override
  String toString() {
    return 'RecommendedConsultantWithStatus(consultant: $consultant, isOnline: $isOnline)';
  }
}

/// @nodoc
abstract mixin class _$RecommendedConsultantWithStatusCopyWith<$Res>
    implements $RecommendedConsultantWithStatusCopyWith<$Res> {
  factory _$RecommendedConsultantWithStatusCopyWith(
          _RecommendedConsultantWithStatus value,
          $Res Function(_RecommendedConsultantWithStatus) _then) =
      __$RecommendedConsultantWithStatusCopyWithImpl;
  @override
  @useResult
  $Res call({ConsultantPreviewModel consultant, bool isOnline});

  @override
  $ConsultantPreviewModelCopyWith<$Res> get consultant;
}

/// @nodoc
class __$RecommendedConsultantWithStatusCopyWithImpl<$Res>
    implements _$RecommendedConsultantWithStatusCopyWith<$Res> {
  __$RecommendedConsultantWithStatusCopyWithImpl(this._self, this._then);

  final _RecommendedConsultantWithStatus _self;
  final $Res Function(_RecommendedConsultantWithStatus) _then;

  /// Create a copy of RecommendedConsultantWithStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? consultant = null,
    Object? isOnline = null,
  }) {
    return _then(_RecommendedConsultantWithStatus(
      consultant: null == consultant
          ? _self.consultant
          : consultant // ignore: cast_nullable_to_non_nullable
              as ConsultantPreviewModel,
      isOnline: null == isOnline
          ? _self.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of RecommendedConsultantWithStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConsultantPreviewModelCopyWith<$Res> get consultant {
    return $ConsultantPreviewModelCopyWith<$Res>(_self.consultant, (value) {
      return _then(_self.copyWith(consultant: value));
    });
  }
}

// dart format on
