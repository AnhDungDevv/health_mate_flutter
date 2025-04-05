import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/wallet/presentaion/app/provider/wallet_provider.dart';

class BalanceDisplay extends ConsumerWidget {
  const BalanceDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletState = ref.watch(walletProvider);

    return walletState.when(
      data: (wallet) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.grey.withAlpha((0.2 * 255).toInt()),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(
                Icons.wallet,
                color: Theme.of(context).colorScheme.primary,
                size: 16,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                " ${wallet.balance} ${wallet.currency}",
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text("Error: $err"),
    );
  }
}
