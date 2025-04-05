// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthDataModel> _$authDataModelSerializer =
    new _$AuthDataModelSerializer();

class _$AuthDataModelSerializer implements StructuredSerializer<AuthDataModel> {
  @override
  final Iterable<Type> types = const [AuthDataModel, _$AuthDataModel];
  @override
  final String wireName = 'AuthDataModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, AuthDataModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'accessToken',
      serializers.serialize(object.accessToken,
          specifiedType: const FullType(String)),
      'refreshToken',
      serializers.serialize(object.refreshToken,
          specifiedType: const FullType(String)),
      'user',
      serializers.serialize(object.user,
          specifiedType: const FullType(UserModel)),
      'expiresIn',
      serializers.serialize(object.expiresIn,
          specifiedType: const FullType(int)),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AuthDataModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthDataModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'accessToken':
          result.accessToken = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'refreshToken':
          result.refreshToken = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserModel))! as UserModel);
          break;
        case 'expiresIn':
          result.expiresIn = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthDataModel extends AuthDataModel {
  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final UserModel user;
  @override
  final int expiresIn;
  @override
  final String status;
  @override
  final String message;

  factory _$AuthDataModel([void Function(AuthDataModelBuilder)? updates]) =>
      (new AuthDataModelBuilder()..update(updates))._build();

  _$AuthDataModel._(
      {required this.accessToken,
      required this.refreshToken,
      required this.user,
      required this.expiresIn,
      required this.status,
      required this.message})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        accessToken, r'AuthDataModel', 'accessToken');
    BuiltValueNullFieldError.checkNotNull(
        refreshToken, r'AuthDataModel', 'refreshToken');
    BuiltValueNullFieldError.checkNotNull(user, r'AuthDataModel', 'user');
    BuiltValueNullFieldError.checkNotNull(
        expiresIn, r'AuthDataModel', 'expiresIn');
    BuiltValueNullFieldError.checkNotNull(status, r'AuthDataModel', 'status');
    BuiltValueNullFieldError.checkNotNull(message, r'AuthDataModel', 'message');
  }

  @override
  AuthDataModel rebuild(void Function(AuthDataModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthDataModelBuilder toBuilder() => new AuthDataModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthDataModel &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken &&
        user == other.user &&
        expiresIn == other.expiresIn &&
        status == other.status &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jc(_$hash, refreshToken.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, expiresIn.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthDataModel')
          ..add('accessToken', accessToken)
          ..add('refreshToken', refreshToken)
          ..add('user', user)
          ..add('expiresIn', expiresIn)
          ..add('status', status)
          ..add('message', message))
        .toString();
  }
}

class AuthDataModelBuilder
    implements Builder<AuthDataModel, AuthDataModelBuilder> {
  _$AuthDataModel? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  UserModelBuilder? _user;
  UserModelBuilder get user => _$this._user ??= new UserModelBuilder();
  set user(UserModelBuilder? user) => _$this._user = user;

  int? _expiresIn;
  int? get expiresIn => _$this._expiresIn;
  set expiresIn(int? expiresIn) => _$this._expiresIn = expiresIn;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AuthDataModelBuilder();

  AuthDataModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _refreshToken = $v.refreshToken;
      _user = $v.user.toBuilder();
      _expiresIn = $v.expiresIn;
      _status = $v.status;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthDataModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthDataModel;
  }

  @override
  void update(void Function(AuthDataModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthDataModel build() => _build();

  _$AuthDataModel _build() {
    _$AuthDataModel _$result;
    try {
      _$result = _$v ??
          new _$AuthDataModel._(
            accessToken: BuiltValueNullFieldError.checkNotNull(
                accessToken, r'AuthDataModel', 'accessToken'),
            refreshToken: BuiltValueNullFieldError.checkNotNull(
                refreshToken, r'AuthDataModel', 'refreshToken'),
            user: user.build(),
            expiresIn: BuiltValueNullFieldError.checkNotNull(
                expiresIn, r'AuthDataModel', 'expiresIn'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'AuthDataModel', 'status'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'AuthDataModel', 'message'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AuthDataModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
