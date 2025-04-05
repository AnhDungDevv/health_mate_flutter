import 'package:health_mate/core/network/api_client.dart';
import 'package:health_mate/src/wallet/data/model/transaction_model.dart';
import 'package:health_mate/src/wallet/data/model/wallet_model.dart';

abstract class WalletRemoteSource {
  Future<WalletModel> getWalletBalance(String userId);
  Future<List<TransactionModel>> getTransactionHistory(String walletId);
  Future<void> depositWallet(String walletId, double amount);
  Future<void> withdrawWallet(String walletId, double amount);
}

class WalletRemoteSourceImpl implements WalletRemoteSource {
  final _dio = ApiClient().dio;
  @override
  Future<WalletModel> getWalletBalance(String userId) async {
    final response = await _dio.get('/wallet/$userId');
    return WalletModel.fromJson(response.data);
  }

  @override
  Future<List<TransactionModel>> getTransactionHistory(String walletId) async {
    final response = await _dio.get('/wallet/$walletId/transactions');
    return (response.data as List)
        .map((e) => TransactionModel.fromJson(e))
        .toList();
  }

  @override
  Future<void> depositWallet(String walletId, double amount) async {
    await _dio.post('/wallet/deposit',
        data: {"walletId": walletId, "amount": amount});
  }

  @override
  Future<void> withdrawWallet(String walletId, double amount) async {
    await _dio.post('/wallet/withdraw',
        data: {"walletId": walletId, "amount": amount});
  }
}
