import 'package:go_router/go_router.dart';
import 'package:health_mate/modules/auth/presentation/screens/register/screens/consultant_info_screen.dart';
import 'package:health_mate/modules/auth/presentation/screens/register/screens/consultant_info_screen_2.dart';
import 'package:health_mate/modules/auth/presentation/screens/register/screens/customer_info_screen.dart';
import 'package:health_mate/modules/auth/presentation/screens/register/signup_main_screen.dart';
import 'package:health_mate/modules/auth/presentation/screens/register/screens/onboarding_screen.dart';
import 'package:health_mate/modules/auth/presentation/screens/register/screens/onboarding_selection_screen.dart';
import 'package:health_mate/modules/auth/presentation/screens/register/screens/select_interest_screen.dart';
import 'package:health_mate/modules/auth/presentation/screens/register/screens/verify_phone_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => SignupMainScreen(child: child),
      routes: [
        GoRoute(
          path: '/verify-phone',
          builder: (context, state) => const VerifyPhoneScreen(),
        ),
        GoRoute(
          path: '/onboarding-selection',
          builder: (context, state) => const OnboardingSelection(),
        ),
        GoRoute(
          path: '/customer-info',
          builder: (context, state) => const CustomerInfoScreen(),
        ),
        GoRoute(
          path: '/consultant-info',
          builder: (context, state) => const ConsultantInfoScreen(),
        ),
        GoRoute(
          path: '/select-interest',
          builder: (context, state) => const SelectInterestScreen(),
        ),
        GoRoute(
          path: '/select-interest-2',
          builder: (context, state) => const ConsultantInfoScreen2(),
        ),
      ],
    ),

    // Các màn hình có AppBar riêng
    GoRoute(
      path: '/',
      builder: (context, state) => const OnboardingScreen(),
    ),
    // GoRoute(
    //   path: '/login',
    //   builder: (context, state) => const LoginScreen(),
    // ),
  ],
);
