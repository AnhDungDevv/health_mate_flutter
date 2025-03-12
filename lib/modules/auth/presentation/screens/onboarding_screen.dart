import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/modules/auth/presentation/states/providers/auth_providers.dart';
import 'package:health_mate/modules/auth/presentation/widgets/slider_onboarding.dart';
import 'package:health_mate/shared/styles/colors.dart';
import 'package:country_code_picker/country_code_picker.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = ref.watch(phoneControllerProvider);
    final countryCode = ref.watch(countryCodeProvider);
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final RegExp phoneRegex = RegExp(r'^\+?\d{7,15}$');
    final authOtpNotifier = ref.read(authOtpNotifierProvider.notifier);

    void handleContinue() async {
      if (!formKey.currentState!.validate()) {
        return;
      }
      try {
        await authOtpNotifier.sendOtp(phoneController.text.trim());
        Navigator.pushReplacementNamed(context, RoutesName.verifyPhoneScreen);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Lỗi: ${e.toString()}")),
        );
      }
    }

    void updatePhoneNumber() {
      final phone = phoneController.text.trim().isNotEmpty
          ? "$countryCode${phoneController.text.trim()}"
          : "";
      ref.read(registrationProvider.notifier).updateData(phone: phone);
    }

    String? validatePhone(String? value) {
      if (value == null || value.trim().isEmpty) {
        return 'Please enter your mobile number';
      }
      if (!phoneRegex.hasMatch("$countryCode$value")) {
        return 'Invalid phone number format';
      }
      return null;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Expanded(child: SliderOnboarding()),
            const SizedBox(height: 40),
            Form(
                key: formKey,
                child: _buildPhoneInput(
                    ref, phoneController, validatePhone, updatePhoneNumber)),
            const SizedBox(height: 16),
            _buildContinueButton(context, handleContinue),
            const SizedBox(height: 16),
            _buildSocialLoginOptions(),
            const SizedBox(height: 24),
            _buildTermsText(),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneInput(WidgetRef ref, TextEditingController phoneController,
      String? Function(String?) validate, Function() updatePhoneNumber) {
    final countryCode = ref.watch(countryCodeProvider);
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          CountryCodePicker(
            onChanged: (country) => ref
                .read(countryCodeProvider.notifier)
                .state = country.dialCode!,
            initialSelection: countryCode,
            favorite: const ['+1', '+84'],
            textStyle: const TextStyle(fontSize: 16, color: Colors.black),
          ),
          Container(
            height: 24,
            width: 1,
            color: Colors.grey.shade400,
            margin: const EdgeInsets.symmetric(horizontal: 8),
          ),
          Expanded(
            child: TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                hintText: "Enter your mobile number",
                border: InputBorder.none,
                isDense: true,
              ),
              validator: validate,
              onChanged: (_) => updatePhoneNumber(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContinueButton(
      BuildContext context, VoidCallback handleSendOTP) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: handleSendOTP,
      child: const Text("Continue",
          style: TextStyle(fontSize: 16, color: Colors.white)),
    );
  }

  Widget _buildSocialLoginOptions() {
    return Column(
      children: [
        const Text("or", style: TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.g_mobiledata, size: 32)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.apple, size: 32)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.facebook, size: 32)),
          ],
        ),
      ],
    );
  }

  Widget _buildTermsText() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          "By continuing you agree to the Terms of Service and Privacy Policy",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      );
}
