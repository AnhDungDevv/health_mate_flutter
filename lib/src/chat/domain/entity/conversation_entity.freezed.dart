// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConversationEntity {
  String get id;
  List<String> get memberIds;
  ChatMessageEntity? get lastMessage;
  DateTime get updatedAt;
  ChatUserEntity? get receiver;

  /// Create a copy of ConversationEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConversationEntityCopyWith<ConversationEntity> get copyWith =>
      _$ConversationEntityCopyWithImpl<ConversationEntity>(
          this as ConversationEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConversationEntity &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.memberIds, memberIds) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.receiver, receiver) ||
                other.receiver == receiver));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(memberIds),
      lastMessage,
      updatedAt,
      receiver);

  @override
  String toString() {
    return 'ConversationEntity(id: $id, memberIds: $memberIds, lastMessage: $lastMessage, updatedAt: $updatedAt, receiver: $receiver)';
  }
}

/// @nodoc
abstract mixin class $ConversationEntityCopyWith<$Res> {
  factory $ConversationEntityCopyWith(
          ConversationEntity value, $Res Function(ConversationEntity) _then) =
      _$ConversationEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      List<String> memberIds,
      ChatMessageEntity? lastMessage,
      DateTime updatedAt,
      ChatUserEntity? receiver});
}

/// @nodoc
class _$ConversationEntityCopyWithImpl<$Res>
    implements $ConversationEntityCopyWith<$Res> {
  _$ConversationEntityCopyWithImpl(this._self, this._then);

  final ConversationEntity _self;
  final $Res Function(ConversationEntity) _then;

  /// Create a copy of ConversationEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? memberIds = null,
    Object? lastMessage = freezed,
    Object? updatedAt = null,
    Object? receiver = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      memberIds: null == memberIds
          ? _self.memberIds
          : memberIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastMessage: freezed == lastMessage
          ? _self.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as ChatMessageEntity?,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      receiver: freezed == receiver
          ? _self.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as ChatUserEntity?,
    ));
  }
}

/// @nodoc

class _ConversationEntity implements ConversationEntity {
  const _ConversationEntity(
      {required this.id,
      required final List<String> memberIds,
      this.lastMessage,
      required this.updatedAt,
      this.receiver})
      : _memberIds = memberIds;

  @override
  final String id;
  final List<String> _memberIds;
  @override
  List<String> get memberIds {
    if (_memberIds is EqualUnmodifiableListView) return _memberIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memberIds);
  }

  @override
  final ChatMessageEntity? lastMessage;
  @override
  final DateTime updatedAt;
  @override
  final ChatUserEntity? receiver;

  /// Create a copy of ConversationEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConversationEntityCopyWith<_ConversationEntity> get copyWith =>
      __$ConversationEntityCopyWithImpl<_ConversationEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConversationEntity &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._memberIds, _memberIds) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.receiver, receiver) ||
                other.receiver == receiver));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_memberIds),
      lastMessage,
      updatedAt,
      receiver);

  @override
  String toString() {
    return 'ConversationEntity(id: $id, memberIds: $memberIds, lastMessage: $lastMessage, updatedAt: $updatedAt, receiver: $receiver)';
  }
}

/// @nodoc
abstract mixin class _$ConversationEntityCopyWith<$Res>
    implements $ConversationEntityCopyWith<$Res> {
  factory _$ConversationEntityCopyWith(
          _ConversationEntity value, $Res Function(_ConversationEntity) _then) =
      __$ConversationEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      List<String> memberIds,
      ChatMessageEntity? lastMessage,
      DateTime updatedAt,
      ChatUserEntity? receiver});
}

/// @nodoc
class __$ConversationEntityCopyWithImpl<$Res>
    implements _$ConversationEntityCopyWith<$Res> {
  __$ConversationEntityCopyWithImpl(this._self, this._then);

  final _ConversationEntity _self;
  final $Res Function(_ConversationEntity) _then;

  /// Create a copy of ConversationEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? memberIds = null,
    Object? lastMessage = freezed,
    Object? updatedAt = null,
    Object? receiver = freezed,
  }) {
    return _then(_ConversationEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      memberIds: null == memberIds
          ? _self._memberIds
          : memberIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastMessage: freezed == lastMessage
          ? _self.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as ChatMessageEntity?,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      receiver: freezed == receiver
          ? _self.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as ChatUserEntity?,
    ));
  }
}

// dart format on
