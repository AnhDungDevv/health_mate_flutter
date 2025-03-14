import 'package:flutter/material.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/modules/auth/presentation/screens/onboarding_screen.dart';
import 'package:health_mate/modules/auth/presentation/screens/register/siign_up_screen.dart';
import 'package:health_mate/modules/auth/presentation/screens/register/verify_phone_screen.dart';

class Routes {
  static Route<dynamic> generatedRoutes(RouteSettings setting) {
    switch (setting.name) {
      case RoutesName.onboardingScreen:
        return _createRoute(const OnboardingScreen());
      case RoutesName.signUpScreen:
        return _createRoute(const SignUpScreen());
      case RoutesName.verifyPhoneScreen:
        return _createRoute(const VerifyPhoneScreen());
      default:
        return _createRoute(
          const Scaffold(
            body: Center(child: Text("Route Not Found")),
          ),
        );
    }
  }

  // Helper function to create a smooth animated route
  static PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.easeInOut; // Smooth curve for both entry and exit

        var slideAnimation = Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: curve,
        ));

        var fadeAnimation = Tween<double>(
          begin: 0.0, // Fade from transparent
          end: 1.0, // To fully visible
        ).animate(CurvedAnimation(
          parent: animation,
          curve: curve,
        ));

        return FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 700), // Smooth speed
      reverseTransitionDuration:
          const Duration(milliseconds: 700), // Smooth for pop too
    );
  }
}
