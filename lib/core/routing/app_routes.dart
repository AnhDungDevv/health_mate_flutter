import 'package:flutter/material.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/src/auth/presentation/views/sign_in/sign_in_view.dart';
import 'package:health_mate/src/on_boarding/presentation/views/onboarding_views.dart';
import 'package:health_mate/src/auth/presentation/views/register/siign_up_screen.dart';
import 'package:health_mate/src/auth/presentation/views/register/verify_phone_view.dart';

class Routes {
  static Route<dynamic> generatedRoutes(RouteSettings settings) {
    final routes = {
      RoutesName.onboardingView: const OnboardingScreen(),
      RoutesName.signUpView: const SignUpScreen(),
      RoutesName.verifyPhoneView: const VerifyPhoneScreen(),
      RoutesName.signInView: const SignInScreen(),
    };

    final screen = routes[settings.name];

    return MaterialPageRoute(
      builder: (_) =>
          screen ??
          const Scaffold(body: Center(child: Text("Route Not Found"))),
    );
  }
}
