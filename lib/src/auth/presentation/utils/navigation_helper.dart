import 'package:flutter/widgets.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/src/user/data/models/user_model.dart';

class NavigationHelper {
  static void navigateToNextStep(BuildContext context, int step, Role role) {
    final String nextRoute;
    switch (step) {
      case 2:
        nextRoute = role == Role.customer
            ? RoutesName.customerInfoView
            : RoutesName.consultantInfoView1;
        break;
      case 3:
        nextRoute = role == Role.customer
            ? RoutesName.customerInterestView
            : RoutesName.consultantInfoView2;
        break;
      default:
        if (role == Role.customer) {
          nextRoute = RoutesName.homeCustomerView;
        } else {
          nextRoute = RoutesName.homeConsultantView;
        }
    }

    Navigator.pushNamed(context, nextRoute);
  }
}
