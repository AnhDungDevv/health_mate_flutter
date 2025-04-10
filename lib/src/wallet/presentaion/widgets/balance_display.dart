import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/config/color_theme_extension.dart';
import 'package:health_mate/src/auth/presentation/app/providers/auth_providers.dart';
import 'package:health_mate/src/wallet/presentaion/app/provider/wallet_provider.dart';

class BalanceDisplay extends ConsumerStatefulWidget {
  const BalanceDisplay({super.key});

  @override
  ConsumerState<BalanceDisplay> createState() => _BalanceDisplayState();
}

class _BalanceDisplayState extends ConsumerState<BalanceDisplay> {
  bool _walletLoaded = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final auth = ref.read(authNotifierProvider);
      auth.whenOrNull(
        data: (state) {
          final userId = state.authData?.user.id;
          if (!_walletLoaded && userId != null) {
            ref.read(walletProvider.notifier).loadWallet(userId);
            _walletLoaded = true;
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
                color: Theme.of(context)
                    .extension<ColorThemeExtension>()
                    ?.secondaryColorOrange,
                size: 18,
              ),
              Text(
                " ${wallet.balance}",
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
