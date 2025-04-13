// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationModel {
  String get title;
  String get description;
  String get time;
  DateTime get date;
  @JsonKey(fromJson: _notificationTypeFromJson, toJson: _notificationTypeToJson)
  NotificationType get type;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      _$NotificationModelCopyWithImpl<NotificationModel>(
          this as NotificationModel, _$identity);

  /// Serializes this NotificationModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, time, date,
      const DeepCollectionEquality().hash(type));

  @override
  String toString() {
    return 'NotificationModel(title: $title, description: $description, time: $time, date: $date, type: $type)';
  }
}

/// @nodoc
abstract mixin class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
          NotificationModel value, $Res Function(NotificationModel) _then) =
      _$NotificationModelCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      String description,
      String time,
      DateTime date,
      @JsonKey(
          fromJson: _notificationTypeFromJson, toJson: _notificationTypeToJson)
      NotificationType type});
}

/// @nodoc
class _$NotificationModelCopyWithImpl<$Res>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._self, this._then);

  final NotificationModel _self;
  final $Res Function(NotificationModel) _then;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? time = null,
    Object? date = null,
    Object? type = freezed,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _NotificationModel extends NotificationModel {
  const _NotificationModel(
      {required this.title,
      required this.description,
      required this.time,
      required this.date,
      @JsonKey(
          fromJson: _notificationTypeFromJson, toJson: _notificationTypeToJson)
      required this.type})
      : super._();
  factory _NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final String time;
  @override
  final DateTime date;
  @override
  @JsonKey(fromJson: _notificationTypeFromJson, toJson: _notificationTypeToJson)
  final NotificationType type;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationModelCopyWith<_NotificationModel> get copyWith =>
      __$NotificationModelCopyWithImpl<_NotificationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, time, date,
      const DeepCollectionEquality().hash(type));

  @override
  String toString() {
    return 'NotificationModel(title: $title, description: $description, time: $time, date: $date, type: $type)';
  }
}

/// @nodoc
abstract mixin class _$NotificationModelCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$NotificationModelCopyWith(
          _NotificationModel value, $Res Function(_NotificationModel) _then) =
      __$NotificationModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      String time,
      DateTime date,
      @JsonKey(
          fromJson: _notificationTypeFromJson, toJson: _notificationTypeToJson)
      NotificationType type});
}

/// @nodoc
class __$NotificationModelCopyWithImpl<$Res>
    implements _$NotificationModelCopyWith<$Res> {
  __$NotificationModelCopyWithImpl(this._self, this._then);

  final _NotificationModel _self;
  final $Res Function(_NotificationModel) _then;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? time = null,
    Object? date = null,
    Object? type = freezed,
  }) {
    return _then(_NotificationModel(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
    ));
  }
}

// dart format on
