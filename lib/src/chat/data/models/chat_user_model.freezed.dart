// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatUserModelImpl {
  String get id;
  String get name;
  String get avatarUrl;
  bool get isOnline;

  /// Create a copy of ChatUserModelImpl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatUserModelImplCopyWith<ChatUserModelImpl> get copyWith =>
      _$ChatUserModelImplCopyWithImpl<ChatUserModelImpl>(
          this as ChatUserModelImpl, _$identity);

  /// Serializes this ChatUserModelImpl to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatUserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, avatarUrl, isOnline);

  @override
  String toString() {
    return 'ChatUserModelImpl(id: $id, name: $name, avatarUrl: $avatarUrl, isOnline: $isOnline)';
  }
}

/// @nodoc
abstract mixin class $ChatUserModelImplCopyWith<$Res> {
  factory $ChatUserModelImplCopyWith(
          ChatUserModelImpl value, $Res Function(ChatUserModelImpl) _then) =
      _$ChatUserModelImplCopyWithImpl;
  @useResult
  $Res call({String id, String name, String avatarUrl, bool isOnline});
}

/// @nodoc
class _$ChatUserModelImplCopyWithImpl<$Res>
    implements $ChatUserModelImplCopyWith<$Res> {
  _$ChatUserModelImplCopyWithImpl(this._self, this._then);

  final ChatUserModelImpl _self;
  final $Res Function(ChatUserModelImpl) _then;

  /// Create a copy of ChatUserModelImpl
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatarUrl = null,
    Object? isOnline = null,
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
      avatarUrl: null == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _self.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ChatUserModelImpl extends ChatUserModelImpl {
  const _ChatUserModelImpl(
      {required this.id,
      required this.name,
      required this.avatarUrl,
      required this.isOnline})
      : super._();
  factory _ChatUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$ChatUserModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String avatarUrl;
  @override
  final bool isOnline;

  /// Create a copy of ChatUserModelImpl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatUserModelImplCopyWith<_ChatUserModelImpl> get copyWith =>
      __$ChatUserModelImplCopyWithImpl<_ChatUserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatUserModelImplToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatUserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, avatarUrl, isOnline);

  @override
  String toString() {
    return 'ChatUserModelImpl(id: $id, name: $name, avatarUrl: $avatarUrl, isOnline: $isOnline)';
  }
}

/// @nodoc
abstract mixin class _$ChatUserModelImplCopyWith<$Res>
    implements $ChatUserModelImplCopyWith<$Res> {
  factory _$ChatUserModelImplCopyWith(
          _ChatUserModelImpl value, $Res Function(_ChatUserModelImpl) _then) =
      __$ChatUserModelImplCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name, String avatarUrl, bool isOnline});
}

/// @nodoc
class __$ChatUserModelImplCopyWithImpl<$Res>
    implements _$ChatUserModelImplCopyWith<$Res> {
  __$ChatUserModelImplCopyWithImpl(this._self, this._then);

  final _ChatUserModelImpl _self;
  final $Res Function(_ChatUserModelImpl) _then;

  /// Create a copy of ChatUserModelImpl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatarUrl = null,
    Object? isOnline = null,
  }) {
    return _then(_ChatUserModelImpl(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _self.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
