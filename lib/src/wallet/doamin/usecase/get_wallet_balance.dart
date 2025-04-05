import 'package:health_mate/src/wallet/doamin/entities/wallet_entity.dart';
import 'package:health_mate/src/wallet/doamin/repo/wallet_repo.dart';

class GetWalletBalanceUsecase {
  final WalletRepository repository;
  GetWalletBalanceUsecase(this.repository);

  Future<WalletEntity> call(String userId) {
    return repository.getWalletBalance(userId);
  }
}
