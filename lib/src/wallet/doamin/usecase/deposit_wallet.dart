import 'package:health_mate/src/wallet/doamin/repo/wallet_repo.dart';

class DepositWalletUsecase {
  final WalletRepository repository;
  DepositWalletUsecase(this.repository);

  Future<void> call(String walletId, double amount) {
    return repository.depositWallet(walletId, amount);
  }
}
