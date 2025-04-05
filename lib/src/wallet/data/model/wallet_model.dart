import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:health_mate/core/serializer/serializers.dart';
import 'package:health_mate/src/wallet/doamin/entities/wallet_entity.dart';

part 'wallet_model.g.dart';

abstract class WalletModel implements Built<WalletModel, WalletModelBuilder> {
  // Define the fields
  String get id;
  String get userId;
  double get balance;
  String get currency;

  // Private constructor
  WalletModel._();

  // Factory constructor that uses the builder to create the object
  factory WalletModel([void Function(WalletModelBuilder) updates]) =
      _$WalletModel;

  // Serialize this instance to a Map<String, dynamic> (JSON)
  Map<String, dynamic> toJson() {
    return serializers.serializeWith(WalletModel.serializer, this)
            as Map<String, dynamic>? ??
        {};
  }

  // Deserialize from a Map<String, dynamic> (JSON) to an instance
  static WalletModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(WalletModel.serializer, json)!;
  }

  // 🔹 Convert Model to Entity
  WalletEntity toEntity() {
    return WalletEntity(
      id: id,
      userId: userId,
      balance: balance,
      currency: currency,
    );
  }

  // 🔹 Convert Entity to Model
  static WalletModel fromEntity(WalletEntity entity) {
    return WalletModel((b) => b
      ..id = entity.id
      ..userId = entity.userId
      ..balance = entity.balance
      ..currency = entity.currency);
  }

  static Serializer<WalletModel> get serializer => _$walletModelSerializer;
}
