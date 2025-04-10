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
mixin _$ConversationModelImpl {
  String get id;
  String get userId1;
  String get userId2;
  ChatMessageModelImpl? get lastMessage;
  DateTime get updatedAt;

  /// Create a copy of ConversationModelImpl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConversationModelImplCopyWith<ConversationModelImpl> get copyWith =>
      _$ConversationModelImplCopyWithImpl<ConversationModelImpl>(
          this as ConversationModelImpl, _$identity);

  /// Serializes this ConversationModelImpl to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConversationModelImpl &&
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
    return 'ConversationModelImpl(id: $id, userId1: $userId1, userId2: $userId2, lastMessage: $lastMessage, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $ConversationModelImplCopyWith<$Res> {
  factory $ConversationModelImplCopyWith(ConversationModelImpl value,
          $Res Function(ConversationModelImpl) _then) =
      _$ConversationModelImplCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId1,
      String userId2,
      ChatMessageModelImpl? lastMessage,
      DateTime updatedAt});

  $ChatMessageModelImplCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class _$ConversationModelImplCopyWithImpl<$Res>
    implements $ConversationModelImplCopyWith<$Res> {
  _$ConversationModelImplCopyWithImpl(this._self, this._then);

  final ConversationModelImpl _self;
  final $Res Function(ConversationModelImpl) _then;

  /// Create a copy of ConversationModelImpl
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
              as ChatMessageModelImpl?,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of ConversationModelImpl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatMessageModelImplCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
      return null;
    }

    return $ChatMessageModelImplCopyWith<$Res>(_self.lastMessage!, (value) {
      return _then(_self.copyWith(lastMessage: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ConversationModelImpl extends ConversationModelImpl {
  const _ConversationModelImpl(
      {required this.id,
      required this.userId1,
      required this.userId2,
      this.lastMessage,
      required this.updatedAt})
      : super._();
  factory _ConversationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$ConversationModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId1;
  @override
  final String userId2;
  @override
  final ChatMessageModelImpl? lastMessage;
  @override
  final DateTime updatedAt;

  /// Create a copy of ConversationModelImpl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConversationModelImplCopyWith<_ConversationModelImpl> get copyWith =>
      __$ConversationModelImplCopyWithImpl<_ConversationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ConversationModelImplToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConversationModelImpl &&
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
    return 'ConversationModelImpl(id: $id, userId1: $userId1, userId2: $userId2, lastMessage: $lastMessage, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$ConversationModelImplCopyWith<$Res>
    implements $ConversationModelImplCopyWith<$Res> {
  factory _$ConversationModelImplCopyWith(_ConversationModelImpl value,
          $Res Function(_ConversationModelImpl) _then) =
      __$ConversationModelImplCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId1,
      String userId2,
      ChatMessageModelImpl? lastMessage,
      DateTime updatedAt});

  @override
  $ChatMessageModelImplCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class __$ConversationModelImplCopyWithImpl<$Res>
    implements _$ConversationModelImplCopyWith<$Res> {
  __$ConversationModelImplCopyWithImpl(this._self, this._then);

  final _ConversationModelImpl _self;
  final $Res Function(_ConversationModelImpl) _then;

  /// Create a copy of ConversationModelImpl
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
    return _then(_ConversationModelImpl(
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
              as ChatMessageModelImpl?,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of ConversationModelImpl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatMessageModelImplCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
      return null;
    }

    return $ChatMessageModelImplCopyWith<$Res>(_self.lastMessage!, (value) {
      return _then(_self.copyWith(lastMessage: value));
    });
  }
}

// dart format on
