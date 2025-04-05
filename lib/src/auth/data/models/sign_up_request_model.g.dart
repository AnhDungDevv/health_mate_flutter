// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SignUpRequestModel> _$signUpRequestModelSerializer =
    new _$SignUpRequestModelSerializer();

class _$SignUpRequestModelSerializer
    implements StructuredSerializer<SignUpRequestModel> {
  @override
  final Iterable<Type> types = const [SignUpRequestModel, _$SignUpRequestModel];
  @override
  final String wireName = 'SignUpRequestModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SignUpRequestModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'role',
      serializers.serialize(object.role, specifiedType: const FullType(Role)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.referralCode;
    if (value != null) {
      result
        ..add('referralCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.avatar;
    if (value != null) {
      result
        ..add('avatar')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.country;
    if (value != null) {
      result
        ..add('country')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bio;
    if (value != null) {
      result
        ..add('bio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SignUpRequestModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SignUpRequestModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'referralCode':
          result.referralCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'avatar':
          result.avatar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(Role))! as Role;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SignUpRequestModel extends SignUpRequestModel {
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? phone;
  @override
  final String? referralCode;
  @override
  final String? avatar;
  @override
  final Role role;
  @override
  final String? country;
  @override
  final String? bio;
  @override
  final String? city;

  factory _$SignUpRequestModel(
          [void Function(SignUpRequestModelBuilder)? updates]) =>
      (new SignUpRequestModelBuilder()..update(updates))._build();

  _$SignUpRequestModel._(
      {this.name,
      this.email,
      this.password,
      this.phone,
      this.referralCode,
      this.avatar,
      required this.role,
      this.country,
      this.bio,
      this.city})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(role, r'SignUpRequestModel', 'role');
  }

  @override
  SignUpRequestModel rebuild(
          void Function(SignUpRequestModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignUpRequestModelBuilder toBuilder() =>
      new SignUpRequestModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignUpRequestModel &&
        name == other.name &&
        email == other.email &&
        password == other.password &&
        phone == other.phone &&
        referralCode == other.referralCode &&
        avatar == other.avatar &&
        role == other.role &&
        country == other.country &&
        bio == other.bio &&
        city == other.city;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, referralCode.hashCode);
    _$hash = $jc(_$hash, avatar.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jc(_$hash, bio.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SignUpRequestModel')
          ..add('name', name)
          ..add('email', email)
          ..add('password', password)
          ..add('phone', phone)
          ..add('referralCode', referralCode)
          ..add('avatar', avatar)
          ..add('role', role)
          ..add('country', country)
          ..add('bio', bio)
          ..add('city', city))
        .toString();
  }
}

class SignUpRequestModelBuilder
    implements Builder<SignUpRequestModel, SignUpRequestModelBuilder> {
  _$SignUpRequestModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _referralCode;
  String? get referralCode => _$this._referralCode;
  set referralCode(String? referralCode) => _$this._referralCode = referralCode;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  Role? _role;
  Role? get role => _$this._role;
  set role(Role? role) => _$this._role = role;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  SignUpRequestModelBuilder();

  SignUpRequestModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _email = $v.email;
      _password = $v.password;
      _phone = $v.phone;
      _referralCode = $v.referralCode;
      _avatar = $v.avatar;
      _role = $v.role;
      _country = $v.country;
      _bio = $v.bio;
      _city = $v.city;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignUpRequestModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SignUpRequestModel;
  }

  @override
  void update(void Function(SignUpRequestModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SignUpRequestModel build() => _build();

  _$SignUpRequestModel _build() {
    final _$result = _$v ??
        new _$SignUpRequestModel._(
          name: name,
          email: email,
          password: password,
          phone: phone,
          referralCode: referralCode,
          avatar: avatar,
          role: BuiltValueNullFieldError.checkNotNull(
              role, r'SignUpRequestModel', 'role'),
          country: country,
          bio: bio,
          city: city,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
