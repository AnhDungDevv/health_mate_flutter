// splash_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/src/auth/presentation/app/providers/auth_providers.dart';
import 'package:health_mate/src/auth/presentation/app/states/auth_state.dart';
import 'package:health_mate/src/user/data/models/user_model.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  double _opacity = 0.0;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _opacity = 1.0;
        });
      }
    });

    Future.microtask(() {
      ref.read(authNotifierProvider.notifier).quickCheckAuth();
    });
  }

  void _navigateBasedOnAuth(AuthState authState) {
    if (!mounted || _hasNavigated) return;

    _hasNavigated = true;

    if (authState.status != AuthStatus.authenticated ||
        authState.authData == null) {
      Navigator.pushReplacementNamed(context, RoutesName.onboardingView);
      return;
    }

    final role = authState.authData!.user.role;
    final nextRoute = role == Role.customer
        ? RoutesName.homeCustomerView
        : RoutesName.homeConsultantView;

    Navigator.pushReplacementNamed(context, nextRoute);
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider); // Kiểm tra giá trị
    print("👀 Current AuthState: $authState");

    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      print("🔄 AuthState changed: $previous → $next");
      _navigateBasedOnAuth(next);
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.health_and_safety,
              size: 100,
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            AnimatedOpacity(
              duration: const Duration(seconds: 2),
              opacity: _opacity,
              child: const Text(
                'Health Mate',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
