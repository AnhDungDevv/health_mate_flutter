import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/auth/presentation/app/notifiers/auth_notifier.dart';
import 'package:health_mate/src/auth/presentation/app/providers/auth_providers.dart';
import 'package:health_mate/src/auth/presentation/views/sign_in/sign_in_view.dart';
import 'package:health_mate/src/home/presentation/home_customer_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(authProvider.notifier).checkLogin());
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    if (authState is AuthAuthenticated) {
      return HomeCustomerScreen();
    } else if (authState is AuthUnauthenticated) {
      return SignInScreen();
    }

    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
