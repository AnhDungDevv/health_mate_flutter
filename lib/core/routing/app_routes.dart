import 'package:flutter/material.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/src/auth/presentation/views/register/choose_role_views.dart';
import 'package:health_mate/src/auth/presentation/views/register/consultant-information.dart';
import 'package:health_mate/src/auth/presentation/views/register/consultant_information_2.dart';
import 'package:health_mate/src/auth/presentation/views/register/customer_infomation.dart';
import 'package:health_mate/src/auth/presentation/views/register/customer_select_interest.dart';
import 'package:health_mate/src/auth/presentation/views/sign_in/sign_in_view.dart';
import 'package:health_mate/src/on_boarding/presentation/views/onboarding_views.dart';
import 'package:health_mate/src/auth/presentation/views/register/verify_phone_view.dart';

import 'app_page_route.dart'; // Import file quản lý hiệu ứng

class Routes {
  static Route<dynamic> generatedRoutes(RouteSettings settings) {
    final Map<String, Widget> routes = {
      RoutesName.onboardingView: const OnboardingScreen(),
      RoutesName.signUpView: const SignUpScreen(),
      RoutesName.verifyPhoneView: const VerifyPhoneScreen(),
      RoutesName.signInView: const SignInScreen(),
      RoutesName.customerInfoView: const CustomerInfoScreen(),
      RoutesName.customerInterestView: const CustomerSelectInterest(),
      RoutesName.consultantInfoView1: const ConsultantInfoView1(),
      RoutesName.consultantInfoView2: const ConsultantInfoView2(),
    };

    final screen = routes[settings.name];

    if (screen == null) {
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text("Route Not Found")),
        ),
      );
    }

    return AppPageRoute(
      page: screen,
      transitionType:
          _transitionMap[settings.name] ?? TransitionType.slideRight,
    );
  }

  static final Map<String, TransitionType> _transitionMap = {
    RoutesName.signUpView: TransitionType.fade,
    RoutesName.verifyPhoneView: TransitionType.slideLeft,
    RoutesName.signInView: TransitionType.scale,
  };
}
