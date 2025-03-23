import 'package:flutter/material.dart';
import 'package:health_mate/src/auth/presentation/widgets/phone_input_widget.dart';
import 'package:health_mate/src/auth/presentation/widgets/social_login_options.dart';
import 'package:health_mate/src/on_boarding/presentation/widget/slider_onboarding.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    spacing: 10,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SliderOnboarding(),
                      const PhoneInputWidget(),
                      const SocialLoginOptions(),
                      _buildOrDivider(),
                      _buildTermsText()
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildOrDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        children: [
          Expanded(
              child: Divider(
            thickness: 1.2,
            color: Colors.grey,
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child:
                Text("or", style: TextStyle(fontSize: 14, color: Colors.grey)),
          ),
          Expanded(
            child: Divider(thickness: 1.2, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildTermsText() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          "By continuing you agree to the Terms of Service and Privacy Policy",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10, color: Colors.grey),
        ),
      );
}
