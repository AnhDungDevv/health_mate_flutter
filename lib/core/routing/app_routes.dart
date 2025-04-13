import 'package:flutter/material.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/src/auth/presentation/views/register/choose_role_views.dart';
import 'package:health_mate/src/auth/presentation/views/register/consultant-information.dart';
import 'package:health_mate/src/auth/presentation/views/register/consultant_information_2.dart';
import 'package:health_mate/src/auth/presentation/views/register/customer_infomation.dart';
import 'package:health_mate/src/auth/presentation/views/register/customer_select_interest.dart';
import 'package:health_mate/src/auth/presentation/views/sign_in/sign_in_view.dart';
import 'package:health_mate/src/chat/presentaion/view/chat_view.dart';
import 'package:health_mate/src/chat/presentaion/view/conversations_view.dart';
import 'package:health_mate/src/chat/presentaion/view/search_chat_view.dart';
import 'package:health_mate/src/consultant/presentaion/views/category_specfic_view.dart';
import 'package:health_mate/src/consultant/presentaion/views/consultantion_detail_view.dart';
import 'package:health_mate/src/profile/presentaion/view/consutlant_detail_view.dart';
import 'package:health_mate/src/home/presentation/views/customer/main_layout_customer_view.dart';
import 'package:health_mate/src/home/presentation/views/consultant/home_consultant_view.dart';
import 'package:health_mate/src/home/presentation/views/customer/home_customer_view.dart';
import 'package:health_mate/src/consultant/presentaion/views/category_list_view.dart';
import 'package:health_mate/src/notification/presentaion/view/notification_customer_view.dart';
import 'package:health_mate/src/on_boarding/presentation/views/onboarding_views.dart';
import 'package:health_mate/src/auth/presentation/views/register/verify_phone_view.dart';
import 'package:health_mate/src/payment/presentaion/view/add_funds_view.dart';
import 'package:health_mate/src/profile/presentaion/view/profile_view.dart';
import 'package:health_mate/src/profile/presentaion/view/update_profile_view.dart';
import 'package:health_mate/src/search/presentation/views/search_for_consultant_view.dart';
import 'package:health_mate/src/splash/presentation/view/splash_view.dart';
import 'package:health_mate/src/wallet/presentaion/view/my_wallet.dart';
import 'package:health_mate/src/wallet/presentaion/view/refer_and_earn_view.dart';

import 'app_page_route.dart';

class Routes {
  static Route<dynamic> generatedRoutes(RouteSettings settings) {
    final Map<String, Widget> routes = {
      RoutesName.onboardingView: const OnboardingScreen(),
      RoutesName.notificationCustomerView: const NotificationCustomerView(),
      RoutesName.splashView: const SplashView(),
      RoutesName.consultantionDetailView: const ConsultationDetailsView(),
      RoutesName.consultantDetailView: const ConsultantDetailView(),
      RoutesName.categoryConsultantListView: const CategoryConsultantView(),
      RoutesName.categorySpecficView: const CategorySpecficView(),
      RoutesName.searchView: const SearchConsultantView(),
      RoutesName.updateProfileView: const UpdateProfileView(),
      RoutesName.referAndEarnView: const ReferAndEarnView(),
      RoutesName.ConversationView: const ConversationView(),
      RoutesName.chatView: ChatView(),
      RoutesName.myWalletView: const MyWalletView(),
      RoutesName.searchChatView: const SearchChatView(),
      RoutesName.addfundsView: const AddFundsView(),
      RoutesName.signUpView: const SignUpScreen(),
      RoutesName.profileView: ProfileView(),
      RoutesName.verifyPhoneView: const VerifyPhoneScreen(),
      RoutesName.signInView: const SignInScreen(),
      RoutesName.customerInfoView: const CustomerInfoScreen(),
      RoutesName.customerInterestView: const CustomerSelectInterest(),
      RoutesName.consultantInfoView1: const ConsultantInfoView1(),
      RoutesName.consultantInfoView2: const ConsultantInfoView2(),
      RoutesName.homeCustomerView: const HomeCustomerView(),
      RoutesName.homeConsultantView: const HomeConsultantScreen(),
      RoutesName.mainLayoutCustomerView: const MainLayoutCustomerView(),
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
    // Hiệu ứng chuyển đổi cho từng màn hình
    RoutesName.splashView: TransitionType.fade,
    RoutesName.onboardingView: TransitionType.slideLeft,
    RoutesName.signInView: TransitionType.scale,
    RoutesName.signUpView: TransitionType.fade,
    RoutesName.verifyPhoneView: TransitionType.slideLeft,
    RoutesName.customerInfoView: TransitionType.slideUp,
    RoutesName.customerInterestView: TransitionType.slideUp,
    RoutesName.consultantInfoView1: TransitionType.slideUp,
    RoutesName.consultantInfoView2: TransitionType.slideUp,
    RoutesName.homeCustomerView: TransitionType.fade,
    RoutesName.homeConsultantView: TransitionType.fade,
    RoutesName.mainLayoutCustomerView: TransitionType.slideRight,
    RoutesName.chatView: TransitionType.slideLeft,
    RoutesName.categoryConsultantListView: TransitionType.slideLeft,
    RoutesName.categorySpecficView: TransitionType.slideLeft,
    RoutesName.consultantDetailView: TransitionType.scale,
    RoutesName.notificationCustomerView: TransitionType.slideUp,
    RoutesName.searchView: TransitionType.slideUp,
    RoutesName.addfundsView: TransitionType.slideUp,
  };
}
