import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_mate/src/wallet/doamin/entities/wallet_entity.dart';

part 'wallet_model.freezed.dart';
part 'wallet_model.g.dart';

@freezed
sealed class WalletModel with _$WalletModel {
  const factory WalletModel({
    required String id,
    required String userId,
    required double balance,
    required String currency,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);

  factory WalletModel.fromEntity(WalletEntity entity) => WalletModel(
        id: entity.id,
        userId: entity.userId,
        balance: entity.balance,
        currency: entity.currency,
      );
}

extension WalletModelX on WalletModel {
  WalletEntity toEntity() => WalletEntity(
        id: id,
        userId: userId,
        balance: balance,
        currency: currency,
      );
}
