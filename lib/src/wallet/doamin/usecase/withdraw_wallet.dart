import 'package:health_mate/src/wallet/doamin/repo/wallet_repo.dart';

class WithdrawWalletUsecase {
  final WalletRepository repository;
  WithdrawWalletUsecase(this.repository);

  Future<void> call(String walletId, double amount) {
    return repository.withdrawWallet(walletId, amount);
  }
}
