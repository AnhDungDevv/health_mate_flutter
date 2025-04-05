// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TransactionModel> _$transactionModelSerializer =
    new _$TransactionModelSerializer();

class _$TransactionModelSerializer
    implements StructuredSerializer<TransactionModel> {
  @override
  final Iterable<Type> types = const [TransactionModel, _$TransactionModel];
  @override
  final String wireName = 'TransactionModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, TransactionModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'walletId',
      serializers.serialize(object.walletId,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'amount',
      serializers.serialize(object.amount,
          specifiedType: const FullType(double)),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  TransactionModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransactionModelBuilder();

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
        case 'walletId':
          result.walletId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$TransactionModel extends TransactionModel {
  @override
  final String id;
  @override
  final String walletId;
  @override
  final String type;
  @override
  final double amount;
  @override
  final String status;
  @override
  final DateTime createdAt;

  factory _$TransactionModel(
          [void Function(TransactionModelBuilder)? updates]) =>
      (new TransactionModelBuilder()..update(updates))._build();

  _$TransactionModel._(
      {required this.id,
      required this.walletId,
      required this.type,
      required this.amount,
      required this.status,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'TransactionModel', 'id');
    BuiltValueNullFieldError.checkNotNull(
        walletId, r'TransactionModel', 'walletId');
    BuiltValueNullFieldError.checkNotNull(type, r'TransactionModel', 'type');
    BuiltValueNullFieldError.checkNotNull(
        amount, r'TransactionModel', 'amount');
    BuiltValueNullFieldError.checkNotNull(
        status, r'TransactionModel', 'status');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'TransactionModel', 'createdAt');
  }

  @override
  TransactionModel rebuild(void Function(TransactionModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionModelBuilder toBuilder() =>
      new TransactionModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransactionModel &&
        id == other.id &&
        walletId == other.walletId &&
        type == other.type &&
        amount == other.amount &&
        status == other.status &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, walletId.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TransactionModel')
          ..add('id', id)
          ..add('walletId', walletId)
          ..add('type', type)
          ..add('amount', amount)
          ..add('status', status)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class TransactionModelBuilder
    implements Builder<TransactionModel, TransactionModelBuilder> {
  _$TransactionModel? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _walletId;
  String? get walletId => _$this._walletId;
  set walletId(String? walletId) => _$this._walletId = walletId;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  TransactionModelBuilder();

  TransactionModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _walletId = $v.walletId;
      _type = $v.type;
      _amount = $v.amount;
      _status = $v.status;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransactionModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransactionModel;
  }

  @override
  void update(void Function(TransactionModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransactionModel build() => _build();

  _$TransactionModel _build() {
    final _$result = _$v ??
        new _$TransactionModel._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'TransactionModel', 'id'),
          walletId: BuiltValueNullFieldError.checkNotNull(
              walletId, r'TransactionModel', 'walletId'),
          type: BuiltValueNullFieldError.checkNotNull(
              type, r'TransactionModel', 'type'),
          amount: BuiltValueNullFieldError.checkNotNull(
              amount, r'TransactionModel', 'amount'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'TransactionModel', 'status'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'TransactionModel', 'createdAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
