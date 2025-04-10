import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/error/logger.dart';
import 'package:health_mate/core/network/ws.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/src/auth/presentation/app/providers/auth_providers.dart';
import 'package:health_mate/src/auth/presentation/app/states/auth_state.dart';
import 'package:health_mate/src/profile/data/model/role.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  double _opacity = 0.0;
  bool _hasNavigated = false;
  final _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    _initSplash();
  }

  Future<void> _initSplash() async {
    _setupNotification();
    _fadeIn();
  }

  void _fadeIn() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  Future<void> _setupNotification() async {
    try {
      await _firebaseMessaging.requestPermission();
      final token = await _firebaseMessaging.getToken();
      AppLogger.info("🔐 FCM Token: $token");

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        AppLogger.info(
            "📩 Foreground Notification: ${message.notification?.title}");
      });
    } catch (e) {
      AppLogger.error("🔥 Error initializing FCM: $e");
    }
  }

  void _navigateBasedOnAuth(AuthState authState) {
    if (!mounted || _hasNavigated) return;
    _hasNavigated = true;

    if (authState.status != AuthStatus.authenticated ||
        authState.authData == null) {
      Navigator.popAndPushNamed(context, RoutesName.onboardingView);
      return;
    }

    final user = authState.authData!.user;
    final socketUrl = 'ws://192.168.0.101:5000/api/v1/ws?user_id=${user.id}';
    WebSocketSingleton.init(socketUrl);

    final nextRoute = user.role == Role.customer
        ? RoutesName.mainLayoutCustomerView
        : RoutesName.mainLayoutConsultantView;

    Navigator.popAndPushNamed(context, nextRoute);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<AuthState>>(authNotifierProvider, (prev, next) {
      next.when(
        data: _navigateBasedOnAuth,
        loading: () {}, // Optional: Hiển thị loading nếu cần
        error: (err, stack) => AppLogger.debug("⚠️ Auth Error: $err"),
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.health_and_safety, size: 100, color: Colors.green),
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
