// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_request_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SignInRequestModel> _$signInRequestModelSerializer =
    new _$SignInRequestModelSerializer();

class _$SignInRequestModelSerializer
    implements StructuredSerializer<SignInRequestModel> {
  @override
  final Iterable<Type> types = const [SignInRequestModel, _$SignInRequestModel];
  @override
  final String wireName = 'SignInRequestModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SignInRequestModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SignInRequestModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SignInRequestModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SignInRequestModel extends SignInRequestModel {
  @override
  final String email;
  @override
  final String password;

  factory _$SignInRequestModel(
          [void Function(SignInRequestModelBuilder)? updates]) =>
      (new SignInRequestModelBuilder()..update(updates))._build();

  _$SignInRequestModel._({required this.email, required this.password})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        email, r'SignInRequestModel', 'email');
    BuiltValueNullFieldError.checkNotNull(
        password, r'SignInRequestModel', 'password');
  }

  @override
  SignInRequestModel rebuild(
          void Function(SignInRequestModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignInRequestModelBuilder toBuilder() =>
      new SignInRequestModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignInRequestModel &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SignInRequestModel')
          ..add('email', email)
          ..add('password', password))
        .toString();
  }
}

class SignInRequestModelBuilder
    implements Builder<SignInRequestModel, SignInRequestModelBuilder> {
  _$SignInRequestModel? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  SignInRequestModelBuilder();

  SignInRequestModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignInRequestModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SignInRequestModel;
  }

  @override
  void update(void Function(SignInRequestModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SignInRequestModel build() => _build();

  _$SignInRequestModel _build() {
    final _$result = _$v ??
        new _$SignInRequestModel._(
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'SignInRequestModel', 'email'),
          password: BuiltValueNullFieldError.checkNotNull(
              password, r'SignInRequestModel', 'password'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
