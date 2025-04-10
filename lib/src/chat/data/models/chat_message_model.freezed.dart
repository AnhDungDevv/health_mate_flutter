// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatMessageModelImpl {
  String get id;
  String get conversationId;
  String get senderId;
  String get receiverId;
  String get type;
  String get content;
  DateTime get timestamp;
  bool get isRead;

  /// Create a copy of ChatMessageModelImpl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatMessageModelImplCopyWith<ChatMessageModelImpl> get copyWith =>
      _$ChatMessageModelImplCopyWithImpl<ChatMessageModelImpl>(
          this as ChatMessageModelImpl, _$identity);

  /// Serializes this ChatMessageModelImpl to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatMessageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.isRead, isRead) || other.isRead == isRead));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, conversationId, senderId,
      receiverId, type, content, timestamp, isRead);

  @override
  String toString() {
    return 'ChatMessageModelImpl(id: $id, conversationId: $conversationId, senderId: $senderId, receiverId: $receiverId, type: $type, content: $content, timestamp: $timestamp, isRead: $isRead)';
  }
}

/// @nodoc
abstract mixin class $ChatMessageModelImplCopyWith<$Res> {
  factory $ChatMessageModelImplCopyWith(ChatMessageModelImpl value,
          $Res Function(ChatMessageModelImpl) _then) =
      _$ChatMessageModelImplCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String conversationId,
      String senderId,
      String receiverId,
      String type,
      String content,
      DateTime timestamp,
      bool isRead});
}

/// @nodoc
class _$ChatMessageModelImplCopyWithImpl<$Res>
    implements $ChatMessageModelImplCopyWith<$Res> {
  _$ChatMessageModelImplCopyWithImpl(this._self, this._then);

  final ChatMessageModelImpl _self;
  final $Res Function(ChatMessageModelImpl) _then;

  /// Create a copy of ChatMessageModelImpl
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? conversationId = null,
    Object? senderId = null,
    Object? receiverId = null,
    Object? type = null,
    Object? content = null,
    Object? timestamp = null,
    Object? isRead = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      conversationId: null == conversationId
          ? _self.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _self.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: null == isRead
          ? _self.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ChatMessageModelImpl extends ChatMessageModelImpl {
  const _ChatMessageModelImpl(
      {required this.id,
      required this.conversationId,
      required this.senderId,
      required this.receiverId,
      required this.type,
      required this.content,
      required this.timestamp,
      required this.isRead})
      : super._();
  factory _ChatMessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelImplFromJson(json);

  @override
  final String id;
  @override
  final String conversationId;
  @override
  final String senderId;
  @override
  final String receiverId;
  @override
  final String type;
  @override
  final String content;
  @override
  final DateTime timestamp;
  @override
  final bool isRead;

  /// Create a copy of ChatMessageModelImpl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatMessageModelImplCopyWith<_ChatMessageModelImpl> get copyWith =>
      __$ChatMessageModelImplCopyWithImpl<_ChatMessageModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatMessageModelImplToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatMessageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.isRead, isRead) || other.isRead == isRead));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, conversationId, senderId,
      receiverId, type, content, timestamp, isRead);

  @override
  String toString() {
    return 'ChatMessageModelImpl(id: $id, conversationId: $conversationId, senderId: $senderId, receiverId: $receiverId, type: $type, content: $content, timestamp: $timestamp, isRead: $isRead)';
  }
}

/// @nodoc
abstract mixin class _$ChatMessageModelImplCopyWith<$Res>
    implements $ChatMessageModelImplCopyWith<$Res> {
  factory _$ChatMessageModelImplCopyWith(_ChatMessageModelImpl value,
          $Res Function(_ChatMessageModelImpl) _then) =
      __$ChatMessageModelImplCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String conversationId,
      String senderId,
      String receiverId,
      String type,
      String content,
      DateTime timestamp,
      bool isRead});
}

/// @nodoc
class __$ChatMessageModelImplCopyWithImpl<$Res>
    implements _$ChatMessageModelImplCopyWith<$Res> {
  __$ChatMessageModelImplCopyWithImpl(this._self, this._then);

  final _ChatMessageModelImpl _self;
  final $Res Function(_ChatMessageModelImpl) _then;

  /// Create a copy of ChatMessageModelImpl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? conversationId = null,
    Object? senderId = null,
    Object? receiverId = null,
    Object? type = null,
    Object? content = null,
    Object? timestamp = null,
    Object? isRead = null,
  }) {
    return _then(_ChatMessageModelImpl(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      conversationId: null == conversationId
          ? _self.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _self.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: null == isRead
          ? _self.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
