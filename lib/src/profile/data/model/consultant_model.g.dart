// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultant_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConsultantModel> _$consultantModelSerializer =
    new _$ConsultantModelSerializer();

class _$ConsultantModelSerializer
    implements StructuredSerializer<ConsultantModel> {
  @override
  final Iterable<Type> types = const [ConsultantModel, _$ConsultantModel];
  @override
  final String wireName = 'ConsultantModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, ConsultantModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'role',
      serializers.serialize(object.role, specifiedType: const FullType(Role)),
    ];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
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
    value = object.avatar;
    if (value != null) {
      result
        ..add('avatar')
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
    value = object.bio;
    if (value != null) {
      result
        ..add('bio')
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
  ConsultantModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConsultantModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(Role))! as Role;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'avatar':
          result.avatar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'referralCode':
          result.referralCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
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

class _$ConsultantModel extends ConsultantModel {
  @override
  final String id;
  @override
  final String name;
  @override
  final Role role;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? avatar;
  @override
  final String? referralCode;
  @override
  final String? bio;
  @override
  final String? country;
  @override
  final String? city;

  factory _$ConsultantModel([void Function(ConsultantModelBuilder)? updates]) =>
      (new ConsultantModelBuilder()..update(updates))._build();

  _$ConsultantModel._(
      {required this.id,
      required this.name,
      required this.role,
      this.email,
      this.phone,
      this.avatar,
      this.referralCode,
      this.bio,
      this.country,
      this.city})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'ConsultantModel', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'ConsultantModel', 'name');
    BuiltValueNullFieldError.checkNotNull(role, r'ConsultantModel', 'role');
  }

  @override
  ConsultantModel rebuild(void Function(ConsultantModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConsultantModelBuilder toBuilder() =>
      new ConsultantModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConsultantModel &&
        id == other.id &&
        name == other.name &&
        role == other.role &&
        email == other.email &&
        phone == other.phone &&
        avatar == other.avatar &&
        referralCode == other.referralCode &&
        bio == other.bio &&
        country == other.country &&
        city == other.city;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, avatar.hashCode);
    _$hash = $jc(_$hash, referralCode.hashCode);
    _$hash = $jc(_$hash, bio.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConsultantModel')
          ..add('id', id)
          ..add('name', name)
          ..add('role', role)
          ..add('email', email)
          ..add('phone', phone)
          ..add('avatar', avatar)
          ..add('referralCode', referralCode)
          ..add('bio', bio)
          ..add('country', country)
          ..add('city', city))
        .toString();
  }
}

class ConsultantModelBuilder
    implements Builder<ConsultantModel, ConsultantModelBuilder> {
  _$ConsultantModel? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  Role? _role;
  Role? get role => _$this._role;
  set role(Role? role) => _$this._role = role;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  String? _referralCode;
  String? get referralCode => _$this._referralCode;
  set referralCode(String? referralCode) => _$this._referralCode = referralCode;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  ConsultantModelBuilder();

  ConsultantModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _role = $v.role;
      _email = $v.email;
      _phone = $v.phone;
      _avatar = $v.avatar;
      _referralCode = $v.referralCode;
      _bio = $v.bio;
      _country = $v.country;
      _city = $v.city;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConsultantModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConsultantModel;
  }

  @override
  void update(void Function(ConsultantModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConsultantModel build() => _build();

  _$ConsultantModel _build() {
    final _$result = _$v ??
        new _$ConsultantModel._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'ConsultantModel', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'ConsultantModel', 'name'),
          role: BuiltValueNullFieldError.checkNotNull(
              role, r'ConsultantModel', 'role'),
          email: email,
          phone: phone,
          avatar: avatar,
          referralCode: referralCode,
          bio: bio,
          country: country,
          city: city,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
