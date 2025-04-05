// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PaymentModel> _$paymentModelSerializer =
    new _$PaymentModelSerializer();

class _$PaymentModelSerializer implements StructuredSerializer<PaymentModel> {
  @override
  final Iterable<Type> types = const [PaymentModel, _$PaymentModel];
  @override
  final String wireName = 'PaymentModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, PaymentModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
      'amount',
      serializers.serialize(object.amount,
          specifiedType: const FullType(double)),
      'method',
      serializers.serialize(object.method,
          specifiedType: const FullType(String)),
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
  PaymentModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PaymentModelBuilder();

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
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'method':
          result.method = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
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

class _$PaymentModel extends PaymentModel {
  @override
  final String id;
  @override
  final String userId;
  @override
  final double amount;
  @override
  final String method;
  @override
  final String status;
  @override
  final DateTime createdAt;

  factory _$PaymentModel([void Function(PaymentModelBuilder)? updates]) =>
      (new PaymentModelBuilder()..update(updates))._build();

  _$PaymentModel._(
      {required this.id,
      required this.userId,
      required this.amount,
      required this.method,
      required this.status,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'PaymentModel', 'id');
    BuiltValueNullFieldError.checkNotNull(userId, r'PaymentModel', 'userId');
    BuiltValueNullFieldError.checkNotNull(amount, r'PaymentModel', 'amount');
    BuiltValueNullFieldError.checkNotNull(method, r'PaymentModel', 'method');
    BuiltValueNullFieldError.checkNotNull(status, r'PaymentModel', 'status');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'PaymentModel', 'createdAt');
  }

  @override
  PaymentModel rebuild(void Function(PaymentModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaymentModelBuilder toBuilder() => new PaymentModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentModel &&
        id == other.id &&
        userId == other.userId &&
        amount == other.amount &&
        method == other.method &&
        status == other.status &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, method.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaymentModel')
          ..add('id', id)
          ..add('userId', userId)
          ..add('amount', amount)
          ..add('method', method)
          ..add('status', status)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class PaymentModelBuilder
    implements Builder<PaymentModel, PaymentModelBuilder> {
  _$PaymentModel? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  String? _method;
  String? get method => _$this._method;
  set method(String? method) => _$this._method = method;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  PaymentModelBuilder();

  PaymentModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _amount = $v.amount;
      _method = $v.method;
      _status = $v.status;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaymentModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PaymentModel;
  }

  @override
  void update(void Function(PaymentModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaymentModel build() => _build();

  _$PaymentModel _build() {
    final _$result = _$v ??
        new _$PaymentModel._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'PaymentModel', 'id'),
          userId: BuiltValueNullFieldError.checkNotNull(
              userId, r'PaymentModel', 'userId'),
          amount: BuiltValueNullFieldError.checkNotNull(
              amount, r'PaymentModel', 'amount'),
          method: BuiltValueNullFieldError.checkNotNull(
              method, r'PaymentModel', 'method'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'PaymentModel', 'status'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'PaymentModel', 'createdAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
