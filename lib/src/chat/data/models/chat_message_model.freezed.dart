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
mixin _$ChatMessageModel {
  String get id;
  String get conversationId;
  String get senderId;
  String get receiverId;
  String get type;
  String get content;
  DateTime get timestamp;
  bool get isRead;

  /// Create a copy of ChatMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatMessageModelCopyWith<ChatMessageModel> get copyWith =>
      _$ChatMessageModelCopyWithImpl<ChatMessageModel>(
          this as ChatMessageModel, _$identity);

  /// Serializes this ChatMessageModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatMessageModel &&
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
    return 'ChatMessageModel(id: $id, conversationId: $conversationId, senderId: $senderId, receiverId: $receiverId, type: $type, content: $content, timestamp: $timestamp, isRead: $isRead)';
  }
}

/// @nodoc
abstract mixin class $ChatMessageModelCopyWith<$Res> {
  factory $ChatMessageModelCopyWith(
          ChatMessageModel value, $Res Function(ChatMessageModel) _then) =
      _$ChatMessageModelCopyWithImpl;
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
class _$ChatMessageModelCopyWithImpl<$Res>
    implements $ChatMessageModelCopyWith<$Res> {
  _$ChatMessageModelCopyWithImpl(this._self, this._then);

  final ChatMessageModel _self;
  final $Res Function(ChatMessageModel) _then;

  /// Create a copy of ChatMessageModel
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
class _ChatMessageModel extends ChatMessageModel {
  const _ChatMessageModel(
      {required this.id,
      required this.conversationId,
      required this.senderId,
      required this.receiverId,
      required this.type,
      required this.content,
      required this.timestamp,
      required this.isRead})
      : super._();
  factory _ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);

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

  /// Create a copy of ChatMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatMessageModelCopyWith<_ChatMessageModel> get copyWith =>
      __$ChatMessageModelCopyWithImpl<_ChatMessageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatMessageModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatMessageModel &&
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
    return 'ChatMessageModel(id: $id, conversationId: $conversationId, senderId: $senderId, receiverId: $receiverId, type: $type, content: $content, timestamp: $timestamp, isRead: $isRead)';
  }
}

/// @nodoc
abstract mixin class _$ChatMessageModelCopyWith<$Res>
    implements $ChatMessageModelCopyWith<$Res> {
  factory _$ChatMessageModelCopyWith(
          _ChatMessageModel value, $Res Function(_ChatMessageModel) _then) =
      __$ChatMessageModelCopyWithImpl;
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
class __$ChatMessageModelCopyWithImpl<$Res>
    implements _$ChatMessageModelCopyWith<$Res> {
  __$ChatMessageModelCopyWithImpl(this._self, this._then);

  final _ChatMessageModel _self;
  final $Res Function(_ChatMessageModel) _then;

  /// Create a copy of ChatMessageModel
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
    return _then(_ChatMessageModel(
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
