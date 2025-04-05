import 'package:health_mate/src/wallet/data/model/transaction_model.dart';
import 'package:health_mate/src/wallet/data/model/wallet_model.dart';
import 'package:health_mate/src/wallet/data/source/remote_data_source.dart';
import 'package:health_mate/src/wallet/doamin/entities/transaction_entity.dart';
import 'package:health_mate/src/wallet/doamin/entities/wallet_entity.dart';
import 'package:health_mate/src/wallet/doamin/repo/wallet_repo.dart';

class WalletRepositoryImpl implements WalletRepository {
  final WalletRemoteSource remoteSource;

  WalletRepositoryImpl(this.remoteSource);

  @override
  Future<WalletEntity> getWalletBalance(String userId) async {
    try {
      final WalletModel responseModel =
          await remoteSource.getWalletBalance(userId);
      return responseModel.toEntity();
    } catch (e) {
      throw Exception("Error");
    }
  }

  @override
  Future<List<TransactionEntity>> getTransactionHistory(String walletId) async {
    try {
      final List<TransactionModel> responseModel =
          await remoteSource.getTransactionHistory(walletId);
      return responseModel.map((e) => e.toEntity()).toList();
    } catch (e) {
      throw Exception('Error');
    }
  }

  @override
  Future<void> depositWallet(String walletId, double amount) async {
    await remoteSource.depositWallet(walletId, amount);
  }

  @override
  Future<void> withdrawWallet(String walletId, double amount) async {
    await remoteSource.withdrawWallet(walletId, amount);
  }
}
