// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CustomerModel> _$customerModelSerializer =
    new _$CustomerModelSerializer();

class _$CustomerModelSerializer implements StructuredSerializer<CustomerModel> {
  @override
  final Iterable<Type> types = const [CustomerModel, _$CustomerModel];
  @override
  final String wireName = 'CustomerModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, CustomerModel object,
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
    return result;
  }

  @override
  CustomerModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CustomerModelBuilder();

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
      }
    }

    return result.build();
  }
}

class _$CustomerModel extends CustomerModel {
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

  factory _$CustomerModel([void Function(CustomerModelBuilder)? updates]) =>
      (new CustomerModelBuilder()..update(updates))._build();

  _$CustomerModel._(
      {required this.id,
      required this.name,
      required this.role,
      this.email,
      this.phone,
      this.avatar,
      this.referralCode})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'CustomerModel', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'CustomerModel', 'name');
    BuiltValueNullFieldError.checkNotNull(role, r'CustomerModel', 'role');
  }

  @override
  CustomerModel rebuild(void Function(CustomerModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomerModelBuilder toBuilder() => new CustomerModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomerModel &&
        id == other.id &&
        name == other.name &&
        role == other.role &&
        email == other.email &&
        phone == other.phone &&
        avatar == other.avatar &&
        referralCode == other.referralCode;
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
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CustomerModel')
          ..add('id', id)
          ..add('name', name)
          ..add('role', role)
          ..add('email', email)
          ..add('phone', phone)
          ..add('avatar', avatar)
          ..add('referralCode', referralCode))
        .toString();
  }
}

class CustomerModelBuilder
    implements Builder<CustomerModel, CustomerModelBuilder> {
  _$CustomerModel? _$v;

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

  CustomerModelBuilder();

  CustomerModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _role = $v.role;
      _email = $v.email;
      _phone = $v.phone;
      _avatar = $v.avatar;
      _referralCode = $v.referralCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CustomerModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CustomerModel;
  }

  @override
  void update(void Function(CustomerModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CustomerModel build() => _build();

  _$CustomerModel _build() {
    final _$result = _$v ??
        new _$CustomerModel._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'CustomerModel', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'CustomerModel', 'name'),
          role: BuiltValueNullFieldError.checkNotNull(
              role, r'CustomerModel', 'role'),
          email: email,
          phone: phone,
          avatar: avatar,
          referralCode: referralCode,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
