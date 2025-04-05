// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WalletModel> _$walletModelSerializer = new _$WalletModelSerializer();

class _$WalletModelSerializer implements StructuredSerializer<WalletModel> {
  @override
  final Iterable<Type> types = const [WalletModel, _$WalletModel];
  @override
  final String wireName = 'WalletModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, WalletModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
      'balance',
      serializers.serialize(object.balance,
          specifiedType: const FullType(double)),
      'currency',
      serializers.serialize(object.currency,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  WalletModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WalletModelBuilder();

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
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'balance':
          result.balance = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'currency':
          result.currency = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$WalletModel extends WalletModel {
  @override
  final String id;
  @override
  final String userId;
  @override
  final double balance;
  @override
  final String currency;

  factory _$WalletModel([void Function(WalletModelBuilder)? updates]) =>
      (new WalletModelBuilder()..update(updates))._build();

  _$WalletModel._(
      {required this.id,
      required this.userId,
      required this.balance,
      required this.currency})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'WalletModel', 'id');
    BuiltValueNullFieldError.checkNotNull(userId, r'WalletModel', 'userId');
    BuiltValueNullFieldError.checkNotNull(balance, r'WalletModel', 'balance');
    BuiltValueNullFieldError.checkNotNull(currency, r'WalletModel', 'currency');
  }

  @override
  WalletModel rebuild(void Function(WalletModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WalletModelBuilder toBuilder() => new WalletModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WalletModel &&
        id == other.id &&
        userId == other.userId &&
        balance == other.balance &&
        currency == other.currency;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, balance.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WalletModel')
          ..add('id', id)
          ..add('userId', userId)
          ..add('balance', balance)
          ..add('currency', currency))
        .toString();
  }
}

class WalletModelBuilder implements Builder<WalletModel, WalletModelBuilder> {
  _$WalletModel? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  double? _balance;
  double? get balance => _$this._balance;
  set balance(double? balance) => _$this._balance = balance;

  String? _currency;
  String? get currency => _$this._currency;
  set currency(String? currency) => _$this._currency = currency;

  WalletModelBuilder();

  WalletModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _balance = $v.balance;
      _currency = $v.currency;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WalletModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WalletModel;
  }

  @override
  void update(void Function(WalletModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WalletModel build() => _build();

  _$WalletModel _build() {
    final _$result = _$v ??
        new _$WalletModel._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'WalletModel', 'id'),
          userId: BuiltValueNullFieldError.checkNotNull(
              userId, r'WalletModel', 'userId'),
          balance: BuiltValueNullFieldError.checkNotNull(
              balance, r'WalletModel', 'balance'),
          currency: BuiltValueNullFieldError.checkNotNull(
              currency, r'WalletModel', 'currency'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
