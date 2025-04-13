// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConversationModel {
  String get id;
  String get userId1;
  String get userId2;
  ChatMessageModel? get lastMessage;
  DateTime get updatedAt;

  /// Create a copy of ConversationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConversationModelCopyWith<ConversationModel> get copyWith =>
      _$ConversationModelCopyWithImpl<ConversationModel>(
          this as ConversationModel, _$identity);

  /// Serializes this ConversationModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConversationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId1, userId1) || other.userId1 == userId1) &&
            (identical(other.userId2, userId2) || other.userId2 == userId2) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId1, userId2, lastMessage, updatedAt);

  @override
  String toString() {
    return 'ConversationModel(id: $id, userId1: $userId1, userId2: $userId2, lastMessage: $lastMessage, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $ConversationModelCopyWith<$Res> {
  factory $ConversationModelCopyWith(
          ConversationModel value, $Res Function(ConversationModel) _then) =
      _$ConversationModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId1,
      String userId2,
      ChatMessageModel? lastMessage,
      DateTime updatedAt});

  $ChatMessageModelCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class _$ConversationModelCopyWithImpl<$Res>
    implements $ConversationModelCopyWith<$Res> {
  _$ConversationModelCopyWithImpl(this._self, this._then);

  final ConversationModel _self;
  final $Res Function(ConversationModel) _then;

  /// Create a copy of ConversationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId1 = null,
    Object? userId2 = null,
    Object? lastMessage = freezed,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId1: null == userId1
          ? _self.userId1
          : userId1 // ignore: cast_nullable_to_non_nullable
              as String,
      userId2: null == userId2
          ? _self.userId2
          : userId2 // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage: freezed == lastMessage
          ? _self.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as ChatMessageModel?,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of ConversationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatMessageModelCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
      return null;
    }

    return $ChatMessageModelCopyWith<$Res>(_self.lastMessage!, (value) {
      return _then(_self.copyWith(lastMessage: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ConversationModel extends ConversationModel {
  const _ConversationModel(
      {required this.id,
      required this.userId1,
      required this.userId2,
      this.lastMessage,
      required this.updatedAt})
      : super._();
  factory _ConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationModelFromJson(json);

  @override
  final String id;
  @override
  final String userId1;
  @override
  final String userId2;
  @override
  final ChatMessageModel? lastMessage;
  @override
  final DateTime updatedAt;

  /// Create a copy of ConversationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConversationModelCopyWith<_ConversationModel> get copyWith =>
      __$ConversationModelCopyWithImpl<_ConversationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ConversationModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConversationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId1, userId1) || other.userId1 == userId1) &&
            (identical(other.userId2, userId2) || other.userId2 == userId2) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId1, userId2, lastMessage, updatedAt);

  @override
  String toString() {
    return 'ConversationModel(id: $id, userId1: $userId1, userId2: $userId2, lastMessage: $lastMessage, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$ConversationModelCopyWith<$Res>
    implements $ConversationModelCopyWith<$Res> {
  factory _$ConversationModelCopyWith(
          _ConversationModel value, $Res Function(_ConversationModel) _then) =
      __$ConversationModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId1,
      String userId2,
      ChatMessageModel? lastMessage,
      DateTime updatedAt});

  @override
  $ChatMessageModelCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class __$ConversationModelCopyWithImpl<$Res>
    implements _$ConversationModelCopyWith<$Res> {
  __$ConversationModelCopyWithImpl(this._self, this._then);

  final _ConversationModel _self;
  final $Res Function(_ConversationModel) _then;

  /// Create a copy of ConversationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId1 = null,
    Object? userId2 = null,
    Object? lastMessage = freezed,
    Object? updatedAt = null,
  }) {
    return _then(_ConversationModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId1: null == userId1
          ? _self.userId1
          : userId1 // ignore: cast_nullable_to_non_nullable
              as String,
      userId2: null == userId2
          ? _self.userId2
          : userId2 // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage: freezed == lastMessage
          ? _self.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as ChatMessageModel?,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of ConversationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatMessageModelCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
      return null;
    }

    return $ChatMessageModelCopyWith<$Res>(_self.lastMessage!, (value) {
      return _then(_self.copyWith(lastMessage: value));
    });
  }
}

// dart format on
