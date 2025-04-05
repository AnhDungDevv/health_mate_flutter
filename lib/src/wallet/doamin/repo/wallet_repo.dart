import 'package:health_mate/src/wallet/doamin/entities/transaction_entity.dart';
import 'package:health_mate/src/wallet/doamin/entities/wallet_entity.dart';

abstract class WalletRepository {
  Future<WalletEntity> getWalletBalance(String userId);
  Future<List<TransactionEntity>> getTransactionHistory(String walletId);
  Future<void> depositWallet(String walletId, double amount);
  Future<void> withdrawWallet(String walletId, double amount);
}
