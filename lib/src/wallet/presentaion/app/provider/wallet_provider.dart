import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/wallet/data/repo/wallet_repo_impl.dart';
import 'package:health_mate/src/wallet/data/source/remote_data_source.dart';
import 'package:health_mate/src/wallet/doamin/entities/wallet_entity.dart';
import 'package:health_mate/src/wallet/doamin/repo/wallet_repo.dart';
import 'package:health_mate/src/wallet/doamin/usecase/deposit_wallet.dart';
import 'package:health_mate/src/wallet/doamin/usecase/get_wallet_balance.dart';
import 'package:health_mate/src/wallet/doamin/usecase/withdraw_wallet.dart';
import 'package:health_mate/src/wallet/presentaion/app/notifier/wallet_notifier.dart';

final walletRemotesourceProvider =
    Provider<WalletRemoteSource>((ref) => WalletRemoteSourceImpl());
final walletRepoProvider = Provider<WalletRepository>(
    (ref) => WalletRepositoryImpl(ref.read(walletRemotesourceProvider)));

final depositWalletusecaseProvider = Provider<DepositWalletUsecase>(
    (ref) => DepositWalletUsecase(ref.read(walletRepoProvider)));
final getWalletProvider = Provider<GetWalletBalanceUsecase>(
    (ref) => GetWalletBalanceUsecase(ref.read(walletRepoProvider)));
final withDrawWalletUsecaseProvider = Provider<WithdrawWalletUsecase>(
    (ref) => WithdrawWalletUsecase(ref.read(walletRepoProvider)));

final walletProvider =
    StateNotifierProvider<WalletStateNotifier, AsyncValue<WalletEntity>>((ref) {
  return WalletStateNotifier(
      depositWalletUsecase: ref.read(depositWalletusecaseProvider),
      getWalletBalance: ref.read(getWalletProvider),
      withDrawWalletUsecae: ref.read(withDrawWalletUsecaseProvider));
});
