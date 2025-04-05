import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/wallet/doamin/entities/wallet_entity.dart';
import 'package:health_mate/src/wallet/doamin/usecase/deposit_wallet.dart';
import 'package:health_mate/src/wallet/doamin/usecase/get_wallet_balance.dart';
import 'package:health_mate/src/wallet/doamin/usecase/withdraw_wallet.dart';

class WalletStateNotifier extends StateNotifier<AsyncValue<WalletEntity>> {
  final GetWalletBalanceUsecase getWalletBalance;
  final DepositWalletUsecase depositWalletUsecase;
  final WithdrawWalletUsecase withDrawWalletUsecae;

  WalletStateNotifier(
      {required this.depositWalletUsecase,
      required this.getWalletBalance,
      required this.withDrawWalletUsecae})
      : super(const AsyncValue.loading());

  Future<void> loadWallet(String userId) async {
    state = const AsyncValue.loading();
    try {
      final wallet = await getWalletBalance(userId);
      state = AsyncValue.data(wallet);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
